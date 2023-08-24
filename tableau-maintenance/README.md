# Tableau Log and Backup Maintenance Automation

This documentation provides a comprehensive overview of the batch scripts included in this package, detailing their purpose, functionality, and usage. These scripts are designed to automate various maintenance tasks related to Tableau log and backup files, streamlining system management and storage optimization.

## Batch Scripts Description

### 1. LogShark Analysis.bat

**Purpose:** This script automates the analysis of Tableau log files using the Tableau LogShark tool. It performs the following tasks:

- Sets the target directory where the log files are located and the directory where the LogShark tool is installed.
- Searches for the newest log archive file (`.zip`) in the target directory.
- Checks if a log archive file was found and exits if not.
- Changes the current directory to the LogShark tool's directory.
- Executes the LogShark tool on the newest log archive file, generating insights and analysis from the logs.

### 2. Remove Backup.bat

**Purpose:** This script is responsible for removing backup files older than 60 days from a specified backup directory. The tasks performed are:

- Sets the target folder for backup files to be removed.
- Utilizes the `forfiles` command to identify and delete backup files older than 60 days in a recursive manner.

### 3. Remove LogShark.bat

**Purpose:** Similar to the previous script, this batch file focuses on removing LogShark output files that are older than 60 days from a specified directory. The steps are:

- Sets the target folder for LogShark output files to be removed.
- Uses the `forfiles` command to identify and delete LogShark output files older than 60 days in a recursive manner.

### 4. Remove ZipLog.bat

**Purpose:** This script manages the removal of Tableau log archive files (`.zip`) older than 60 days from the specified directory. The actions taken are:

- Sets the target folder for log archive files to be removed.
- Utilizes the `forfiles` command to identify and delete log archive files older than 60 days in a recursive manner.

### 5. Tableau Backup.bat

**Purpose:** The purpose of this batch script is to automate the movement of Tableau backup files to a network storage location while excluding a specified exclusion file. The steps are as follows:

- Sets the source and destination folders for backup files and the name of the exclusion file.
- Loops through the backup files in the source folder and moves them to the destination folder while skipping the exclusion file.

### 6. Tableau ZipLog.bat

**Purpose:** This script automates the process of moving Tableau log archive files (`.zip`) to a network storage location, excluding a specified exclusion file. The workflow includes:

- Sets the source and destination folders for log archive files and the name of the exclusion file.
- Loops through the log archive files in the source folder and moves them to the destination folder while skipping the exclusion file.

### 7. The Tableau Cleanup.bat
**Purpose:** This batch script is designed to perform custom cleanup tasks specific to your Tableau Server environment. The script can be tailored to execute any necessary cleanup procedures, such as removing temporary files, archiving logs, or purging specific directories. As the specific tasks performed by this script can vary widely depending on your organization's requirements, you will need to provide the script content yourself to ensure it aligns with your needs.

### 8. Tableau Maintenance.bat

**Purpose:** This comprehensive batch script handles various Tableau Server maintenance tasks. It performs the following operations:

- Calculates the start and end dates for the maintenance tasks (backup, log zipping) based on the current date.
- Sets filenames for backup, log, and new backup files with timestamped names.
- Defines paths for source and destination folders for backups and log archives, and specifies an exclusion file.
- Initiates a backup of Tableau Server using the `tsm maintenance backup` command.
- Moves the generated backup file to the designated destination folder.
- Initiates log zipping using the `tsm maintenance ziplogs` command, considering the calculated start and end dates.
- Moves log archive files to the designated destination folder, excluding the exclusion file.
- Cleans up Tableau Server logs using the `tsm maintenance cleanup` command.

## Setup Instructions

1. **File Placement**: Place all the batch files in a dedicated folder (e.g., `C:\TableauMaintenance`).

2. **Edit Paths**: Open each batch file using a text editor and ensure the paths are correctly set according to your environment.

3. **Task Scheduler**:
   - Open Task Scheduler from the Windows Start menu.
   - Create a new basic task for each script:
     - Choose "Create Basic Task" and follow the wizard.
     - Set the desired schedule (daily, weekly, etc.).
     - Choose "Start a program" as the action.
     - Browse and select the corresponding batch file.
     - Complete the wizard, reviewing your settings.

4. **Test Execution**: Right-click on the newly created tasks in Task Scheduler and select "Run" to ensure successful execution.

## Note

- These scripts are provided as-is and may require adjustments to suit your specific environment.
- Ensure you have the necessary permissions to execute the tasks and access the specified directories.
