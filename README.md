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

`codeedit` a set of command line tools that ship with CodeEdit which allow users to open and interact with editor via the command line.

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
codeedit index.html:50:15
```

### `--version`

Outputs the version of CodeEdit and CodeEdit CLI Tools.

```sh
codeedit --version
```

or 

```sh
codeedit -v
```

### `new-window`

Opens a new window.

```sh
codeedit new-window
```

### `--goto`

Opens a file at a line and optional position.

Documentation coming soon.

### `list-extensions`

Documentation coming soon.

### `install`

Install an extension.

Documentation coming soon.

### `uninstall`

Uninstall an extension.

Documentation coming soon.

### `activate`

Activate an extension.

Documentation coming soon.

### `deactivate`

Deactivate an extension.

Documentation coming soon.
