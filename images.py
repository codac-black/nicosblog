"""
This script processes markdown files in a specified directory, updates image links, 
and copies the referenced images from an attachments directory to a static images directory.
Steps:
1. Iterate through each markdown file in the posts directory.
2. Read the content of each markdown file.
3. Find all image links in the format [[image.png]], [[image.jpg]], etc.
4. Replace the image links with a new format suitable for static site generators.
5. Copy the images from the attachments directory to the static images directory if they exist.
6. Write the updated content back to the markdown file.
Directories:
- posts_dir: Directory containing the markdown files to be processed.
- attachments_dir: Directory containing the image files referenced in the markdown files.
- static_images_dir: Directory where the images will be copied to.
Dependencies:
- os: For directory and file path operations.
- re: For regular expression operations to find image links.
- shutil: For copying image files.
Note:
- The script uses raw strings (r"") for directory paths to handle Windows backslashes correctly.
"""
# import os
# import re
# import shutil

# # Paths (using raw strings to handle Windows backslashes correctly)
# posts_dir = r"E:\Blogs\deadchronicles\content\posts"
# attachments_dir = r"C:\Hugo\graveyard20\content\ctf\images"
# static_images_dir = r"E:\Blogs\deadchronicles\static\images"

# # Step 1: Process each markdown file in the posts directory
# for filename in os.listdir(posts_dir):
#     if filename.endswith(".md"):
#         filepath = os.path.join(posts_dir, filename)
        
#         with open(filepath, "r", encoding="utf-8") as file:
#             content = file.read()
        
#         # Step 2: Find all image links in the format ![Image Description](/images/Pasted%20image%20...%20.png)
#         images = re.findall(r'\[\[([^]]*\.png)\]\]', content)
#         print(f"Checking for {attachments_dir} existence: {os.path.exists(attachments_dir)}")

#         # Step 3: Replace image links and ensure URLs are correctly formatted
#         for image in images:
#             # Prepare the Markdown-compatible link with %20 replacing spaces
#             markdown_image = f"![Image Description](/images/{image.replace(' ', '%20')})"
#             content = content.replace(f"[[{image}]]", markdown_image)
            
#             # Step 4: Copy the image to the Hugo static/images directory if it exists
#             image_source = os.path.join(attachments_dir, image)
#             if os.path.exists(image_source):
#                 shutil.copy(image_source, static_images_dir)

#         # Step 5: Write the updated content back to the markdown file
#         with open(filepath, "w", encoding="utf-8") as file:
#             file.write(content)

# print("Markdown files processed and images copied successfully.")

import os
import re
import shutil

# Paths (using raw strings to handle Windows backslashes correctly)
posts_dir = r"E:\Blogs\deadchronicles\content\posts"
attachments_dir = r"C:\Hugo\graveyard20\content\ctf\images"
static_images_dir = r"E:\Blogs\deadchronicles\static\images"

# Debug: Check attachments directory
print(f"Checking for attachments_dir existence: {os.path.exists(attachments_dir)}")
if os.path.exists(attachments_dir):
    print("Available images:", os.listdir(attachments_dir))

# Process each markdown file in the posts directory
for filename in os.listdir(posts_dir):
    if filename.endswith(".md"):
        filepath = os.path.join(posts_dir, filename)
        
        with open(filepath, "r", encoding="utf-8") as file:
            content = file.read()

        # Use regex that matches both ![[...]] and [[...]]
        pattern = re.compile(r'!?\[\[([^]]*\.(?:png|jpg|jpeg|gif))\]\]', re.IGNORECASE)
        images = pattern.findall(content)
        print(f"Images found in {filename}: {images}")

        # Replace the image links in the markdown file
        def replacer(match):
            image = match.group(1)
            return f"![Image Description](/images/{image.replace(' ', '%20')})"
        
        content = pattern.sub(replacer, content)

        # Copy the image files
        for image in images:
            image_source = os.path.join(attachments_dir, image)
            if os.path.exists(image_source):
                print(f"Copying {image_source} to {static_images_dir}")
                shutil.copy(image_source, static_images_dir)
            else:
                print(f"Image {image_source} not found!")
        
        # Write the updated content back to the markdown file
        with open(filepath, "w", encoding="utf-8") as file:
            file.write(content)

print("Markdown files processed and images copied successfully.")
