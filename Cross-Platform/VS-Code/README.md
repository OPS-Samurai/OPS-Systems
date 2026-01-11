# 📝 Visual Studio Code Settings (settings.json)
> This document details the configuration settings for the Visual Studio Code environment, customized to optimize the development workflow.

## 🛠️ Prerequisites
- Visual Studio Code IDE must be installed.
- The following extensions should be installed for all settings to be effective:
  - PowerShell
  - Snyk
  - Error Lens
  - Databricks

## ⚙️ Technical Details
The `settings.json` file is configured with the following key-value pairs to tailor the editor's behavior and appearance.

| Setting | Value | Description |
| :--- | :--- | :--- |
| **Debugging** | | |
| `debug.openDebug` | `openOnDebugBreak` | Automatically opens the debug view only when a breakpoint is hit. |
| **Editor** | | |
| `editor.tabCompletion` | `off` | Disables autocompletion of code snippets when pressing the Tab key. |
| `files.defaultLanguage` | `""` | No default language is set for new, untitled files. |
| `editor.wordSeparators` | (Custom) | Defines a specific set of characters to be treated as word separators. |
| `editor.fontSize` | `14` | Sets the font size for the text editor to 14. |
| `editor.guides.indentation` | `true` | Renders indentation guides in the editor. |
| **PowerShell Extension** | | |
| `powershell.buttons.showPanelMovementButtons` | `false` | Hides the panel movement buttons in the PowerShell Integrated Console. |
| `powershell.codeFolding.showLastLine` | `true` | The closing brace of a foldable block will be shown. |
| `powershell.sideBar.CommandExplorerVisibility`| `true` | Ensures the Command Explorer in the side bar is visible. |
| `powershell.integratedConsole.showStartBanner`| `false` | Disables the PowerShell startup banner in the Integrated Console. |
| `powershell.integratedConsole.focusConsoleOnExecute`| `false` | Prevents the console from taking focus when code is executed. |
| **Snyk Extension** | | |
| `snyk.advanced.cliPath` | (User Specific) | Specifies the exact file path to the Snyk CLI executable. |
| `snyk.securityAtInception.autoConfigureSnykMcpServer`| `true` | Allows automatic configuration for the Snyk MCP server. |
| `snyk.securityAtInception.executionFrequency`| `On Code Generation`| Triggers Snyk scans automatically upon code generation events. |
| `snyk.trustedFolders` | `null` | No folders are explicitly designated as trusted. |
| **Error Lens Extension** | | |
| `errorLens.enabled` | `true` | Enables the Error Lens extension to highlight lines with diagnostics. |
| **Telemetry & Data** | | |
| `databricks.telemetry.enabled` | `false` | Disables telemetry data collection for the Databricks extension. |
| `telemetry.telemetryLevel` | `off` | Disables all telemetry and data collection from VS Code. |
| **Workbench & UI** | | |
| `workbench.enableExperiments`| `false` | Disables participation in user experience experiments. |
| `terminal.integrated.fontSize` | `14` | Sets the font size for the integrated terminal to 14. |
| `workbench.preferred...Theme` | `Default Dark Modern` | Sets the default theme for all UI states (light, dark, high contrast) to 'Default Dark Modern'. |
| `window.systemColorTheme` | `dark` | Sets the window's color theme to dark mode. |

## 🚀 Usage
These settings are automatically applied by Visual Studio Code when the `settings.json` file is placed in the user's configuration directory.

**Example of Effect:**
- The setting `"editor.fontSize": 14` directly controls the text size within the code editor, ensuring a consistent and readable experience.
- By setting `"telemetry.telemetryLevel": "off"`, no usage data is sent to Microsoft, enhancing user privacy.
