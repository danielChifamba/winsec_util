@echo off
:: ============================================================
::         WINDOWS SECURITY TOOLKIT
::         Version 2.0 | github.com/danielChifamba
::         Run as Administrator for full functionality
:: ============================================================

:: Auto-request Administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting Administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:MENU
cls
color 0B
echo.
echo  ====================================================
echo       WINDOWS SECURITY TOOLKIT  v2.0
echo  ====================================================
echo.
echo   --- SECURITY ---
echo   [1]  Windows Security Center
echo   [2]  Windows Defender Full Scan
echo   [3]  Windows Firewall
echo   [4]  Firewall Advanced Security
echo   [5]  User Accounts
echo   [6]  Local Security Policy
echo   [7]  Group Policy Editor
echo   [8]  Credential Manager
echo   [9]  BitLocker Drive Encryption
echo   [10] TPM Management
echo.
echo   --- SYSTEM MONITORING ---
echo   [11] View Logged In Users
echo   [12] Check Administrator Status
echo   [13] Open Event Viewer
echo   [14] Open Services
echo   [15] Security Center Services Status
echo   [16] Show Running Processes
echo   [17] Network Connections ^& Open Ports
echo   [18] Password Policy
echo.
echo   --- SYSTEM REPAIR ^& MAINTENANCE ---
echo   [19] System File Checker  (sfc /scannow)
echo   [20] DISM Health Scan ^& Repair
echo   [21] Check Startup Programs
echo   [22] Clear Temp Files
echo   [23] Flush DNS Cache
echo   [24] Windows Update
echo.
echo   --- PRIVACY ^& THREAT TOOLS ---
echo   [25] View Hosts File
echo   [26] Check Scheduled Tasks  (Spot Suspicious)
echo   [27] Check Open Network Shares
echo   [28] Malware Removal Tool  (MRT)
echo   [29] Check Windows Activation Status
echo   [30] Installed Programs List
echo.
echo   --- QUICK ACTIONS ---
echo   [31] Lock Computer
echo   [32] Flush ARP Cache
echo   [33] Reset Network Stack
echo   [34] Enable/Disable Remote Desktop
echo   [35] Generate Full Security Report
echo   [36] Exit
echo.
echo  ====================================================
set /p choice= Select option: 

if "%choice%"=="1"  goto WINDOWS_SECURITY
if "%choice%"=="2"  goto DEFENDER_SCAN
if "%choice%"=="3"  goto FIREWALL
if "%choice%"=="4"  goto FIREWALL_ADV
if "%choice%"=="5"  goto USER_ACCOUNTS
if "%choice%"=="6"  goto LOCAL_SEC_POLICY
if "%choice%"=="7"  goto GROUP_POLICY
if "%choice%"=="8"  goto CREDENTIAL_MGR
if "%choice%"=="9"  goto BITLOCKER
if "%choice%"=="10" goto TPM
if "%choice%"=="11" goto LOGGED_USERS
if "%choice%"=="12" goto ADMIN_STATUS
if "%choice%"=="13" goto EVENT_VIEWER
if "%choice%"=="14" goto SERVICES
if "%choice%"=="15" goto SEC_CENTER_SERVICES
if "%choice%"=="16" goto RUNNING_PROCESSES
if "%choice%"=="17" goto NETWORK_CONN
if "%choice%"=="18" goto PASSWORD_POLICY
if "%choice%"=="19" goto SFC_SCAN
if "%choice%"=="20" goto DISM_REPAIR
if "%choice%"=="21" goto STARTUP_PROGRAMS
if "%choice%"=="22" goto CLEAR_TEMP
if "%choice%"=="23" goto FLUSH_DNS
if "%choice%"=="24" goto WIN_UPDATE
if "%choice%"=="25" goto HOSTS_FILE
if "%choice%"=="26" goto SCHED_TASKS
if "%choice%"=="27" goto OPEN_SHARES
if "%choice%"=="28" goto MRT
if "%choice%"=="29" goto ACTIVATION
if "%choice%"=="30" goto INSTALLED_APPS
if "%choice%"=="31" goto LOCK_PC
if "%choice%"=="32" goto FLUSH_ARP
if "%choice%"=="33" goto RESET_NETWORK
if "%choice%"=="34" goto REMOTE_DESKTOP
if "%choice%"=="35" goto SEC_REPORT
if "%choice%"=="36" goto EXIT

