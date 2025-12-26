# B-Magic's Auto Video Compiler - Self-Contained Edition

## What's New in This Version

🎉 **No Python Installation Required!** 

This version includes all necessary Python libraries bundled with the application, making it much easier to share and use on different computers.

## Quick Start

1. **Extract the ZIP file** to any folder on your computer
2. **Run either launcher:**
   - **`Launch_BMagic_AutoVidCompiler_Silent.vbs`** - Silent launch (no console window)
   - **`Launch_UO_Video_Compiler.bat`** - Shows progress window

## What's Included

✅ **Self-contained Python libraries** (Pillow, QRCode)
✅ **Enhanced launchers** that handle ZIP extraction edge cases  
✅ **All original features** (FFmpeg, music, intros, etc.)
✅ **Cleaner interface** (removed version numbers and game-specific text)

## System Requirements

- **Windows 10/11** (64-bit)
- **Python 3.8+** (any version installed on the system)
- The app will use whatever Python version you have installed

## How It Works

1. The bundled `python-libs` folder contains all required packages
2. The launchers automatically detect your system Python installation  
3. The GUI loads the bundled libraries automatically
4. No need to install Pillow, QRCode, or other dependencies!

## Troubleshooting

If the launchers don't work:

1. **Install Python** from https://www.python.org/downloads/
2. **Check "Add Python to PATH"** during installation
3. **Try the batch file** if the VBScript doesn't work
4. **Extract to a simple folder path** (avoid spaces or special characters)

## File Structure After Extraction

```
BMagic_AutoVidCompiler_v1.0_FINAL/
├── Launch_BMagic_AutoVidCompiler_Silent.vbs  ← Silent launcher
├── Launch_UO_Video_Compiler.bat             ← Batch launcher
├── UOVidCompiler_GUI.py                     ← Main GUI
├── UOVidCompiler.py                         ← Core compiler
├── python-libs/                             ← Bundled libraries
├── ffmpeg/                                  ← Video processing tools
├── Music/                                   ← Background music
├── Intros/                                  ← Intro videos
├── icons/                                   ← Application icons
└── README.md                                ← This file
```

## Support

- **GitHub**: [Your repository link here]
- **Email**: [Your contact email here]

Thank you for using B-Magic's Auto Video Compiler! 🎬