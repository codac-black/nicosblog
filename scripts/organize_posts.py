#!/usr/bin/env python3
import os
import shutil
from pathlib import Path

def create_category_dirs():
    """Create category directories if they don't exist"""
    categories = [
        'cyber-shujaa',
        'ctf/picoctf',
        'ctf/htb',
        'ctf/ms-ctf',
        'tutorials/docker',
        'tutorials/kubernetes',
        'tutorials/security-tools',
        'security'
    ]
    
    base_dir = Path('content/posts')
    for category in categories:
        (base_dir / category).mkdir(parents=True, exist_ok=True)

def move_posts():
    """Move posts to their appropriate categories"""
    posts_dir = Path('content/posts')
    
    # Define post mappings
    post_mappings = {
        'PicoCTF Forensics.md': 'ctf/picoctf/',
        'SQL Injection.md': 'security/',
        'Docker Setup.md': 'tutorials/docker/',
        'Unit 42 Wireshark Quiz, January 2023.md': 'security/'
    }
    
    # Move each post
    for post, category in post_mappings.items():
        src = posts_dir / post
        if src.exists():
            dst = posts_dir / category / post
            shutil.move(str(src), str(dst))
            print(f"Moved {post} to {category}")

if __name__ == "__main__":
    create_category_dirs()
    move_posts() 