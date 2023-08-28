## Tableau Server Antivirus Exclusion Guidelines

When operating a Tableau Server environment, optimizing server performance involves strategically configuring antivirus exclusion policies. By implementing these exclusions, you can prevent potential performance bottlenecks caused by antivirus scans. To ensure Tableau Server's smooth operation, follow the guidelines below:

### Exclude Tableau Server Program Folder:

- **Windows:** Exclude `C:\Program Files\Tableau\Tableau Server`
- **Linux:** Exclude `/opt/tableau/tableau_server`

### Exclude Tableau Server Data Folder:

- **Windows:** Exclude `C:\ProgramData\Tableau\Tableau Server\data`
- **Linux:** Exclude `/var/opt/tableau/tableau_server`

> **Note:** On Windows, the ProgramData folder is often hidden by default. Adjust your operating system settings to display hidden files and folders. For comprehensive exclusion options, including files, folders, specific file types, and processes, refer to the relevant antivirus software documentation.

### Additional Considerations for Non-Default Installation Paths:
If Tableau Desktop or Tableau Prep Builder is installed on a drive other than the default one, remember that certain files and folders on the default C drive also need to be excluded. Here are the paths to whitelist for smooth operation:

- `E:\Tableau`
- `C:\Program Files\Tableau`
- `C:\ProgramData\Tableau\Tableau Server`

### Tableau Server Services and Executables to Whitelist:

To ensure optimal performance and functionality, consider whitelisting the following Tableau Server services and executable files in your antivirus software:

- Tableau Server Activation Service
- Tableau Server Coordination Service (Ensemble 2)
- Tableau Server Client File Service
- Tableau Server Administration Agent
- Tableau Server Administration Controller
- Tableau Server Service Manager
- Tableau Server License Manager
- AppZookeeper.exe
- ClientFileService.exe
- run-allegro.exe
- run-analyticsextension.exe
- run-apigateway.exe
- run-authnservice.exe
- run-backgrounder.exe
- run-clustercontroller.exe
- run-collections.exe
- run-contentexploration.exe
- run-dataprofiling.exe
- run-dataserver.exe
- run-extractservice.exe
- run-filestore.exe
- run-floweditor.exe
- run-flowprocessor.exe
- run-gateway.exe
- run-interactive.exe
- run-metrics.exe
- run-noninteractive.exe
- run-nrs.exe
- run-publishedconnections.exe
- run-querygateway.exe
- run-querypolicy.exe
- run-tdsservice.exe
- run-vizportal.exe
- run-vizqlserver.exe
- run-webhooks.exe
- tabadmincontroller.exe
- tabminerva.exe
- tabsvs.exe
- activationservice.exe
- tabadminagent.exe
- tabreader.exe

### Additional Considerations for Non-Default Installation Paths:

If your Tableau Server installation resides on a drive other than the default one, adapt the exclusion instructions accordingly. For instance, if your Tableau Server installation is located at `D:\Tableau`, exclude `D:\Tableau\Tableau Server`. Keep in mind that the effectiveness of these exclusions may vary based on the specific antivirus software in use.

### Temporary Deactivation of Antivirus Software:

To diagnose potential performance issues, it's advisable to temporarily deactivate the antivirus software. This step can help identify whether the antivirus program is impacting the server's responsiveness. However, exercise caution and ensure that adequate security measures are in place during this period.

Implementing these exclusion policies according to your Tableau Server environment and antivirus software can significantly contribute to a smoother and more efficient server operation.

*Source: [Tableau Knowledge Base](https://kb.tableau.com/articles/howto/improving-performance-by-using-antivirus-exclusions)*


### Antivirus Exclusions for Tableau Desktop and Tableau Prep Builder

To ensure optimal performance and stability while using Tableau Desktop and Tableau Prep Builder, it's recommended to establish antivirus exclusion policies for certain processes and folders. By configuring these exclusions, you can prevent potential disruptions and slowdowns caused by antivirus scans. Below are the specific processes and folders that should be included in your antivirus exclusion list:

**For Windows:**

**Tableau Prep Builder Exclusions:**

Processes:
- Tableau Prep Builder.exe
- tabprotosrv.exe
- tdeserver64.exe
- prepservice.exe
- hyperd.exe
- hyperdstarter.exe
- tabminerva.exe (prior to version 2021, it's called prepservice.exe)

Folders:
- C:\Users\<user account>\Documents\My Tableau Prep Repository
- C:\Program Files\Tableau\
- C:\Users\<User Account>\AppData\Local\Tableau
- C:\Users\<UserAccount>\AppData\Local\Temp\TableauTemp
- C:\Users\<UserAccount>\AppData\Local\Temp\*\TableauTemp
- C:\Users\<UserAccount>\AppData\Local\Temp\*\*\TableauTemp

**Tableau Desktop Exclusions:**

Processes:
- tableau.exe
- tabprotosrv.exe
- tdeserver64.exe
- hyperd.exe
- hyperdstarter.exe
- QtWebEngineProcess.exe
- java.exe

Folders:
- C:\Users\<user account>\Documents\My Tableau Repository
- C:\Program Files\Tableau
- C:\Users\<User Account>\AppData\Local\Tableau
- C:\Users\<UserAccount>\AppData\Local\Temp\TableauTemp
- C:\Users\<UserAccount>\AppData\Local\Temp\*\TableauTemp
- C:\Users\<UserAccount>\AppData\Local\Temp\*\*\TableauTemp

**For MacOS:**

**Tableau Prep Builder Exclusions:**

Processes:
- Tableau Prep Builder
- tabprotosrv
- tdeserver64
- prepservice
- hyperd
- hyperdstarter
- tabminerva

Folders:
- /Users/<user account>/Documents/My Tableau Prep Repository
- /Applications/Tableau/
- /Users/<user>/Library/Application Support/Tableau Prep Builder <version>/
- ~/Library/Application Support/Tableau Prep Builder <version>/
- /Library/Tableau Prep Builder <version>/
- ~/Library/Tableau Prep Builder <version>/

**Tableau Desktop Exclusions:**

Processes:
- tableau
- tabprotosrv
- tdeserver64
- hyperd
- hyperdstarter
- QtWebEngineProcess

Folders:
- /Users/<user account>/Documents/My Tableau Repository
- /Applications/Tableau/
- /Users/<user>/Library/Application Support/Tableau/
- ~/Library/Application Support/Tableau/
- /Library/Tableau/
- ~/Library/Tableauu/

Remember that the effectiveness of these exclusions can vary depending on your specific antivirus software. Implementing these exclusions will help ensure a smooth and efficient experience while using Tableau Desktop and Tableau Prep Builder.

*Source: [Tableau Knowledge Base](https://kb.tableau.com/articles/howto/improving-performance-by-using-antivirus-exclusions)*
