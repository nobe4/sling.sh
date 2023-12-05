# `sling.sh`

> Simple launcher.

I used [Alfred](https://www.alfredapp.com/) for a while, and was lurking at
[Raycast](https://www.raycast.com/) before I decided to write this.

I realised that I spend most my time in a terminal and only wanted to be able to
run scripts from anywhere, terminal, or not.

`sling.sh` is the result of this write. It's naïve and bare bone on purpose, you
need to adapt it to your configuration.

## How it works

- Create a list of `commands` that can be run.
- Use `fzf` to fuzzy-find the one you want.
- Run it.

## Install

- Copy [`sling.sh`](./sling.sh) somewhere in your `$PATH`.

- Adjust to your setup:

	In [`sling.sh`](./sling.sh) change:

	- `LOG_FILE`
	- `find "${HOME}/bin/commands"`
	- anything else

- Optional - Set a global shortcut.

### Shortcuts

To access this from non-terminal applications, you need to configure your OS to
start a terminal with this command.

You need to adjust the following to your custom configuration.

#### macOS - native

1. Create an Automator workflow that runs one of the following:

	- [`Terminal.app`](https://support.apple.com/en-gu/guide/terminal/welcome/mac)
		`Run AppleScript`:
		```applescript
		tell application "Terminal" to activate
		tell application "Terminal" to do script "sling.sh; exit"
		```

	- [`kitty`](https://sw.kovidgoyal.net/kitty/)
		`Run Shell Script`
		```bash
		source "${HOME}/.zprofile" && kitty sling.sh
		```

	- ...

1. Assign a global shortcut to this workflow.
	1. Settings
	1. Keyboards
	1. Shortcuts
	1. Services
	1. General
	1. Select the service and set the shortcut

#### Other setups

TBD, PR welcomed.

## Requirements

- [`fzf`](https://github.com/junegunn/fzf)

## Usage

```bash
sling.sh
```

See full help at [`sling.sh`](./sling.sh) or with `sling.sh -h`.
