
; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Keybase"
#ifndef MyAppVersion
#define MyAppVersion "1.0.0"
#endif
; Use semantic version to name the installer,
; but we still need the x.x.x.x version because Windows.
#ifndef MySemVersion
#define MySemVersion MyAppVersion
#endif
#define MyAppPublisher "Keybase, Inc."
#define MyAppURL "http://www.keybase.io/"
#define MyExeName "keybase.exe"
#define MyGoPath GetEnv('GOPATH')
#ifndef MyExePathName
#define MyExePathName MyGoPath + "\src\github.com\keybase\client\go\keybase\" + MyExeName
#endif
#define MyGoArch GetEnv('GOARCH')

#ifndef NewDokanVersion
#define NewDokanVersion ""
#endif

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{1B2672D9-2BAD-4C11-BA53-A75AF6FD7789}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
AppCopyright=Copyright (c) 2015, Keybase
DefaultDirName={pf32}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputBaseFilename=keybase_setup_gui_{#MySemVersion}.{#MyGoArch}
SetupIconFile={#MyGoPath}\src\github.com\keybase\client\packaging\windows\keybase.ico
Compression=lzma
SolidCompression=yes
UninstallDisplayIcon={app}\keybase.exe
VersionInfoVersion={#MyAppVersion}
DisableDirPage=auto
DisableProgramGroupPage=auto
ArchitecturesInstallIn64BitMode=x64 ia64
DirExistsWarning=no
; CreateUninstallRegKey=no
; Comment this out for development
; (there doesn't seem to be a way to make it conditional)
SignTool=SignCommand

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

; Unpack the dokan components in $GOPATH\bin\dokan-dev\dokan-v1.0.0-RC2
; Download the Visuap Studio 2015 redistributable to $GOPATH\bin

[Files]
; Note we went from Windows version 1.0.14-1 to 1.0.14-0, so we have to ignoreversion instead of replacesameversion
Source: "{#MyExePathName}"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "..\..\desktop\release\win32-ia32\Keybase-win32-ia32\*"; DestDir: "{app}\gui"; Flags: createallsubdirs recursesubdirs replacesameversion
Source: "..\..\..\..\..\..\bin\dokan-dev\dokan-v1.0.0-RC2\Win32\Win7Release\dokan1.sys"; DestDir: "{sys}\drivers"; Check: IsOtherArch and IsWindows7 and IsDokanBeingUpdated
Source: "..\..\..\..\..\..\bin\dokan-dev\dokan-v1.0.0-RC2\Win32\Win8Release\dokan1.sys"; DestDir: "{sys}\drivers"; Check: IsOtherArch and IsWindows8 and IsDokanBeingUpdated
Source: "..\..\..\..\..\..\bin\dokan-dev\dokan-v1.0.0-RC2\Win32\Win8.1Release\dokan1.sys"; DestDir: "{sys}\drivers"; Check: IsOtherArch and IsWindows8_1 and IsDokanBeingUpdated
Source: "..\..\..\..\..\..\bin\dokan-dev\dokan-v1.0.0-RC2\Win32\Win10Release\dokan1.sys"; DestDir: "{sys}\drivers"; Check: IsOtherArch and IsWindows10 and IsDokanBeingUpdated
Source: "..\..\..\..\..\..\bin\dokan-dev\dokan-v1.0.0-RC2\Win32\Release\dokan1.dll"; DestDir: "{sys}"; Flags: 32bit
Source: "..\..\..\..\..\..\bin\dokan-dev\dokan-v1.0.0-RC2\Win32\Release\dokannp1.dll"; DestDir: "{sys}"; Flags: 32bit
Source: "..\..\..\..\..\..\bin\dokan-dev\dokan-v1.0.0-RC2\x64\Win7Release\dokan1.sys"; DestDir: "{sys}\drivers"; Check: IsX64 and IsWindows7 and IsDokanBeingUpdated
Source: "..\..\..\..\..\..\bin\dokan-dev\dokan-v1.0.0-RC2\x64\Win8Release\dokan1.sys"; DestDir: "{sys}\drivers"; Check: IsX64 and IsWindows8 and IsDokanBeingUpdated
Source: "..\..\..\..\..\..\bin\dokan-dev\dokan-v1.0.0-RC2\x64\Win8.1Release\dokan1.sys"; DestDir: "{sys}\drivers"; Check: IsX64 and IsWindows8_1 and IsDokanBeingUpdated
Source: "..\..\..\..\..\..\bin\dokan-dev\dokan-v1.0.0-RC2\x64\Win10Release\dokan1.sys"; DestDir: "{sys}\drivers"; Check: IsX64 and IsWindows10 and IsDokanBeingUpdated
Source: "..\..\..\..\..\..\bin\dokan-dev\dokan-v1.0.0-RC2\x64\Release\dokan1.dll"; DestDir: "{sys}"; Flags: 64bit; Check: IsX64
Source: "..\..\..\..\..\..\bin\dokan-dev\dokan-v1.0.0-RC2\x64\Release\dokannp1.dll"; DestDir: "{sys}"; Flags: 64bit; Check: IsX64
Source: "..\..\..\..\..\..\bin\dokan-dev\dokan-v1.0.0-RC2\Win32\Release\dokanctl.exe"; DestDir: "{pf32}\Dokan\DokanLibrary"
Source: "..\..\..\..\..\..\bin\vc_redist.x86.exe"; DestDir: "{tmp}"
Source: "..\..\..\kbfs\kbfsdokan\kbfsdokan.exe"; DestDir: "{app}"; Flags: replacesameversion

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{group}\{#MyAppName} CMD"; Filename: "cmd.exe"; WorkingDir: "{app}"; IconFilename: "{app}\{#MyExeName}"; Parameters: "/K ""set PATH=%PATH%;{app}"""
Name: "{userstartup}\Keybase UI"; Filename: "{app}\gui\Keybase.exe"
Name: "{group}\Keybase UI"; Filename: "{app}\gui\Keybase.exe"

[Registry]
Root: "HKCU"; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\keybase.exe"; ValueType: string; ValueData: "{app}\keybase.exe"; Flags: uninsdeletekey

[Messages]
WelcomeLabel2=This will install [name/ver] on your computer.

[Run]
Filename: "{tmp}\vc_redist.x86.exe"; Parameters: "/quiet /Q:a /c:""msiexec /qb /i vcredist.msi"""; StatusMsg: "Installing VisualStudio 2015 RunTime..."
Filename: "{app}\{#MyExeName}"; Parameters: "ctl watchdog"; Flags: runasoriginaluser runhidden nowait
Filename: "{pf32}\Dokan\DokanLibrary\dokanctl.exe"; Parameters: "/i d"; WorkingDir: "{pf32}\Dokan\DokanLibrary"; Flags: runhidden; Description: "Install Dokan Service"
Filename: "{app}\gui\Keybase.exe"; WorkingDir: "{app}\gui"; Flags: nowait runasoriginaluser
Filename: "{app}\kbfsdokan.exe"; Parameters: "-log-to-file -debug k:"; Flags: runasoriginaluser runhidden nowait

[UninstallDelete]
Type: files; Name: "{userstartup}\{#MyAppName}.vbs"

[InstallDelete]
Type: files; Name: "{userstartup}\{#MyAppName}.vbs"

[UninstallRun]
Filename: "taskkill"; Parameters: "/f /im Keybase.exe"; Flags: runhidden
Filename: "taskkill"; Parameters: "/f /im kbfsdokan.exe"; Flags: runhidden
Filename: "{app}\{#MyExeName}"; Parameters: "ctl stop"; WorkingDir: "{app}"; Flags: skipifdoesntexist runhidden
Filename: "{pf32}\Dokan\DokanLibrary\dokanctl.exe"; Parameters: "/u k /f"; Flags: runhidden
; Legacy Dokan
Filename: "{pf32}\Dokan\DokanLibrary\dokanctl.exe"; Parameters: "/r a"; Flags: runhidden
Filename: "{pf32}\Dokan\DokanLibrary\dokanctl.exe"; Parameters: "/r d"; Flags: runhidden

[Code]
const
  (*** Customize the following to your own name. ***)
  RunOnceName = 'Keybase Setup restart';

  QuitMessageReboot = 'You will need to restart your computer to upgrade previously installed Keybase components.'#13#13'After restarting your computer, Setup will continue next time an administrator logs in.';
  UninstallCLIMessage = 'A previously detected command-line Keybase will be removed as part of this installation. Your settings will not be affected. Continue?';
  CLIAppIdString = '{70E747DE-4E09-44B0-ACAD-784AA9D79C02}';

var
  g_currentDokanVer: String;
  Restarted: Boolean;

function IsX64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paX64);
end;

function IsIA64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paIA64);
end;

/////////////////////////////////////////////////////////////////////
function GetUninstallString(var AppIdString: String): String;
var
  sUnInstPath: String;
  sUnInstallString: String;
begin
  // Default is hardcoded to match AppId, above
  if AppIdString = '' then
    AppIdString := '{1B2672D9-2BAD-4C11-BA53-A75AF6FD7789}';
  sUnInstPath := 'Software\Microsoft\Windows\CurrentVersion\Uninstall\' + AppIdString + '_is1';
  sUnInstallString := '';
  
  if not RegQueryStringValue(HKCU32, sUnInstPath, 'UninstallString', sUnInstallString) then
    if not RegQueryStringValue(HKLM32, sUnInstPath, 'UninstallString', sUnInstallString) then
      if IsX64() then
        if not RegQueryStringValue(HKCU64, sUnInstPath, 'UninstallString', sUnInstallString) then
          RegQueryStringValue(HKLM64, sUnInstPath, 'UninstallString', sUnInstallString);
  Result := sUnInstallString;
end;


function GetPreviousVerUninstallString(): String;
var
  AppIdString: String;

begin
  AppIdString := '{DEB2E54C-C39F-4DC8-93A7-ABE0AB91DDCA}';
  // Hardcoded app ID from previous installers
  Result := GetUninstallString(AppIdString);
  // Add more as we change the appId
end;


/////////////////////////////////////////////////////////////////////
function IsUpgrade(): Boolean;
var
  EmptyString: String;

begin
  Result := (GetUninstallString(EmptyString) <> '');
end;

function IsUpgradeFromPrevious(): Boolean;
begin
  Result := (GetPreviousVerUninstallString() <> '');
end;
                  
function PreviousCLIInstalled(): Boolean;
var CLIAppId: String;
begin
  CLIAppId := CLIAppIdString;
  Result := (GetUninstallString(CLIAppId) <> '');
end;

/////////////////////////////////////////////////////////////////////
function UnInstallOldVersion(var sUnInstallString: String): Integer;
var
  iResultCode: Integer;
begin
// Return Values:
// 1 - uninstall string is empty
// 2 - error executing the UnInstallString
// 3 - successfully executed the UnInstallString

  // default return value
  Result := 0;

  // get the uninstall string of the old app
  if sUnInstallString <> '' then begin
    Log('Uninstalling previous: ' + sUnInstallString);
    sUnInstallString := RemoveQuotes(sUnInstallString);
    if Exec(sUnInstallString, '/SILENT /NORESTART /SUPPRESSMSGBOXES','', SW_HIDE, ewWaitUntilTerminated, iResultCode) then
      Result := 3
    else
      Result := 2;
  end else
    Result := 1;
end;

procedure CheckAndUninstallCLI;
var
   CLIAppId: String;
   UninstallString: String;

begin
  CLIAppId := CLIAppIdString;
  UninstallString := GetUninstallString(CLIAppId)
  UnInstallOldVersion(UninstallString);
end;
  
  
// Simply invoking "Keybase.exe service" at startup results in an unsightly
// extra console window, so we'll emit this bit of script instead.
// (yes, this is pascal code that generates vbscript.)
// Note that we delete it at uninstall.
function CreateStartupScript(): boolean;
var
  fileName : string;
  lines : TArrayOfString;
begin
  Result := true;
  fileName := ExpandConstant('{userstartup}\{#MyAppName}.vbs');
  SetArrayLength(lines, 5);

  lines[0] := 'Dim WinScriptHost';
  lines[1] := 'Set WinScriptHost = CreateObject("WScript.Shell")';
  lines[2] := ExpandConstant('WinScriptHost.Run Chr(34) & "{app}\{#MyExeName}" & Chr(34) & " ctl watchdog", 0');
  lines[3] := ExpandConstant('WinScriptHost.Run Chr(34) & "{app}\kbfsdokan.exe" & Chr(34) & " -log-to-file -debug k:", 0');
  lines[4] := 'Set WinScriptHost = Nothing';

  Result := SaveStringsToFile(filename,lines,true);
  exit;
end;

 
procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;

begin
  if  CurStep=ssPostInstall then
    begin
      CreateStartupScript();
    end
end;


function IsDokanBeingUpdated(): Boolean;
var
  newVer: String;

begin
  newVer := ExpandConstant('{#NewDokanVersion}');
  Log('Old driver ver: ' + g_currentDokanVer);
  Log('New driver ver: ' + newVer);
  Result := not (CompareStr(g_currentDokanVer, newVer) = 0)
end;

// Restart if the driver got changed
function NeedRestart(): Boolean;
begin
  Result := (Length(g_currentDokanVer) > 0) and IsDokanBeingUpdated();
end;

procedure StopKeybaseService();
var
  ResultCode: Integer;
  CommandName: string;

begin
  // kill any electron UI instances
  Exec('taskkill.exe', '/f /im Keybase.exe', '', SW_HIDE,
    ewWaitUntilTerminated, ResultCode);
  // Launch Keybase ctl stop and wait for it to terminate
  CommandName := ExpandConstant('{app}\{#MyExeName}');
  Exec(CommandName, 'ctl stop', '', SW_HIDE,
    ewWaitUntilTerminated, ResultCode);
  Exec(ExpandConstant('{pf32}\Dokan\DokanLibrary\dokanctl.exe'), '/u K', '', SW_HIDE,
    ewWaitUntilTerminated, ResultCode);
  Sleep(500);
  Exec('taskkill.exe', '/f /im kbfsdokan.exe', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  Sleep(100);
  if IsDokanBeingUpdated() then
  begin
    Exec(ExpandConstant('{pf32}\Dokan\DokanLibrary\dokanctl.exe'), '/u k /f', '', SW_HIDE,
      ewWaitUntilTerminated, ResultCode);
    Exec(ExpandConstant('{pf32}\Dokan\DokanLibrary\dokanctl.exe'), '/r d', '', SW_HIDE,
      ewWaitUntilTerminated, ResultCode);
  end
end;

function UninstallNeedRestart(): Boolean;
begin
  // Assume we always remove a driver
  Result := true;
end;

function Quote(const S: String): String;
begin
  Result := '"' + S + '"';
end;

function AddParam(const S, P, V: String): String;
begin
  if V <> '""' then
    Result := S + ' /' + P + '=' + V;
end;

function AddSimpleParam(const S, P: String): String;
begin
 Result := S + ' /' + P;
end;

procedure CreateRunOnceEntry;
var
  RunOnceData: String;
begin
  RunOnceData := Quote(ExpandConstant('{srcexe}')) + ' /restart=1';
  RunOnceData := AddParam(RunOnceData, 'LANG', ExpandConstant('{language}'));
  RunOnceData := AddParam(RunOnceData, 'DIR', Quote(WizardDirValue));
  RunOnceData := AddParam(RunOnceData, 'GROUP', Quote(WizardGroupValue));
  if WizardNoIcons then
    RunOnceData := AddSimpleParam(RunOnceData, 'NOICONS');
  RunOnceData := AddParam(RunOnceData, 'TYPE', Quote(WizardSetupType(False)));
  RunOnceData := AddParam(RunOnceData, 'COMPONENTS', Quote(WizardSelectedComponents(False)));
  RunOnceData := AddParam(RunOnceData, 'TASKS', Quote(WizardSelectedTasks(False)));

  (*** Place any custom user selection you want to remember below. ***)

  //<your code here>
  
  RegWriteStringValue(HKCU, 'Software\Microsoft\Windows\CurrentVersion\RunOnce', RunOnceName, RunOnceData);
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
var
    ResultCode: Integer;
    dokanCtlName: String;
    uninstallString: String;

begin
    dokanCtlName := ExpandConstant('{pf32}\Dokan\DokanLibrary\dokanctl.exe');
    if Restarted then begin
          Log('Restarted, removing legacy stuff');
          DeleteFile(dokanCtlName);
          DeleteFile(ExpandConstant('{pf32}\Dokan\DokanLibrary\mounter.exe'));
          DeleteFile(ExpandConstant('{sys}\drivers\dokan.sys'));
    end else begin
      CheckAndUninstallCLI
      if IsUpgradeFromPrevious then
      begin
        Log('Uninstalling previous and restarting');
        uninstallString := GetPreviousVerUninstallString;
        UnInstallOldVersion(uninstallString);
        NeedsRestart := True;
        Result := QuitMessageReboot;
        CreateRunOnceEntry
      end;
    end;
    StopKeybaseService();
end;


function InitializeSetup(): Boolean;
var
    fileName: string;
    ResultCode: Integer;

begin
    fileName := ExpandConstant('{sys}\drivers\dokan1.sys');
    GetVersionNumbersString(fileName, g_currentDokanVer);
    // overwrite old dokan components
    if IsUpgradeFromPrevious() then
       g_currentDokanVer := '';

    Restarted := ExpandConstant('{param:restart|0}') = '1';

    if not Restarted then begin
      Result := not RegValueExists(HKCU, 'Software\Microsoft\Windows\CurrentVersion\RunOnce', RunOnceName);
      if not Result then
      begin
        MsgBox(QuitMessageReboot, mbError, mb_Ok);
      end else begin
        if PreviousCLIInstalled then
          if MsgBox(UninstallCLIMessage, mbConfirmation, MB_YESNO) <> IDYES then
          begin
            // user clicked NO
            Result := false;
          end;
      end;
    end else begin
      Result := true;
      DeleteFile(ExpandConstant('{sys}\drivers\dokan.sys'));
    end;
end;


function IsOtherArch: Boolean;
begin
  Result := not IsX64 and not IsIA64;
end;


function IsWindowsXP: Boolean;
var
  Version: TWindowsVersion;
begin
  GetWindowsVersionEx(Version);
  Result := Version.NTPlatform and (Version.Major = 5) and (Version.Minor = 1);
end;
     

function IsWindows7: Boolean;
var
  Version: TWindowsVersion;
begin
  GetWindowsVersionEx(Version);

  Result := Version.NTPlatform and (Version.Major = 6) and (Version.Minor = 1);

end;


function IsWindows8: Boolean;
var
  Version: TWindowsVersion;
begin
  GetWindowsVersionEx(Version);

  Result := Version.NTPlatform and (Version.Major = 6) and (Version.Minor = 2);

end;


function IsWindows8_1: Boolean;
var
  Version: TWindowsVersion;
begin
  GetWindowsVersionEx(Version);

  Result := Version.NTPlatform and (Version.Major = 6) and (Version.Minor = 3);

end;


function IsWindows10: Boolean;
var
  Version: TWindowsVersion;
begin
  GetWindowsVersionEx(Version);

  Result := Version.NTPlatform and (Version.Major = 10);
  if result = true then
  begin
     Log('IsWindows10');
  end
  else
  begin
     Log('Not Windows10: version' + IntToStr(Version.Major));
  end;
end;



function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Result := Restarted;
end;
