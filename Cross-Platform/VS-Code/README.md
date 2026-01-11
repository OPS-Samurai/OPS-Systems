# 💻 VS-Code Settings Control Module
## 🛠️ Prerequisites
- Visual Studio Code installation.

## ⚙️ Technical Details
This module comprises the `settings.json` configuration file, which customizes various aspects of the Visual Studio Code editor and its extensions. It is a JSON-formatted file where each key-value pair defines a specific setting.

## 🚀 Usage Protocols
- **`debug.openDebug`**: Configures debug view behavior.
  - `openOnDebugBreak`: Opens the debug view only when a breakpoint is encountered.
- **`editor.tabCompletion`**: Disables tab completion functionality within the editor.
- **`files.defaultLanguage`**: Specifies the default language mode for new files.
- **`editor.wordSeparators`**: Defines custom characters that act as word separators for editor operations.
- **`powershell.buttons.showPanelMovementButtons`**: Conceals panel movement buttons for PowerShell related panels.
- **`powershell.codeFolding.showLastLine`**: Enables the display of the last line during code folding for PowerShell scripts.
- **`snyk.advanced.cliPath`**: Sets the explicit file path to the Snyk command-line interface executable.
- **`snyk.securityAtInception.autoConfigureSnykMcpServer`**: Automatically configures the Snyk Multi-Cloud Platform (MCP) server integration.
- **`snyk.securityAtInception.executionFrequency`**: Establishes the frequency for Snyk security scans as "On Code Generation".
- **`snyk.trustedFolders`**: Configured as `null`, indicating no specific trusted folders are defined by Snyk within this configuration.
- **`errorLens.enabled`**: Activates the Error Lens extension for enhanced error visualization.
- **`powershell.sideBar.CommandExplorerVisibility`**: Controls the visibility of the PowerShell Command Explorer in the sidebar.
- **`workbench.enableExperiments`**: Disables experimental features across the workbench.
- **`powershell.integratedConsole.showStartBanner`**: Suppresses the display of the startup banner in the integrated PowerShell console.
- **`powershell.integratedConsole.focusConsoleOnExecute`**: Prevents the integrated console from automatically gaining focus upon command execution.
- **`editor.fontSize`**: Sets the global font size for the editor to 14 pixels.
- **`databricks.telemetry.enabled`**: Disables telemetry data collection for Databricks extensions.
- **`telemetry.telemetryLevel`**: Sets the global telemetry collection level to "off".
- **`terminal.integrated.fontSize`**: Sets the font size for the integrated terminal to 14 pixels.
- **`editor.guides.indentation`**: Activates indentation guides within the editor.
- **`workbench.preferredHighContrastLightColorTheme`**: Specifies "Default Dark Modern" as the preferred high contrast light color theme.
- **`workbench.preferredLightColorTheme`**: Specifies "Default Dark Modern" as the preferred light color theme.
- **`workbench.preferredHighContrastColorTheme`**: Specifies "Default Dark Modern" as the preferred high contrast color theme.
- **`window.systemColorTheme`**: Sets the window system color theme to "dark".
