## 1. Overview

This document provides a detailed explanation of the settings configured in the `settings.json` file for Visual Studio Code. This configuration is designed to optimize the development workflow by customizing the editor's behavior, appearance, and integrated tools.

## 2. Prerequisites

- **Visual Studio Code**: This configuration is intended for the Visual Studio Code editor. It is expected that VS Code is already installed on the system.
- **Extensions**: Some settings are specific to certain extensions (e.g., PowerShell, Snyk, ErrorLens). These extensions should be installed for the corresponding settings to take effect.

## 3. Usage

The `settings.json` file is a user-specific configuration. The settings are applied automatically by Visual Studio Code upon opening the editor. Below is a detailed breakdown of each setting.

---

### General Editor Settings

- **`"editor.tabCompletion": "off"`**
  - **Description**: Disables the autocompletion of suggestions when the `Tab` key is pressed.

- **`"editor.wordSeparators": "\`~!@#$%^&*()-=+[{]}\\|;:'\",.<>/?`**
  - **Description**: Defines the set of characters that are treated as word separators for actions like word navigation and selection.

- **`"editor.fontSize": 14`**
  - **Description**: Sets the font size for the text in the editor panels.

- **`"editor.guides.indentation": true`**
  - **Description**: Enables the rendering of indentation guides to visualize code structure.

- **`"files.defaultLanguage": ""`**
  - **Description**: Specifies the default language mode for new files. An empty string means no default is set, and VS Code may prompt the user to select a language.

### Workbench & Window Settings

- **`"workbench.enableExperiments": false"`**
  - **Description**: Opts out of participating in Visual Studio Code's experimental features.

- **`"workbench.preferredHighContrastLightColorTheme": "Default Dark Modern"`**
- **`"workbench.preferredLightColorTheme": "Default Dark Modern"`**
- **`"workbench.preferredHighContrastColorTheme": "Default Dark Modern"`**
  - **Description**: These settings define the preferred color theme to be "Default Dark Modern" across different contrast modes.

- **`"window.systemColorTheme": "dark"`**
  - **Description**: Indicates a preference for a dark theme. Note: This setting is less common now; theme selection is typically managed by `workbench.colorTheme`.

### PowerShell Extension Settings

- **`"powershell.buttons.showPanelMovementButtons": false"`**
  - **Description**: Hides the panel movement buttons in the PowerShell Integrated Console.

- **`"powershell.codeFolding.showLastLine": true"`**
  - **Description**: Ensures that the last line of a folded code block is visible.

- **`"powershell.sideBar.CommandExplorerVisibility": true"`**
  - **Description**: Makes the PowerShell Command Explorer visible in the side bar.

- **`"powershell.integratedConsole.showStartBanner": false"`**
  - **Description**: Hides the startup banner and version information when a new PowerShell Integrated Console is opened.

- **`"powershell.integratedConsole.focusConsoleOnExecute": false"`**
  - **Description**: Prevents the Integrated Console from automatically taking focus when code is executed from the editor.

### Snyk Extension Settings

- **`"snyk.advanced.cliPath": "C:\\Users\\NGonc\\AppData\\Local\\snyk\\vscode-cli\\snyk-win.exe"`**
  - **Description**: Specifies the absolute file path to the Snyk CLI executable. This path is user-specific and may require modification depending on the installation location.

- **`"snyk.securityAtInception.autoConfigureSnykMcpServer": true"`**
  - **Description**: Enables automatic configuration of the Snyk MCP (Misconfiguration Prevention) server.

- **`"snyk.securityAtInception.executionFrequency": "On Code Generation"`**
  - **Description**: Configures Snyk scans to be triggered automatically upon code generation events.

- **`"snyk.trustedFolders": null`**
  - **Description**: Defines a list of folders to be trusted by Snyk. A value of `null` indicates that no folders are explicitly added to the trusted list through this setting.

### Other Settings

- **`"debug.openDebug": "openOnDebugBreak"`**
  - **Description**: Configures the debug view to open automatically only when the debugger pauses at a breakpoint.

- **`"errorLens.enabled": true"`**
  - **Description**: Enables the ErrorLens extension, which enhances code diagnostics by highlighting lines containing errors, warnings, or other issues.

- **`"telemetry.telemetryLevel": "off"`**
  - **Description**: Disables the collection and sending of usage data (telemetry) to Microsoft.

- **`"databricks.telemetry.enabled": false"`**
  - **Description**: Disables telemetry for the Databricks extension specifically.

- **`"terminal.integrated.fontSize": 14`**
  - **Description**: Sets the font size for the text in the Integrated Terminal.
