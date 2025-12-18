Manage Xcode installations using the xcodes CLI.

Present the user with the following options in a code block:
1. List installed Xcode versions
2. List available Xcode versions
3. Install a specific Xcode version
4. Uninstall a specific Xcode version
5. Select/switch active Xcode version

Ask the user which action they would like to perform.

When installing Xcode, always use these flags for optimal performance:
- `--experimental-unxip` - Uses faster unxip method
- `--aria2` - Uses aria2 for faster downloads (falls back to URLSession if aria2 not installed)
- `--arch arm64` - Installs only the Apple Silicon binary (smaller download)

Example install command:
```
xcodes install <version> --experimental-unxip --aria2 --arch arm64
```

For listing versions:
- Installed: `xcodes installed`
- Available: `xcodes list`

For uninstalling:
```
xcodes uninstall <version>
```

For selecting active version:
```
xcodes select <version>
```

If $ARGUMENTS is provided, treat it as the action/version selection and skip the prompting step.

User selection: $ARGUMENTS