echo.
echo   [!] Invalid option. Please try again.
timeout /t 2 >nul
goto MENU

:: ============================================================
:WINDOWS_SECURITY
cls
echo  Opening Windows Security Center...
start ms-settings:windowsdefender
echo  Done.
pause
goto MENU

:: ============================================================
:DEFENDER_SCAN
cls
color 0A
echo  ====================================================
echo   WINDOWS DEFENDER - FULL SCAN
echo  ====================================================
echo.
echo  Starting a full system scan. This may take a while...
echo  Monitor progress in the Windows Security app.
echo.
start "" "C:\Program Files\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2
echo  [+] Scan launched successfully.
echo  [i] Check Windows Security for live progress.
pause
color 0B
goto MENU

:: ============================================================
:FIREWALL
cls
echo  Opening Windows Firewall Settings...
start ms-settings:windowsdefender-firewall
pause
goto MENU

:: ============================================================
:FIREWALL_ADV
cls
echo  Opening Firewall with Advanced Security...
start wf.msc
pause
goto MENU

:: ============================================================
:USER_ACCOUNTS
cls
echo  Opening User Accounts...
start netplwiz
pause
goto MENU

:: ============================================================
:LOCAL_SEC_POLICY
cls
echo  Opening Local Security Policy...
secpol.msc
pause
goto MENU

:: ============================================================
:GROUP_POLICY
cls
echo  Opening Group Policy Editor...
gpedit.msc
pause
goto MENU

:: ============================================================
:CREDENTIAL_MGR
cls
echo  Opening Credential Manager...
start ms-settings:credentialmanager
pause
goto MENU

:: ============================================================
:BITLOCKER
cls
echo  Opening BitLocker Drive Encryption...
start ms-settings:bitlocker
pause
goto MENU

:: ============================================================
:TPM
cls
echo  Opening TPM Management Console...
tpm.msc
pause
goto MENU

:: ============================================================
:LOGGED_USERS
cls
echo  ====================================================
echo   CURRENTLY LOGGED IN USERS
echo  ====================================================
echo.
query user 2>nul
if %errorlevel% neq 0 (
    echo  [!] Could not retrieve user sessions. Run as Administrator.
)
echo.
pause
goto MENU

:: ============================================================
:ADMIN_STATUS
cls
echo  ====================================================
echo   ADMINISTRATOR STATUS CHECK
echo  ====================================================
echo.
net session >nul 2>&1
if %errorlevel% == 0 (
    echo  [+] Current user IS running with Administrator privileges.
) else (
    echo  [-] Current user is NOT running as Administrator.
)
echo.
echo  Local Administrators Group:
echo  ---------------------------
net localgroup Administrators
echo.
echo  Built-in Administrator Account:
net user Administrator 2>nul | findstr /i "active last"
echo.
pause
goto MENU

:: ============================================================
:EVENT_VIEWER
cls
echo  Opening Event Viewer...
eventvwr.msc
pause
goto MENU

:: ============================================================
:SERVICES
cls
echo  Opening Services Manager...
services.msc
pause
goto MENU

:: ============================================================
:SEC_CENTER_SERVICES
cls
echo  ====================================================
echo   SECURITY CENTER SERVICES STATUS
echo  ====================================================
echo.
for %%S in (WinDefend WdNisSvc mpssvc wscsvc EventLog wuauserv) do (
    echo  Checking %%S...
    sc query %%S | findstr /i "STATE"
)
echo.
echo  Legend:
echo   WinDefend  = Windows Defender Antivirus
echo   WdNisSvc   = Defender Network Inspection
echo   mpssvc     = Windows Firewall
echo   wscsvc     = Security Center
echo   EventLog   = Windows Event Log
echo   wuauserv   = Windows Update
echo.
pause
goto MENU

:: ============================================================
:RUNNING_PROCESSES
cls
echo  ====================================================
echo   CURRENTLY RUNNING PROCESSES
echo  ====================================================
echo.
tasklist /fo table | more
echo.
pause
goto MENU

:: ============================================================
:NETWORK_CONN
cls
echo  ====================================================
echo   NETWORK CONNECTIONS ^& OPEN PORTS
echo  ====================================================
echo.
echo  [Active Established Connections]
echo  ---------------------------------
netstat -ano | findstr /i "ESTABLISHED"
echo.
echo  [Listening Ports]
echo  ------------------
netstat -ano | findstr /i "LISTENING"
echo.
echo  [IP Configuration Summary]
echo  ---------------------------
ipconfig | findstr /i "IPv4 IPv6 Adapter"
echo.
pause
goto MENU

