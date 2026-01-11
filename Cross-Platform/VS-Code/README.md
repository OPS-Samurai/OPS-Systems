# 💻 VS-Code Settings Control Module
## 🛠️ Prerequisites
* Visual Studio Code installed.

## ⚙️ Technical Details
This module defines a series of configuration settings for Visual Studio Code, primarily located in `settings.json`. These settings customize the behavior and appearance of the editor, debugger, integrated terminal, and specific extensions like PowerShell, Snyk, and ErrorLens.

*   `debug.openDebug`: Configures the debugger to open the Debug view automatically `openOnDebugBreak` when a breakpoint is hit.
*   `editor.tabCompletion`: Disables automatic tab completion in the editor (`off`).
*   `files.defaultLanguage`: Specifies the default language mode for new files. It is currently empty, deferring to VS Code's default inference.
*   `editor.wordSeparators`: Customizes the characters considered as word separators, affecting word selection and navigation.
*   `powershell.buttons.showPanelMovementButtons`: Hides the panel movement buttons for the PowerShell integrated console (`false`).
*   `powershell.codeFolding.showLastLine`: Ensures the last line of a code block is visible when code folding is applied (`true`).
*   `snyk.advanced.cliPath`: Defines the explicit file path to the Snyk command-line interface executable.
*   `snyk.securityAtInception.autoConfigureSnykMcpServer`: Enables automatic configuration of the Snyk MCP server (`true`).
*   `snyk.securityAtInception.executionFrequency`: Sets the frequency for Snyk security scans to `On Code Generation`.
*   `snyk.trustedFolders`: Specifies trusted folders for Snyk, currently set to `null`, indicating no explicit trusted folders are configured through this setting.
*   `errorLens.enabled`: Activates the ErrorLens extension, which provides inline error and warning displays (`true`).
*   `powershell.sideBar.CommandExplorerVisibility`: Makes the PowerShell Command Explorer visible in the sidebar (`true`).
*   `workbench.enableExperiments`: Disables experimental features within the VS Code workbench (`false`).
*   `powershell.integratedConsole.showStartBanner`: Suppresses the display of the start banner in the PowerShell integrated console (`false`).
*   `powershell.integratedConsole.focusConsoleOnExecute`: Prevents the integrated console from automatically gaining focus upon command execution (`false`).
*   `editor.fontSize`: Sets the default font size for the editor to `14`.
*   `databricks.telemetry.enabled`: Disables telemetry reporting for the Databricks extension (`false`).
*   `telemetry.telemetryLevel`: Sets the overall telemetry reporting level for VS Code to `off`.
*   `terminal.integrated.fontSize`: Sets the default font size for the integrated terminal to `14`.
*   `editor.guides.indentation`: Enables visual indentation guides in the editor (`true`).
*   `workbench.preferredHighContrastLightColorTheme`: Sets the preferred high contrast light color theme to `Default Dark Modern`.
*   `workbench.preferredLightColorTheme`: Sets the preferred light color theme to `Default Dark Modern`.
*   `workbench.preferredHighContrastColorTheme`: Sets the preferred high contrast color theme to `Default Dark Modern`.
*   `window.systemColorTheme`: Sets the window's system color theme to `dark`.

## 🚀 Usage Protocols
To apply these configurations, save the provided JSON content into a `settings.json` file. This file can be placed in one of two primary locations:
1.  **User Settings:** For settings that apply globally to all VS Code workspaces, place the file in the user's configuration directory (e.g., `%APPDATA%\Code\User\settings.json` on Windows).
2.  **Workspace Settings:** For settings specific to a particular project, create a `.vscode` folder at the root of the project directory and place the `settings.json` file inside it (`.vscode/settings.json`).

Visual Studio Code automatically detects and applies changes from `settings.json` files upon launch or when the files are modified.
