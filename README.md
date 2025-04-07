https://www.github.com/brianespinoza/dotfiles
todo: checkout neotest, cyberdream clolorscheme

# Dotfiles

This is a collection of dotfiles for my personal use.

## Installation

Clone the repository to your home directory and run the install script.

```sh
cd ~/.dotfiles
chmod +x install.sh
./install.sh

```

This will install and start the services.

## Features

### Wezterm shortcuts

| Shortcut | Description |
| :--- | :--- |
| `Ctrl` + `Shift` + <SPACE> | Quick-select mode. Copy anything on screen. |
| `Ctrl` + `Shift` + `X` | Copy mode. Navigate the terminal with vim keys. |



### git and alias Commands

| Alias | Description |
| :--- | :--- |
| `als` | List all aliases by group |
| `als <group>` or `als -g <group>` | List all aliases in a group or a specific alias |
| `gaa`                  | `git add --all`                                                                                                                 |
| `gapa`                 | `git add --patch`                                                                                                               |
| `gau`                  | `git add --update`                                                                                                              |
| `gav`                  | `git add --verbose`                                                                                                             |

### gitignore commands

| Alias | Description |
| :--- | :--- |
| `gi list` | List all gitignore templates |
| `gi <template>` | Show gitignore template |
| `gi <template> >> .gitignore` | Appending programming language settings to your projects .gitignore. |

### fzf usage

| Alias | Description |
| :--- | :--- |
| `fzf` | Open fzf |
| `git log | fzf <TAB>` | Search the output of a command |

| Token     | Match type                              | Description                                  |
| --------- | --------------------------------------  | ------------------------------------------   |
| `sbtrkt`  | fuzzy-match                             | Items that match `sbtrkt`                    |
| `'wild`   | exact-match (quoted)                    | Items that include `wild`                    |
| `'wild'`  | exact-boundary-match (quoted both ends) | Items that include `wild` at word boundaries |
| `^music`  | prefix-exact-match                      | Items that start with `music`                |
| `.mp3$`   | suffix-exact-match                      | Items that end with `.mp3`                   |
| `!fire`   | inverse-exact-match                     | Items that do not include `fire`             |
| `!^music` | inverse-prefix-exact-match              | Items that do not start with `music`         |
| `!.mp3$`  | inverse-suffix-exact-match              | Items that do not end with `.mp3`            |

If you don't prefer fuzzy matching and do not wish to "quote" every word,
start fzf with `-e` or `--exact` option. Note that when  `--exact` is set,
`'`-prefix "unquotes" the term.

A single bar character term acts as an OR operator. For example, the following
query matches entries that start with `core` and end with either `go`, `rb`,
or `py`.

```
^core go$ | rb$ | py$
```

### ls command

| Alias | Command      | Description                                                                 |
| ----- | ------------ | --------------------------------------------------------------------------- |
| l     | `ls -lFh`    | List files as a long list, show size, type, human-readable                  |
| la    | `ls -lAFh`   | List almost all files as a long list show size, type, human-readable        |
| lr    | `ls -tRFh`   | List files recursively sorted by date, show type, human-readable            |
| lt    | `ls -ltFh`   | List files as a long list sorted by date, show type, human-readable         |
| ll    | `ls -l`      | List files as a long list                                                   |
| ldot  | `ls -ld .*`  | List dot files as a long list                                               |
| lS    | `ls -1FSsh`  | List files showing only size and name sorted by size                        |
| lart  | `ls -1Fcart` | List all files sorted in reverse of create/modification time (oldest first) |
| lrt   | `ls -1Fcrt`  | List files sorted in reverse of create/modification time(oldest first)      |
| lsr   | `ls -lARFh`  | List all files and directories recursively                                  |
| lsn   | `ls -1`      | List files and directories in a single column                               |

### File handling

| Alias | Command               | Description                                                                     |
| ----- | --------------------- | ------------------------------------------------------------------------------- |
| rm    | `rm -i`               | Remove a file                                                                   |
| cp    | `cp -i`               | Copy a file                                                                     |
| mv    | `mv -i`               | Move a file                                                                     |
| zshrc | `${=EDITOR} ~/.zshrc` | Quickly access the ~/.zshrc file                                                |
| dud   | `du -d 1 -h`          | Display the size of files at depth 1 in current location in human-readable form |
| duf\* | `du -sh`              | Display the size of files in current location in human-readable form            |
| t     | `tail -f`             | Shorthand for tail which outputs the last part of a file                        |

\* Only if the [`duf`](https://github.com/muesli/duf) command isn't installed.

### find and grep

| Alias | Command                                            | Description                          |
| ----- | -------------------------------------------------- | ------------------------------------ |
| fd\*  | `find . -type d -name`                             | Find a directory with the given name |
| ff    | `find . -type f -name`                             | Find a file with the given name      |
| grep  | `grep --color`                                     | Searches for a query string          |
| sgrep | `grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}` | Useful for searching within files    |

\* Only if the [`fd`](https://github.com/sharkdp/fd) command isn't installed.

### The Fuck

| Alias | Description |
| :--- | :--- |
| `fuck` | Fix previous command |

### Zoxide

| Alias | Description |
| :--- | :--- |
| `z` | Open Zoxide |
| `z <query>` | Search Zoxide |
| z foo              | cd into highest ranked directory matching foo |
| z foo bar          | cd into highest ranked directory matching foo and bar |
| z foo /            | cd into a subdirectory starting with foo |
| z ~/foo            | z also works like a regular cd command |
| z foo/             | cd into relative path |
| z ..               | cd one level up |
| z -                | cd into previous directory |
| zi foo             | cd with interactive selection (using fzf) |
| z foo<SPACE><TAB>  | show interactive completions (zoxide v0.8.0+, bash 4.4+/fish/zsh only) |

### Other Aliases

| Alias    | Command            | Description                                                 |
| -------- | ------------------ | ----------------------------------------------------------- |
| h        | `history`          | Lists all recently used commands                            |
| hgrep    | `fc -El 0 \| grep` | Searches for a word in the list of previously used commands |
| help     | `man`              | Opens up the man page for a command                         |
| p        | `ps -f`            | Displays currently executing processes                      |
| sortnr   | `sort -n -r`       | Used to sort the lines of a text file                       |
| unexport | `unset`            | Used to unset an environment variable                       |

### Httpie examples

| Command | Description |
| :--- | :--- |
| `https httpie.io/hello` | GET request |
| `http PUT pie.dev/put X-API-Token:123 name=John` | PUT request |
| `http https://httpbin.org/get` | Send a GET request to the specified URL |
| `http -f POST pie.dev/post hello=World` | Send a POST request form. |
| `http -v pie.dev/get` | See the request that is sent. |
| `http pie.dev/post < files/data.json` | Upload a file. |
| `http pie.dev/image/png > image.png` | Download a file. |

