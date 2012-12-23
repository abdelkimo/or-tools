Hello folks,

Short and sweet:

make_tutorials.py: 
------------------
Compile all examples.

clean_tutorials.py:
-------------------
Clean all subdirectories of all undesirable files.

deploy_tutorials.py:
--------------------
Copy files from TUTORIAL TO DEPLOY.
It also "cleans" the code:
  * OR_TOOLS_TOP is cleaned in each Makefile;
  * Copyright statements are added to each source file.
  
Files are also zipped and added to DEPLOY/UPLOAD/tutorials.

upload_tutorials.py:
--------------------
Upload zipped files to Google servers in the download directory.
