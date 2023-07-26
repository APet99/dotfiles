# dotfiles

## Neovim

`brew install neovim`

### Requirements

#### Plugin Dependencies

- `brew install ripgrep` Used for Telescope - fast alterntive to grep that's super fast
- `brew install make` Some plugins may use this to build
- `brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font` Some plugins use nerd fonts to display icons as characters.
  Don't forget to set the font of your terminal to this newly installed font.

#### Formatters/Linters

```
npm i -g eslint_d
$ npm install -g @fsouza/prettierd
brew install stylua
brew install autopep8
brew install rustfmt
```

- neovim version >0.9X should be installed

### Installation

1. Install a nerd font, and set it for your terminal
2. Install daemons for formatting/ linting.
3. Place config where it belongs (`~/.config/nvim`):
   `git clone --depth 1 https://github.com/APet99/dotfiles ~:/.config/nvim`
4. Start neovim with `nvim`, and plugins should automatically install.

**Note:** there is a current issue I have ran into, where the automatic installation
of the plugin `telescope-fzf-native` has an issue building. The solution is to manually
build the plugin, then all should be well. To do this:

1. Go to the directory where the plugin is installed
   `cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim/`
2. Run `make` to manually build the plugin.
