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
