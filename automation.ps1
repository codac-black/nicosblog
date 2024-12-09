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

# Use Robocopy to mirror the directories
$robocopyOptions = @('/MIR', '/Z', '/W:5', '/R:3')
$robocopyResult = robocopy $sourcePath $destinationPath @robocopyOptions

if ($LASTEXITCODE -ge 8) {
    Write-Error "Robocopy failed with exit code $LASTEXITCODE"
    exit 1
}

# Step 2: Build the Hugo site
Write-Host "Building the Hugo site..."
try {
    hugo
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
$commitMessage = "Deploying updates: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
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
