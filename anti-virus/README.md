## Tableau Server Antivirus Exclusion Guidelines

When operating a Tableau Server environment, optimizing server performance involves strategically configuring antivirus exclusion policies. By implementing these exclusions, you can prevent potential performance bottlenecks caused by antivirus scans. To ensure Tableau Server's smooth operation, follow the guidelines below:

### Exclude Tableau Server Program Folder:

- **Windows:** Exclude `C:\Program Files\Tableau\Tableau Server`
- **Linux:** Exclude `/opt/tableau/tableau_server`

### Exclude Tableau Server Data Folder:

- **Windows:** Exclude `C:\ProgramData\Tableau\Tableau Server\data`
- **Linux:** Exclude `/var/opt/tableau/tableau_server`

> **Note:** On Windows, the ProgramData folder is often hidden by default. Adjust your operating system settings to display hidden files and folders. For comprehensive exclusion options, including files, folders, specific file types, and processes, refer to the relevant antivirus software documentation.

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
- svchost.exe
- tabadmincontroller.exe
- tabminerva.exe
- tabsvs.exe
- activationservice.exe
- tabadminagent.exe

### Additional Considerations for Non-Default Installation Paths:

If your Tableau Server installation resides on a drive other than the default one, adapt the exclusion instructions accordingly. For instance, if your Tableau Server installation is located at `D:\Tableau`, exclude `D:\Tableau\Tableau Server`. Keep in mind that the effectiveness of these exclusions may vary based on the specific antivirus software in use.

### Temporary Deactivation of Antivirus Software:

To diagnose potential performance issues, it's advisable to temporarily deactivate the antivirus software. This step can help identify whether the antivirus program is impacting the server's responsiveness. However, exercise caution and ensure that adequate security measures are in place during this period.

Implementing these exclusion policies according to your Tableau Server environment and antivirus software can significantly contribute to a smoother and more efficient server operation.

*Source: [Tableau Knowledge Base](https://kb.tableau.com/articles/howto/improving-performance-by-using-antivirus-exclusions)*
