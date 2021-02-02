; Rigs of Rods 2021.02 Setup
; Created by Michael (CuriousMike)

#define InstallerName "Rigs of Rods"
#define InstallerVersion "2021.02"
#define InstallerPublisher "Rigs of Rods"
#define InstallerURL "https://www.rigsofrods.org"
#define InstallerExeName "RoR.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{EF536888-919D-47C0-8675-2F7AFA52EE27}
AppName={#InstallerName}
AppVersion={#InstallerVersion}
VersionInfoVersion={#InstallerVersion}
AppPublisher={#InstallerPublisher}
AppPublisherURL={#InstallerURL}
AppSupportURL={#InstallerURL}
AppUpdatesURL={#InstallerURL}
DefaultDirName={pf}\Rigs of Rods
DefaultGroupName=Rigs of Rods
DisableProgramGroupPage=yes
LicenseFile=TextFiles\GNU General Public License v3.0.txt
InfoAfterFile=TextFiles\AfterInstall.txt
OutputDir=Build
OutputBaseFilename=RoR_{#InstallerVersion}_Setup
SetupIconFile=Icons\ror.ico
Compression=lzma2/ultra
SolidCompression=yes
; "ArchitecturesInstallIn64BitMode=x64" requests that the install be
; done in "64-bit mode" on x64, meaning it should use the native
; 64-bit Program Files directory and the 64-bit view of the registry.
; On all other architectures it will install in "32-bit mode".
ArchitecturesInstallIn64BitMode=x64
DisableWelcomePage=no
; Custom images
; 64x64
WizardSmallImageFile=Icons\ror-64.bmp
; 164x314
WizardImageFile=Icons\RoRSetupLarge.bmp
InternalCompressLevel=ultra

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "armenian"; MessagesFile: "compiler:Languages\Armenian.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "catalan"; MessagesFile: "compiler:Languages\Catalan.isl"
Name: "corsican"; MessagesFile: "compiler:Languages\Corsican.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"
Name: "danish"; MessagesFile: "compiler:Languages\Danish.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "finnish"; MessagesFile: "compiler:Languages\Finnish.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "hebrew"; MessagesFile: "compiler:Languages\Hebrew.isl"
Name: "icelandic"; MessagesFile: "compiler:Languages\Icelandic.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "norwegian"; MessagesFile: "compiler:Languages\Norwegian.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "slovak"; MessagesFile: "compiler:Languages\Slovak.isl"
Name: "slovenian"; MessagesFile: "compiler:Languages\Slovenian.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "turkish"; MessagesFile: "compiler:Languages\Turkish.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

;[Dirs]
;Name: "{userdocs}\Rigs of Rods 0.4\mods"

[Files]
; Folders
Source: "Release\languages\*"; DestDir: "{app}\languages"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "Release\resources\*"; DestDir: "{app}\resources"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "Release\content\*"; DestDir: "{app}\content"; Flags: ignoreversion recursesubdirs createallsubdirs
; Main files
Source: "Release\x64\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; DirectX
Source: "Dependencies\DirectX\*"; DestDir: "{tmp}"; Flags: nocompression createallsubdirs recursesubdirs deleteafterinstall overwritereadonly ignoreversion uninsremovereadonly; Components: install_directx
; VS redist
Source: "Dependencies\VSRedist\*"; DestDir: "{tmp}"; Flags: nocompression createallsubdirs recursesubdirs deleteafterinstall overwritereadonly ignoreversion uninsremovereadonly; Components: install_vsredist

[Icons]
; Start Menu
Name: "{group}\Rigs of Rods"; Filename: "{app}\RoR.exe"
Name: "{group}\{cm:UninstallProgram,{#InstallerName}}"; Filename: "{uninstallexe}"
; Desktop
Name: "{commondesktop}\Rigs of Rods"; Filename: "{app}\RoR.exe"; Tasks: desktopicon

[Run]
; DirectX
Filename: "{tmp}\DXSETUP.exe"; Parameters: "/silent"; WorkingDir: "{tmp}"; Flags: waituntilterminated skipifdoesntexist runascurrentuser; StatusMsg: "Installing DirectX..."; Components: install_directx
; VS redist
Filename: "{tmp}\vc_redist.x64.exe"; Parameters: "/install /passive /norestart"; WorkingDir: "{tmp}"; Flags: waituntilterminated skipifdoesntexist runascurrentuser; StatusMsg: "Installing Visual Studio Redistributable (x64)..."; Components: install_vsredist; Check: Is64BitInstallMode
Filename: "{tmp}\vc_redist.x86.exe"; Parameters: "/install /passive /norestart"; WorkingDir: "{tmp}"; Flags: waituntilterminated skipifdoesntexist runascurrentuser; StatusMsg: "Installing Visual Studio Redistributable (x86)..."; Components: install_vsredist; Check: not Is64BitInstallMode
; "Launch Rigs of Rods" button after install
Filename: "{app}\{#InstallerExeName}"; Flags: nowait postinstall skipifsilent; Description: "{cm:LaunchProgram,{#StringChange(InstallerName, '&', '&&')}}"

[Components]
Name: "install_directx"; Description: "Install DirectX9 runtime"; Types: full
Name: "install_vsredist"; Description: "Install VS2019 Redist"; Types: full
