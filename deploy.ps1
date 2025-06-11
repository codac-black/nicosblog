# PowerShell Script for Hugo to Netlify Deployment
# Set variables for Obsidian to Hugo copy
$sourcePath = "C:\Hugo\graveyard20\content\ctf\posts"
$destinationPath = "E:\Blogs\deadchronicles\content\posts"

# GitHub repository remote URL
$myrepo = "https://github.com/codac-black/nicosblog.git"

# Set error handling
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

# Change to the Hugo site's root directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $ScriptDir

# Check for required commands
$requiredCommands = @('git', 'hugo', 'robocopy')
foreach ($cmd in $requiredCommands) {
    if (-not (Get-Command $cmd -ErrorAction SilentlyContinue)) {
        Write-Error "$cmd is not installed or not in PATH."
        exit 1
    }
}

# Step 1: Sync posts from Obsidian to Hugo content folder using Robocopy
Write-Host "Syncing posts from Obsidian..."
if (-not (Test-Path $sourcePath)) {
    Write-Error "Source path does not exist: $sourcePath"
    exit 1
}

if (-not (Test-Path $destinationPath)) {
    Write-Error "Destination path does not exist: $destinationPath"
    exit 1
}

# Create category directories if they don't exist
$categories = @(
    'ctf/picoctf',
    'ctf/htb',
    'ctf/ms-ctf',
    'tutorials/docker',
    'tutorials/kubernetes',
    'tutorials/security-tools',
    'security'
)

foreach ($category in $categories) {
    $categoryPath = Join-Path $destinationPath $category
    if (-not (Test-Path $categoryPath)) {
        New-Item -ItemType Directory -Path $categoryPath -Force | Out-Null
        Write-Host "Created category directory: $category"
    }
}

# Use Robocopy to copy files without mirroring (preserve destination structure)
$robocopyOptions = @('/Z', '/W:5', '/R:3', '/E')  # Removed /MIR to preserve destination structure
$robocopyResult = robocopy $sourcePath $destinationPath @robocopyOptions

if ($LASTEXITCODE -ge 8) {
    Write-Error "Robocopy failed with exit code $LASTEXITCODE"
    exit 1
}

Write-Host "Converting Obsidian image links..."
python .\images.py

Write-Host "Processing front matter for proper sectioning..."
python .\frontmatter.py "$destinationPath"

Write-Host "Creating section index files..."
# Get all subdirectories in posts
$postDirs = Get-ChildItem -Path $destinationPath -Directory -Recurse

foreach ($dir in $postDirs) {
    $indexFile = Join-Path $dir.FullName "_index.md"
    $sectionName = $dir.Name
    $sectionTitle = $sectionName -replace '-', ' ' -replace '_', ' '
    $sectionTitle = (Get-Culture).TextInfo.ToTitleCase($sectionTitle.ToLower())
    
    if (-not (Test-Path $indexFile)) {
        $indexContent = @"
---
title: "$sectionTitle"
description: "Posts about $sectionTitle"
---

# $sectionTitle

This section contains posts related to $sectionTitle.
"@
        Set-Content -Path $indexFile -Value $indexContent -Encoding UTF8
        Write-Host "Created index for section: $sectionName"
    }
}

# Enhanced PowerShell front matter processing with recursive search
Write-Host "Processing front matter for all markdown files (recursive search)..."

# Find all markdown files recursively in the posts directory and subdirectories
$markdownFiles = Get-ChildItem -Path $destinationPath -Recurse -Filter "*.md" | Where-Object { 
    $_.Name -ne "_index.md" -and $_.Name -ne "index.md" 
}

Write-Host "Found $($markdownFiles.Count) markdown files to process..."

