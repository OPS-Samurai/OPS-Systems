# 💻 VS-Code Settings Control Module
## 🛠️ Prerequisites
- A compatible installation of Visual Studio Code is required for these settings to be applied.
- The Snyk security integration requires the Snyk CLI executable to be located at the path specified in `snyk.advanced.cliPath`.

## ⚙️ Technical Details
This module consists of a `settings.json` file that configures the Visual Studio Code environment. The settings are as follows:

**Editor Configuration:**
- `editor.tabCompletion`: "off"
- `editor.wordSeparators`: "`~! @#$%^&*()-=+[{]}\\|;:'\",.<>/?`
- `editor.fontSize`: 14
- `editor.guides.indentation`: true
- `files.defaultLanguage`: ""

**PowerShell Integration:**
- `powershell.buttons.showPanelMovementButtons`: false
- `powershell.codeFolding.showLastLine`: true
- `powershell.sideBar.CommandExplorerVisibility`: true
- `powershell.integratedConsole.showStartBanner`: false
- `powershell.integratedConsole.focusConsoleOnExecute`: false

**Snyk Security Scanner:**
- `snyk.advanced.cliPath`: "C:\\Users\\NGonc\\AppData\\Local\\snyk\\vscode-cli\\snyk-win.exe"
- `snyk.securityAtInception.autoConfigureSnykMcpServer`: true
- `snyk.securityAtInception.executionFrequency`: "On Code Generation"
- `snyk.trustedFolders`: null

**Workbench & UI:**
- `workbench.enableExperiments`: false
- `workbench.preferredHighContrastLightColorTheme`: "Default Dark Modern"
- `workbench.preferredLightColorTheme`: "Default Dark Modern"
- `workbench.preferredHighContrastColorTheme`: "Default Dark Modern"
- `window.systemColorTheme`: "dark"
- `terminal.integrated.fontSize`: 14

**Telemetry & Diagnostics:**
- `debug.openDebug`: "openOnDebugBreak"
- `errorLens.enabled`: true
- `databricks.telemetry.enabled`: false
- `telemetry.telemetryLevel`: "off"

## 🚀 Usage Protocols
These settings are automatically applied by Visual Studio Code upon startup when the `settings.json` file is placed in the appropriate user or workspace configuration directory. The configuration customizes the editor behavior, terminal appearance, PowerShell integration, and third-party extension settings to standardize the development environment.
