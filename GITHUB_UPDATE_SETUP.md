# GitHub Auto-Update Setup Guide

## Overview
Your application now has automatic update checking! When users launch the app, it checks GitHub for new versions and prompts them to update automatically.

## Setup Steps

### 1. Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `BMagic-AutoVidCompiler` (or your preferred name)
3. Choose **Public** or **Private** (both work, but public is easier)
4. Don't initialize with README (we'll push existing code)
5. Click "Create repository"

### 2. Update Repository Name in Code

Open `UOVidCompiler_GUI.py` and change line ~41:
```python
GITHUB_REPO = "Nicholasjknight/Auto-Video-Editor-and-Compiler"
```
Replace `YourGitHubUsername` with your actual GitHub username.

### 3. Push Code to GitHub from VS Code

```powershell
# Initialize git (only once)
cd "C:\Users\nknig\Downloads\BMagic_AutoVidCompiler_v1.1_Backup"
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit - BMagic Auto Vid Compiler v1.1.0"

# Connect to GitHub repo (replace USERNAME)
git remote add origin https://github.com/USERNAME/BMagic-AutoVidCompiler.git

# Push to GitHub
git push -u origin main
```

If it asks for credentials, use a **Personal Access Token** (not password):
- Go to GitHub Settings → Developer Settings → Personal Access Tokens → Tokens (classic)
- Generate new token with `repo` scope
- Use this token as your password

### 4. Create Your First Release

#### From VS Code Terminal:
```powershell
# Tag the current version
git tag -a v1.1.0 -m "Release v1.1.0 - Initial public release with auto-update"
git push origin v1.1.0
```

#### On GitHub Website:
1. Go to your repo → "Releases" tab
2. Click "Create a new release"
3. Tag: `v1.1.0` (should show as existing tag)
4. Title: `v1.1.0 - Initial Release`
5. Description (changelog):
   ```
   ## Features
   - Smart overlap detection for retroactive recording
   - Auto-resolution detection
   - Music and intro support
   - GUI configuration
   - Automatic updates
   
   ## Bug Fixes
   - Fixed trim duration selector
   - Audio format validation and conversion
   ```
6. **Attach the executable file**: Click "Attach binaries" and upload:
   - `BMagic_AutoVidCompiler_TrimFix_20251114_225447.exe`
   - Rename it to: `BMagic_AutoVidCompiler.exe` (simpler name)
7. Click "Publish release"

### 5. For Future Updates

When you make changes and want to push an update:

```powershell
# 1. Update VERSION in UOVidCompiler_GUI.py
# Change: VERSION = "1.1.0" to VERSION = "1.1.1" (or 1.2.0, etc.)

# 2. Rebuild executable
python -m PyInstaller BMagic_AutoVidCompiler_PERFECT.spec --clean --noconfirm

# 3. Commit changes
git add .
git commit -m "Update to v1.1.1 - Fixed XYZ issue"

# 4. Create tag
git tag -a v1.1.1 -m "Release v1.1.1"

# 5. Push code and tag
git push
git push origin v1.1.1

# 6. Create GitHub Release
# - Go to GitHub → Releases → "Draft a new release"
# - Select tag: v1.1.1
# - Add changelog
# - Upload new .exe file
# - Publish
```

## How Auto-Update Works

1. **On Startup**: App checks GitHub API for latest release
2. **Version Compare**: Compares user's version with latest on GitHub
3. **User Prompt**: If newer version exists, shows dialog with changelog
4. **Download**: User clicks "Yes" → downloads new .exe to temp folder
5. **Install**: Creates batch script that runs when app closes
6. **Auto-Restart**: Batch script replaces old .exe and restarts app

## Version Numbering

Use semantic versioning: `MAJOR.MINOR.PATCH`
- **MAJOR** (1.x.x): Breaking changes, major features
- **MINOR** (x.1.x): New features, non-breaking
- **PATCH** (x.x.1): Bug fixes, small improvements

Examples:
- `1.1.0` → `1.1.1` (bug fix)
- `1.1.1` → `1.2.0` (new feature)
- `1.2.0` → `2.0.0` (major rewrite)

## Testing Auto-Update

1. Build and release v1.1.0
2. Change VERSION to "1.1.1" in code
3. Build and release v1.1.1
4. Run the v1.1.0 executable
5. Should see update prompt automatically!

## Troubleshooting

**Update check fails silently**
- Check GITHUB_REPO is correct username/repo
- Verify GitHub repo is public or token has access
- Check internet connection

**Download fails**
- Ensure .exe file is attached to GitHub release
- Check file isn't too large (>100MB may be slow)

**Update doesn't apply**
- Check user has write permission in app directory
- Windows may block .exe downloads (need to allow)

## Distribution

Just share the GitHub Releases page URL:
`https://github.com/Nicholasjknight/Auto-Video-Editor-and-Compiler/releases/latest`

Users download the .exe once, then auto-updates forever!

## Pro Tips

- Always test new version yourself before releasing
- Write clear changelogs so users know what changed
- Keep exe filename consistent: `BMagic_AutoVidCompiler.exe`
- Can delete old releases to save space (keep last 3-5)
- Tag format must match: `v1.1.0` (with 'v' prefix)