:: ============================================================
:PASSWORD_POLICY
cls
echo  ====================================================
echo   PASSWORD POLICY
echo  ====================================================
echo.
net accounts
echo.
pause
goto MENU

:: ============================================================
:SFC_SCAN
cls
color 0E
echo  ====================================================
echo   SYSTEM FILE CHECKER  (sfc /scannow)
echo  ====================================================
echo.
echo  [!] This will scan all protected Windows system files.
echo  [!] Please do NOT close this window during the scan.
echo.
set /p confirm= Type YES to continue: 
if /i "%confirm%"=="YES" (
    sfc /scannow
    echo.
    echo  [+] Scan complete. Check the output above for results.
    echo  [i] Full log at: C:\Windows\Logs\CBS\CBS.log
) else (
    echo  Cancelled.
)
color 0B
pause
goto MENU

:: ============================================================
:DISM_REPAIR
cls
color 0E
echo  ====================================================
echo   DISM HEALTH SCAN ^& REPAIR
echo  ====================================================
echo.
echo  Step 1: CheckHealth (Fast)
echo  ---------------------------
DISM /Online /Cleanup-Image /CheckHealth
echo.
echo  Step 2: ScanHealth (Detailed - may take a few minutes)
echo  --------------------------------------------------------
set /p confirm= Run ScanHealth? (YES/NO): 
if /i "%confirm%"=="YES" (
    DISM /Online /Cleanup-Image /ScanHealth
    echo.
    set /p repair= Issues found? Run RestoreHealth? (YES/NO): 
    if /i "!repair!"=="YES" (
        echo  Running RestoreHealth - this may take 10-20 mins...
        DISM /Online /Cleanup-Image /RestoreHealth
    )
)
echo.
echo  [+] DISM operation complete.
color 0B
pause
goto MENU

:: ============================================================
:STARTUP_PROGRAMS
cls
echo  ====================================================
echo   STARTUP PROGRAMS
echo  ====================================================
echo.
echo  [Registry - HKLM (All Users)]
echo  --------------------------------
reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run 2>nul
echo.
echo  [Registry - HKCU (Current User)]
echo  ----------------------------------
reg query HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run 2>nul
echo.
echo  [Task Manager Startup View]
wmic startup get Caption,Command,Location 2>nul
echo.
pause
goto MENU

:: ============================================================
:CLEAR_TEMP
cls
color 0E
echo  ====================================================
echo   CLEAR TEMPORARY FILES
echo  ====================================================
echo.
echo  Clearing User Temp files...
del /q /f /s "%TEMP%\*" 2>nul
echo  [+] %TEMP% cleared.

echo  Clearing Windows Temp files...
del /q /f /s "C:\Windows\Temp\*" 2>nul
echo  [+] C:\Windows\Temp cleared.

echo  Clearing Prefetch files...
del /q /f /s "C:\Windows\Prefetch\*" 2>nul
echo  [+] Prefetch cleared.

echo  Clearing DNS Cache...
ipconfig /flushdns >nul
echo  [+] DNS Cache flushed.

echo.
echo  [+] All temporary files cleared successfully!
color 0B
pause
goto MENU

:: ============================================================
:FLUSH_DNS
cls
echo  ====================================================
echo   FLUSH DNS CACHE
echo  ====================================================
echo.
echo  Flushing DNS Resolver Cache...
ipconfig /flushdns
echo.
echo  Displaying new DNS cache (should be empty):
ipconfig /displaydns | findstr /i "record" | more
echo.
pause
goto MENU

:: ============================================================
:WIN_UPDATE
cls
echo  Opening Windows Update Settings...
start ms-settings:windowsupdate
echo.
echo  [i] Check for updates and install them regularly
echo      to keep your system protected.
pause
goto MENU

