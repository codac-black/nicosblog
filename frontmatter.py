#!/usr/bin/env python3
import os
import re
from pathlib import Path
from datetime import datetime

def process_markdown_files(content_dir):
    """Process all markdown files to ensure proper front matter with sections"""
    
    content_path = Path(content_dir)
    
    for md_file in content_path.rglob("*.md"):
        # Skip if it's an index file or in the root
        if md_file.name == "_index.md":
            continue
            
        # Get relative path from content/posts directory
        try:
            rel_path = md_file.relative_to(content_path)
        except ValueError:
            continue
            
        folder_parts = rel_path.parts[:-1]  # All parts except filename
        
        # Read file content
        try:
            with open(md_file, 'r', encoding='utf-8') as f:
                content = f.read()
        except Exception as e:
            print(f"Error reading {md_file}: {e}")
            continue
        
        # Check if front matter exists
        front_matter_match = re.match(r'^---\s*\r?\n(.*?)\r?\n---\s*\r?\n(.*)$', content, re.DOTALL)
        
        if front_matter_match:
            front_matter_text = front_matter_match.group(1)
            body = front_matter_match.group(2)
            
            # Parse existing front matter lines
            fm_lines = front_matter_text.strip().split('\n')
            fm_dict = {}
            
            # Simple TOML-style parsing
            for line in fm_lines:
                if ':' in line:
                    key, value = line.split(':', 1)
                    fm_dict[key.strip()] = value.strip()
        else:
            # No front matter, create new
            fm_dict = {}
            body = content
        
        # Process only if we have folder structure
        if folder_parts:
            section = folder_parts[0]  # First folder is the main section
            
            # Set section
            if 'section' not in fm_dict:
                fm_dict['section'] = f'"{section}"'
            
            # Set categories based on folder structure
            if 'categories' not in fm_dict:
                categories = [f'"{part}"' for part in folder_parts]
                fm_dict['categories'] = f"[{', '.join(categories)}]"
        
        # Ensure title exists
        if 'title' not in fm_dict:
            # Use filename as title (remove extension, replace hyphens/underscores)
            title = md_file.stem.replace('-', ' ').replace('_', ' ').title()
            fm_dict['title'] = f'"{title}"'
        
        # Ensure date exists
        if 'date' not in fm_dict:
            # Use file modification time
            mtime = md_file.stat().st_mtime
            date_str = datetime.fromtimestamp(mtime).strftime('%Y-%m-%d')
            fm_dict['date'] = date_str
        
        # Build new front matter
        front_matter_lines = []
        for key, value in fm_dict.items():
            front_matter_lines.append(f"{key}: {value}")
        
        # Write updated content
        new_content = f"---\n{chr(10).join(front_matter_lines)}\n---\n{body}"
        
        try:
            with open(md_file, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"Processed: {rel_path}")
        except Exception as e:
            print(f"Error writing {md_file}: {e}")

if __name__ == "__main__":
    import sys
    
    # Get content directory from command line or use default
    if len(sys.argv) > 1:
        content_directory = sys.argv[1]
    else:
        content_directory = r"E:\Blogs\deadchronicles\content\posts"
    
    print(f"Processing markdown files in: {content_directory}")
    process_markdown_files(content_directory)