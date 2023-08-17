# VSCode Settings

Repo for storing my VSCode settings.

## Usage

### Settings

To update the settings file in this repo run this command.

```bash
./settings.sh update
```

To install the settings from the repo to your local machine run this command.

> **WARNING**
> This command will overwrite any existing settings. However, a copy of your existing settings will be made in this directory under the name `settings.json.bak`.

```bash
./settings.sh install
```

### Seeing What Changed

To see what settings or extensions changed you can diff the backup or your old config with the newly installed version.

```bash
git diff --no-index settings.json.bak settings.json
git diff --no-index extensions.txt.bak extensions.txt
```
