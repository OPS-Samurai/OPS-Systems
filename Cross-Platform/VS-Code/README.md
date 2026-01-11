# 💻 VS-Code Settings Control Module
## 🛠️ Prerequisites
This module requires an existing installation of Visual Studio Code.

## ⚙️ Technical Details
This control module is a JSON configuration file (`settings.json`) designed to standardize specific operational and visual settings within Visual Studio Code. It dictates various aspects of the editor's behavior, extensions, and aesthetic preferences to ensure a consistent development environment.

Key configurations include:
*   **Debugger Behavior**: `debug.openDebug` is set to `openOnDebugBreak`, automatically opening the debug view when a breakpoint is hit.
*   **Editor Enhancements**: `editor.tabCompletion` is disabled, and `editor.wordSeparators` is customized for enhanced word selection logic. `editor.fontSize` and `terminal.integrated.fontSize` define the text size for the editor and integrated terminal respectively. Indentation guides are enabled via `editor.guides.indentation`.
*   **PowerShell Integration**: Specific settings for the PowerShell extension (`powershell.*`) are configured, including disabling panel movement buttons, showing the last line for code folding, and suppressing the start banner in the integrated console.
*   **Security Tools**: Settings for the Snyk extension (`snyk.*`) are present, indicating a configuration for security analysis.
*   **Error Visualization**: `errorLens.enabled` activates the ErrorLens extension for inline error highlighting.
*   **Telemetry Control**: All telemetry collection (`databricks.telemetry.enabled`, `telemetry.telemetryLevel`) is explicitly disabled to enhance privacy.
*   **Theming**: Preferred color themes (`workbench.preferred...ColorTheme`, `window.systemColorTheme`) are set to "Default Dark Modern" to ensure a consistent dark mode experience.

## 🚀 Usage Protocols
To activate these settings, the provided JSON content must be saved as `settings.json` within the Visual Studio Code user or workspace settings directory.

**User Settings (Global):**
Place the `settings.json` file in:
*   **Windows:** `%APPDATA%\Code\User\settings.json`

**Workspace Settings (Project-Specific):**
Create a `.vscode` folder in the root of your project and place `settings.json` inside it:
*   `[Your Project Root]/.vscode/settings.json`

Workspace settings override user settings for the specific project. Upon saving the file, Visual Studio Code automatically applies the changes.
