<p align="center">
  <img src="https://user-images.githubusercontent.com/806104/205848006-f2654778-21f1-4f97-b292-32849cc1eff6.png" height="128">
  <h1 align="center">CodeEdit CLI</h1>
</p>

<p align="center">
  <a aria-label="Follow CodeEdit on Twitter" href="https://twitter.com/CodeEditApp" target="_blank">
    <img alt="" src="https://img.shields.io/badge/Follow%20@CodeEditApp-black.svg?style=for-the-badge&logo=Twitter">
  </a>
  <a aria-label="Join the community on Discord" href="https://discord.gg/vChUXVf9Em" target="_blank">
    <img alt="" src="https://img.shields.io/badge/Join%20the%20community-black.svg?style=for-the-badge&logo=Discord">
  </a>
</p>

`codeedit` is a set of command line tools that ship with CodeEdit which allow users to open and interact with editor via the command line.

## Installation

### Download

Download the universal binary from the latest release, extract the zip and move it to `/usr/local/bin/`.

### Build locally

```sh
swift build -c release --arch arm64 --arch x86_64
sudo cp -f .build/apple/Products/Release/codeedit /usr/local/bin/codeedit
```

> Note that you must have `CodeEdit` installed in a `Release` configuration. A `Debug` build of `CodeEdit` will not work.

## Documentation

### `open`

Opens CodeEdit.

### Folder

```sh
codeedit ./my-project
```

### File

```sh
codeedit index.html
```

From an optional line

```sh
codeedit index.html:50
```

From an optional line and column

```sh
codeedit index.html:50:50
```

### `version`

Outputs the version of CodeEdit and CodeEdit CLI Tools.

```sh
codeedit version
```

### `new-window` (not available yet)

Opens a new window.

```sh
codeedit new-window
```

### `--goto` (not available yet)

Opens a file at a line and optional position.

Documentation coming soon.

### `list-extensions` (not available yet)

Documentation coming soon.

### `install` (not available yet)

Install an extension.

Documentation coming soon.

### `uninstall` (not available yet)

Uninstall an extension.

Documentation coming soon.

### `activate` (not available yet)

Activate an extension.

Documentation coming soon.

### `deactivate` (not available yet)

Deactivate an extension.

Documentation coming soon.
