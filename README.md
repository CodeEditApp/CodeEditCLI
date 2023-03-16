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

### Homebrew (Recommended)

```sh
brew install codeeditapp/formulae/codeedit-cli

# or 

brew tap codeeditapp/formulae
brew install codeedit-cli
```

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


## Related Repositories

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/CodeEditApp/CodeEdit">
        <img src="https://user-images.githubusercontent.com/806104/163099605-4eaedd33-8441-4125-9ca1-a7ccb2f62a74.png" width="128" height="128">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CodeEdit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/CodeEditApp/CodeEditTextView">
        <img src="https://user-images.githubusercontent.com/806104/175655252-d77cef62-31f5-4f40-a2ad-c1406a6dd1b9.png" width="128" height="128">
        <p>CodeEditTextView</p>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/CodeEditApp/CodeEditLanguages">
        <img src="https://user-images.githubusercontent.com/806104/201497920-d6aace8d-f0dc-49f6-bcd7-6a3b64cc384c.png" height="128">
        <p>CodeEditLanguages</p>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/CodeEditApp/CodeEditKit">
        <img src="https://user-images.githubusercontent.com/806104/193877051-c60d255d-0b6a-408c-bb21-6fabc5e0e60c.png" width="128" height="128">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CodeEditKit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
      </a>
    </td>
  </tr>
</table>
