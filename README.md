# myneovim
> Why is this repo?

This repo is supposed to be my backup for the current neovim config i have. This config is stricktly for me and the following steps are made for me so that i can ensure my config does not break when i try to clone it from here to my local machine.

This repo is just my personalized version of [nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide) by [ChristianChiarulli](https://github.com/ChristianChiarulli) (awesome guy by the way). 

# How to install?
If for some reason i lose my config, i can clone it from here.

---
## Installing neovim form source
This config works best when neovim is installed form source.

Here is how to install from `source`:

```sh
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.7
make CMAKE_BUILD_TYPE=Release
sudo make install
```
---
## Install the config

Make sure to remove or move your current `nvim` directory

```sh
git clone git@github.com:FarrukhKamal48/nvimCONF.git ~/.config/nvim
```

Run `nvim ~/.config/nvim/lua/user/plugins.lua` and wait for the plugins to be installed

If some plugins are not loaded, then run this:
```
:PackerSync
```
After that, re-open neovim to see the plugins take effect.

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim) 

---
## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that `python` and `node` haven't been setup

So let's fix that

First we'll fix copy/paste
  ```sh
  sudo pacman -Sy xsel
  ```

Next we need to install `python` support (node is optional)

- Neovim `python` support

  ```sh
  pip install pynvim
  ```

- Neovim `node` support

  ```sh
  npm i -g neovim
  ```

We will also need `ripgrep` for Telescope to work: 

- Ripgrep

  ```sh
  sudo apt install ripgrep
  ```

Fix `null-ls`

- Prettier
  
  ```sh
  sudo pacman -Sy prettier
  ```
 
- Black
  
  ```
  sudo pacman -Sy python-black
  ```

- Stylua
  
  ```
  sudo pacman -Sy stylua
  ```

- Flake8
  
  ```
  sudo pacman -Sy flake8
  ```
That's it! We have fixed null-ls.

---
## Configuration

### LSP

To add a new LSP

First Enter:

```
:LspInstallInfo
```

and press `i` on the Language Server you wish to install

Next you will need to add the server to this list: [servers](https://github.com/FarrukhKamal48/nvimCONF/blob/main/lua/user/lsp/lsp-installer.lua#L6)

### Formatters and linters

Make sure the formatter or linter is installed and add it to this setup function: [null-ls](https://github.com/FarrukhKamal48/nvimCONF/blob/main/lua/user/lsp/null-ls.lua#L12)

**NOTE** Some are already setup as examples, remove them if you want

### Plugins

You can install new plugins here: [plugins](https://github.com/FarrukhKamal48/nvimCONF/blob/main/lua/user/plugins.lua#L42)
