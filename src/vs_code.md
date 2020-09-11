# Visual Studio Code

## EditorConfig for VS Code

> This plugin attempts to override user/workspace settings with settings found in .editorconfig files.

A formázási beállításokhoz a [MS ajánlása szerinti](https://docs.microsoft.com/en-us/visualstudio/ide/editorconfig-code-style-settings-reference?view=vs-2019) .editorconfig fájl hozzáadásra került a projekthez.

## C#

> - Lightweight development tools for .NET Core.
> - Great C# editing support, including Syntax Highlighting, IntelliSense,Go to Definition, Find All References, etc.
> - Debugging support for .NET Core (CoreCLR).
>     - NOTE: Mono debugging is not supported. Desktop CLR debugging has limited support.
> - Support for project.json and csproj projects on Windows, macOS and Linux.

## Auto-Using for C#

> Auto-imports and provides intellisense for references that were not yet imported in a C# file.

## Automatikus kódformázás

[StackOverflow://Auto format C# code In Visual Studio Code](https://stackoverflow.com/questions/49500433/auto-format-c-sharp-code-in-visual-studio-code)

## .NET Core Test

Unit test támogatás *MSTest*, *xUnit* és *NUnit* keretrendszerekhez.

Ajánlott beállítások, amiket a `.vscode/settings.json` fájlban kell elhelyezni:

```json
{
    "dotnet-test-explorer.testProjectPath": "**/*Tests.csproj",
    "dotnet-test-explorer.autoWatch": true
}
```

<!-- C# FixFormat -->


