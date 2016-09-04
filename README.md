# GitBackup
Backup the un-committed and un-staged files of a git repository

This script may seem redundant since git will take care of all of that but it is useful when you're trying to merge 2 repositories that contain mostly the same files.

Usage example.


Backup all the changed file of the current repository (using the script).

Delete the repository (only from your file system).

Clone the new repository.

Merge the contents of the backed up folder with the new repository (folder merging, is supported by most file explorer apps).