:: ============================================================
:HOSTS_FILE
cls
echo  ====================================================
echo   HOSTS FILE VIEWER
echo  ====================================================
echo.
echo  Location: C:\Windows\System32\drivers\etc\hosts
echo  [i] Malware often modifies this file to redirect sites.
echo  [i] Only 127.0.0.1 / ::1 localhost entries are normal.
echo.
echo  ---- FILE CONTENTS ----
type C:\Windows\System32\drivers\etc\hosts
echo  ------------------------
echo.
set /p edit= Open in Notepad for editing? (YES/NO): 
if /i "%edit%"=="YES" (
    notepad C:\Windows\System32\drivers\etc\hosts
)
pause
goto MENU

:: ============================================================
:SCHED_TASKS
cls
echo  ====================================================
echo   SCHEDULED TASKS  (Potential Threat Check)
echo  ====================================================
echo.
echo  Listing all READY and RUNNING scheduled tasks...
echo  [!] Review any unfamiliar tasks in non-Microsoft paths.
echo.
schtasks /query /fo LIST /v 2>nul | findstr /i "TaskName Status Run As User Task To Run" | more
echo.
echo  [i] To open Task Scheduler GUI:
set /p gui= Open Task Scheduler? (YES/NO): 
if /i "%gui%"=="YES" taskschd.msc
pause
goto MENU

:: ============================================================
:OPEN_SHARES
cls
echo  ====================================================
echo   OPEN NETWORK SHARES
echo  ====================================================
echo.
echo  [Active Shared Folders on This Machine]
echo  ----------------------------------------
net share
echo.
echo  [Connected Network Sessions]
echo  ------------------------------
net session 2>nul
echo.
echo  [i] C$, D$, ADMIN$, IPC$ are default Windows shares.
echo  [!] Any other unexpected shares may be a security risk.
echo.
pause
goto MENU

:: ============================================================
:MRT
cls
color 0E
echo  ====================================================
echo   WINDOWS MALWARE REMOVAL TOOL  (MRT)
echo  ====================================================
echo.
echo  Launching Microsoft Malicious Software Removal Tool...
echo  [i] This is a built-in Microsoft tool for known malware.
echo.
start mrt.exe
pause
color 0B
goto MENU

:: ============================================================
:ACTIVATION
cls
echo  ====================================================
echo   WINDOWS ACTIVATION STATUS
echo  ====================================================
echo.
slmgr /xpr
echo.
echo  Detailed License Info:
cscript //nologo C:\Windows\System32\slmgr.vbs /dli
echo.
pause
goto MENU

:: ============================================================
:INSTALLED_APPS
cls
echo  ====================================================
echo   INSTALLED PROGRAMS
echo  ====================================================
echo.
echo  Fetching installed programs (this may take a moment)...
echo.
wmic product get Name,Version,Vendor 2>nul | more
echo.
set /p save= Save list to Desktop? (YES/NO): 
if /i "%save%"=="YES" (
    wmic product get Name,Version,Vendor > "%USERPROFILE%\Desktop\InstalledPrograms.txt" 2>nul
    echo  [+] Saved to Desktop\InstalledPrograms.txt
)
pause
goto MENU

:: ============================================================
:LOCK_PC
cls
echo  Locking computer in 3 seconds...
timeout /t 3 >nul
rundll32.exe user32.dll,LockWorkStation
goto MENU

:: ============================================================
:FLUSH_ARP
cls
echo  ====================================================
echo   FLUSH ARP CACHE
echo  ====================================================
echo.
echo  Current ARP Table:
arp -a
echo.
echo  Flushing ARP Cache...
netsh interface ip delete arpcache >nul 2>&1
echo  [+] ARP Cache flushed successfully.
echo.
pause
goto MENU

:: ============================================================
:RESET_NETWORK
cls
color 0E
echo  ====================================================
echo   RESET NETWORK STACK
echo  ====================================================
echo.
echo  [!] This will reset Winsock, TCP/IP, Firewall rules.
echo  [!] Your PC will need to RESTART after this operation.
echo.
set /p confirm= Type YES to confirm full network reset: 
if /i "%confirm%"=="YES" (
    echo  Resetting Winsock...
    netsh winsock reset
    echo  Resetting TCP/IP...
    netsh int ip reset
    echo  Resetting Firewall to defaults...
    netsh advfirewall reset
    echo  Flushing DNS...
    ipconfig /flushdns
    echo  Releasing and renewing IP...
    ipconfig /release >nul
    ipconfig /renew >nul
    echo.
    echo  [+] Network stack reset complete.
    echo  [!] Please RESTART your computer now.
) else (
    echo  Cancelled.
)
color 0B
pause
goto MENU

