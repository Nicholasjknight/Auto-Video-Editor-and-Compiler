' B-Magic's Auto Video Compiler - Silent Launcher
' This VBScript launches the GUI without any command window

Dim objShell, objFSO, strScriptDir, strPythonScript, strNestedDir

' Get current directory where this script is located
Set objFSO = CreateObject("Scripting.FileSystemObject")
strScriptDir = objFSO.GetParentFolderName(WScript.ScriptFullName)
strPythonScript = strScriptDir & "\UOVidCompiler_GUI.py"

' Check if the Python script exists in current directory
If Not objFSO.FileExists(strPythonScript) Then
    ' Check if there's a nested folder with the same name (common with ZIP extraction)
    strNestedDir = strScriptDir & "\BMagic_AutoVidCompiler_v1.0_FINAL"
    If objFSO.FolderExists(strNestedDir) Then
        strPythonScript = strNestedDir & "\UOVidCompiler_GUI.py"
        If objFSO.FileExists(strPythonScript) Then
            ' Update script directory to the nested folder
            strScriptDir = strNestedDir
        End If
    End If
End If

' Final check if the Python script exists
If Not objFSO.FileExists(strPythonScript) Then
    MsgBox "Error: UOVidCompiler_GUI.py not found!" & vbCrLf & _
           "Searched in:" & vbCrLf & _
           "- " & objFSO.GetParentFolderName(WScript.ScriptFullName) & vbCrLf & _
           "- " & strNestedDir & vbCrLf & vbCrLf & _
           "Please make sure all files are properly extracted.", _
           vbCritical, "B-Magic's Auto Video Compiler"
    WScript.Quit
End If

' Launch using system Python with bundled libraries
Set objShell = CreateObject("WScript.Shell")
objShell.CurrentDirectory = strScriptDir

' Try different Python executables
On Error Resume Next
objShell.Run """pythonw"" """ & strPythonScript & """", 0, False
If Err.Number <> 0 Then
    ' Try regular python if pythonw fails
    objShell.Run """python"" """ & strPythonScript & """", 7, False
    If Err.Number <> 0 Then
        ' Try py launcher
        objShell.Run """py"" """ & strPythonScript & """", 7, False
        If Err.Number <> 0 Then
            MsgBox "Error: Could not launch application!" & vbCrLf & vbCrLf & _
                   "Python not found in system PATH." & vbCrLf & _
                   "Please install Python from https://www.python.org/downloads/" & vbCrLf & _
                   "or try running: Launch_UO_Video_Compiler.bat", _
                   vbCritical, "B-Magic's Auto Video Compiler"
        End If
    End If
End If
On Error GoTo 0

' Clean up objects
Set objShell = Nothing
Set objFSO = Nothing