foreach ($file in $markdownFiles) {
    Write-Host "Processing: $($file.FullName.Replace($destinationPath, ''))"
    
    # Calculate relative path from posts directory
    $relativePath = $file.DirectoryName.Replace($destinationPath, "").TrimStart('\', '/')
    
    try {
        $content = Get-Content $file.FullName -Raw -ErrorAction Stop
        
        if ($null -ne $content -and $content.Length -gt 0) {
            # Check if front matter exists
            if ($content -match '^---[\r\n]+(.*?)[\r\n]+---[\r\n]+(.*)$') {
                $frontMatter = $matches[1]
                $body = $matches[2]
                
                # Parse existing front matter to avoid duplicates
                $frontMatterLines = $frontMatter -split "[\r\n]+"
                $hasSection = $frontMatterLines | Where-Object { $_ -match '^\s*section\s*:' }
                $hasCategories = $frontMatterLines | Where-Object { $_ -match '^\s*categories\s*:' }
                $hasTitle = $frontMatterLines | Where-Object { $_ -match '^\s*title\s*:' }
                $hasDate = $frontMatterLines | Where-Object { $_ -match '^\s*date\s*:' }
                
                $frontMatterUpdated = $false
                
                # Add title if not present
                if (-not $hasTitle) {
                    $title = [System.IO.Path]::GetFileNameWithoutExtension($file.Name) -replace '-', ' ' -replace '_', ' '
                    $title = (Get-Culture).TextInfo.ToTitleCase($title.ToLower())
                    $frontMatter += "`ntitle: `"$title`""
                    $frontMatterUpdated = $true
                }
                
                # Add date if not present
                if (-not $hasDate) {
                    $currentDate = Get-Date -Format "yyyy-MM-ddTHH:mm:ssK"
                    $frontMatter += "`ndate: $currentDate"
                    $frontMatterUpdated = $true
                }
                
                # Add section if not present and we have a relative path
                if (-not $hasSection -and $relativePath) {
                    $pathParts = $relativePath -split '[\\/]'
                    $sectionName = $pathParts[0]
                    $frontMatter += "`nsection: `"$sectionName`""
                    $frontMatterUpdated = $true
                }
                
                # Add categories if not present and we have a relative path
                if (-not $hasCategories -and $relativePath) {
                    $pathParts = $relativePath -split '[\\/]'
                    $categoryList = $pathParts | ForEach-Object { "`"$_`"" }
                    $categoriesString = $categoryList -join ', '
                    $frontMatter += "`ncategories: [$categoriesString]"
                    $frontMatterUpdated = $true
                }
                
                # Update file only if changes were made
                if ($frontMatterUpdated) {
                    $newContent = "---`n$frontMatter`n---`n$body"
                    Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8 -NoNewline
                    Write-Host "  ✓ Updated front matter"
                } else {
                    Write-Host "  - No updates needed"
                }
            }
            else {
                # No front matter exists, create complete front matter
                $title = [System.IO.Path]::GetFileNameWithoutExtension($file.Name) -replace '-', ' ' -replace '_', ' '
                $title = (Get-Culture).TextInfo.ToTitleCase($title.ToLower())
                $currentDate = Get-Date -Format "yyyy-MM-ddTHH:mm:ssK"
                
                $frontMatterContent = @"
title: "$title"
date: $currentDate
"@
                
                # Add section and categories if we have a relative path
                if ($relativePath) {
                    $pathParts = $relativePath -split '[\\/]'
                    $sectionName = $pathParts[0]
                    $categoryList = $pathParts | ForEach-Object { "`"$_`"" }
                    $categoriesString = $categoryList -join ', '
                    
                    $frontMatterContent += "`nsection: `"$sectionName`""
                    $frontMatterContent += "`ncategories: [$categoriesString]"
                }
                
                $frontMatter = @"
---
$frontMatterContent
---
"@
                $newContent = "$frontMatter`n$content"
                Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8 -NoNewline
                Write-Host "  ✓ Created complete front matter"
            }
        } else {
            Write-Host "  ⚠ Skipped (empty file)"
        }
    }
    catch {
        Write-Warning "  ✗ Failed to process $($file.Name): $($_.Exception.Message)"
    }
}

Write-Host "Front matter processing completed!"

# Step 2: Build the Hugo site
Write-Host "Building the Hugo site..."
try {
    hugo --cleanDestinationDir
} catch {
    Write-Error "Hugo build failed."
    exit 1
}

# Step 3: Add changes to Git
Write-Host "Staging changes for Git..."
$hasChanges = (git status --porcelain) -ne ""
if (-not $hasChanges) {
    Write-Host "No changes to stage."
} else {
    git add .
}

# Step 4: Commit changes with a dynamic message
$currentDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$commitMessage = "Deploying updates: $currentDateTime"
$hasStagedChanges = (git diff --cached --name-only) -ne ""
if (-not $hasStagedChanges) {
    Write-Host "No changes to commit."
} else {
    Write-Host "Committing changes..."
    git commit -m "$commitMessage"
}

# Step 5: Push changes to the main branch
Write-Host "Deploying to Netlify via GitHub..."
try {
    git push origin main
} catch {
    Write-Error "Failed to push to the main branch."
    exit 1
}

Write-Host "Deployment complete! Your site should update shortly."