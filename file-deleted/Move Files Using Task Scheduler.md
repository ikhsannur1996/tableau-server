## Batch Script Documentation: Move Files Using Task Scheduler

### Purpose:
This batch script is designed to move files from a source folder to a destination folder on a network storage location, while excluding a specific file named "permission.lock." The script is intended to be executed using the Windows Task Scheduler to automate this file movement process.

### Script Details:
- **Script Name:** move_files.bat
- **Author:** Mohamad Ikhsan Nurulloh
- **Date:** 22 August 2023

### Prerequisites:
- Windows operating system.
- Basic understanding of batch scripting and file management.

### Usage Instructions:

1. **Source Folder:** Set the source folder path where the files to be moved are located. Edit the `sourceFolder` variable in the script accordingly:
   ```batch
   set "sourceFolder=E:\Tableau\data\tabsvc\files\backups"
   ```

2. **Destination Folder:** Set the destination network storage path where the files should be moved. Edit the `destinationFolder` variable in the script:
   ```batch
   set "destinationFolder=\\STEVPA-ETL\Tableau Backup"
   ```

3. **Excluded File:** Specify the name of the file that should be excluded from the move process. Edit the `excludeFile` variable:
   ```batch
   set "excludeFile=permission.lock"
   ```

4. **Run as Scheduled Task:** To automate the file movement process, it's recommended to configure this batch script as a scheduled task using the Windows Task Scheduler. Follow these steps:
   - Open the Task Scheduler from the Start menu or Control Panel.
   - Create a new Basic Task and provide a name and description.
   - Choose the "Daily" trigger or a suitable trigger based on your requirements.
   - Select the "Start a program" action.
   - Browse and select the location of the batch script (`move_files.bat`).
   - Complete the wizard, and the script will be scheduled to run automatically.

### Script Behavior:

1. The script starts by echoing the process of moving files from the source folder to the destination network storage.

2. A loop iterates through each file in the source folder.

3. If the file name is not equal to the excluded file ("permission.lock"), the script echoes the file name being moved and performs the move operation.

4. If the file name matches the excluded file, the script skips that file and echoes a message indicating the exclusion.

5. After all files are processed, the script displays a message indicating successful completion (excluding the excluded file).

6. The script pauses at the end to allow the user to review the output.

### Note:
- Make sure to thoroughly test the script on a small set of files before deploying it as a scheduled task to ensure it works as expected.
- Use the appropriate credentials and permissions for accessing the source, destination, and network storage locations.n. Also, ensure that the script's paths, variables, and instructions are accurate based on your environment and requirements.