:: ============================================================
:REMOTE_DESKTOP
cls
echo  ====================================================
echo   REMOTE DESKTOP TOGGLE
echo  ====================================================
echo.
:: Check current status
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections 2^>nul ^| findstr fDenyTSConnections') do set rdp_val=%%a

if "%rdp_val%"=="0x0" (
    echo  Current Status: [ENABLED]
    set /p toggle= Disable Remote Desktop? (YES/NO): 
    if /i "!toggle!"=="YES" (
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f >nul
        netsh advfirewall firewall set rule group="remote desktop" new enable=No >nul
        echo  [+] Remote Desktop has been DISABLED.
    )
) else (
    echo  Current Status: [DISABLED]
    set /p toggle= Enable Remote Desktop? (YES/NO): 
    if /i "!toggle!"=="YES" (
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f >nul
        netsh advfirewall firewall set rule group="remote desktop" new enable=Yes >nul
        echo  [+] Remote Desktop has been ENABLED.
    )
)
echo.
pause
goto MENU

:: ============================================================
:SEC_REPORT
cls
color 0A
echo  ====================================================
echo   GENERATING FULL SECURITY REPORT...
echo  ====================================================
echo  Please wait, collecting system data...
echo.

set REPORT=%USERPROFILE%\Desktop\SecurityReport_%DATE:~-4,4%%DATE:~-7,2%%DATE:~-10,2%_%TIME:~0,2%%TIME:~3,2%.txt
set REPORT=%REPORT: =0%

(
echo ====================================================
echo    WINDOWS SECURITY TOOLKIT v2.0 - SECURITY REPORT
echo    Generated : %DATE% at %TIME%
echo    Computer  : %COMPUTERNAME%
echo    User      : %USERNAME%
echo    Domain    : %USERDOMAIN%
echo ====================================================
echo.
echo [1. SYSTEM INFORMATION]
echo -------------------------
systeminfo | findstr /i "OS Version Host Name System Type Total Physical Install Date"
echo.
echo [2. ADMINISTRATOR STATUS]
echo --------------------------
net localgroup Administrators
echo.
net session >nul 2>&1 && echo Current session: ADMINISTRATOR || echo Current session: STANDARD USER
echo.
echo [3. PASSWORD POLICY]
echo ---------------------
net accounts
echo.
echo [4. FIREWALL STATUS]
echo ---------------------
netsh advfirewall show allprofiles state
echo.
echo [5. SECURITY SERVICES]
echo -----------------------
for %%S in (WinDefend WdNisSvc mpssvc wscsvc EventLog wuauserv) do (
    sc query %%S | findstr /i "SERVICE_NAME STATE"
)
echo.
echo [6. ESTABLISHED NETWORK CONNECTIONS]
echo -------------------------------------
netstat -ano | findstr /i "ESTABLISHED"
echo.
echo [7. LISTENING PORTS]
echo ---------------------
netstat -ano | findstr /i "LISTENING"
echo.
echo [8. STARTUP PROGRAMS - HKLM]
echo ------------------------------
reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run 2>nul
echo.
echo [9. STARTUP PROGRAMS - HKCU]
echo ------------------------------
reg query HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run 2>nul
echo.
echo [10. OPEN SHARES]
echo ------------------
net share
echo.
echo [11. LOGGED IN USERS]
echo ----------------------
query user 2>nul
echo.
echo [12. HOSTS FILE]
echo -----------------
type C:\Windows\System32\drivers\etc\hosts
echo.
echo [13. WINDOWS ACTIVATION]
echo -------------------------
cscript //nologo C:\Windows\System32\slmgr.vbs /dli 2>nul
echo.
echo [14. ARP TABLE]
echo ----------------
arp -a
echo.
echo ====================================================
echo   END OF REPORT  -  Windows Security Toolkit v2.0
echo ====================================================
) > "%REPORT%"

echo  [+] Report saved to your Desktop:
echo      %REPORT%
echo.
echo  Opening report...
notepad "%REPORT%"
color 0B
pause
goto MENU

:: ============================================================
:EXIT
cls
color 0B
echo.
echo  ====================================================
echo       WINDOWS SECURITY TOOLKIT v2.0
echo       Stay safe. Stay secure.
echo  ====================================================
echo.
timeout /t 3 >nul
exit
