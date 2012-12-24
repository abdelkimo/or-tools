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
Clean first the subdirectories with the script above.
Copy files from TUTORIAL TO DEPLOY
and add Copyright statements to each source file in DEPLOY.
  
Files are also zipped and added to DEPLOY/UPLOAD/tutorials.

upload_tutorials.py:
--------------------
Upload zipped files to Google servers in the download directory.
