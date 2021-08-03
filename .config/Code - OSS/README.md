# VSCode Settings

## All the plugin I use

- Add jsdoc comments
- advanced-new-file
- Bracket Pair Colorizer
- Better Comments
- C/C++
- clangd
- Docker
- GitLens
- Python
- Pylance
- Jupyter
- Live Server
- Prettier
- Quokka.js
- VSCode Neovim

## Some of the keybindings I use

- `alt-tab`: switch between the terminal and editor
- `alt-v`: toggle visibility of the bottom stuff (Terminal, Problems,...)
- `alt-p`: toggle Problems
- `ctrl-m`: toggle minimap

- `alt-a`: toggle activity bar
- `alt-]`: toggle side bar
- `ctrl-b`: toggle side bar
- `alt-e`: toggle side bar's explorer
- `alt-g`: toggle side bar's source control
- `alt-l`: toggle side bar's GitLens
- `ctrl-alt-d`: toggle side bar's debug
- `alt-x`: toggle side bar's extension

- `ctrl-n`: create new file using `advanced-new-file` extension
- `ctrl-p`: fuzzy search files (insert `>` to go to command pallet mode)
- `ctrl-shift-p`: command pallet
- `ctrl-shift-b`: build the project
- `alt-s`: list all the symbol in to the file in order to navigate to them.
  (use `ctrl-j/k` to navigate the list)

- `alt-n`: go to next tab
- `alt-b`: go to previous tab

- `ctrl-j`: go to next item in autocompletion
- `ctrl-k`: go to previous item in autocompletion

- `ctrl-,`: settings
- `ctrl-k ctrl-s`: keybindings

- `ctrl-.`: quik fix (code action)
- `shift-k`: (editor normal mode): hover info

- `alt-d`: go to definition
- `alt-p`: peek definition
- `alt-i`: go to implementation
- `alt-shitf-p`: peek implementation
- `alt-r`: go/peek to reference

  - `ctrl-j/k`: go to next/prev ref

- `alt-r`: in ctrl-f search: toggle regex mode

## Some tips

- Local symbols: type `@` in command pallet (clear `>` and type `@`) and search for
  the desired symbol in the code. The alternative is Ctrl-shift-. which I bound
  it to alt-s for symbols The alternative is `ctrl-shift-.` which I bound it to
  `alt-s` for symbols.
- Global symbols: type `#` in command palett.
- See the output of javascript code with `quokka.js` extension and with its
  command accessible via command pallet
- If a symbol appears multiple times in the code and you want to edit them at
  the same time, press `ctrl-d` few times to do so. press esc twice to get out
  of this mode.
- Set multiple cursors with `alt-clik` (usecase: repetitive css properties +
  openning and closing html tags)
- to cut a line in insert mode: `ctrl-x`
- move (and copy) up/down with: `alt (+shift) - down/up`
- highlight line by line in insert mode with `ctl-l`
- For creating snippets: `> Configure user snippets`
