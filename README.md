# myneovim
> What is this repo?

This repo is my backup for vscode with embeded neovim using the `vscode-neovim` extension. This config is stricktly for me and the following steps are made for me so that i can ensure my config does not break when i try to clone it from here to my local machine.


# How to install?
If for some reason i lose my config, i can clone it from here.

---
## Installing neovim form source
This config works best when neovim is installed form source.

Note that this config was made a catered toward neovim v0.8.4. So if you apply this to another version of neovim, you may be greated with a red wall of angry error messages.

Here is how to install from `source`:

- First we have to clone the neovim repo:
  ```sh using ssh keys
  git clone -b v0.8.4 git@github.com:neovim/neovim.git 
  ```

  ```sh or urls
  git clone -b v0.8.4 git@github.com:neovim/neovim.git 
  ```

- Then, we install neovim:
  ```sh
  cd vscode-with-nvim
  make CMAKE_BUILD_TYPE=Release
  sudo make install
  ```
---
## Instaling packer
This config also needs a specific version of packer.

Make sure that you delete `~/.local/share/nvim/site/pack/packer/start/packer.nvim` so that the appropriate packer version can be downloaded.

```sh initialize an empty repo
cd ~/.local/share/nvim/site/pack/packer/start/
mkdir packer.nvim
cd packer.nvim
```

```sh pull packer at the right commit
git remote add origin git@github.com:wbthomason/packer.nvim.git 
git pull origin 1d0cf98a561f7fd654c970c49f917d74fafe1530
```

## Install the neovim config

Make sure to remove or move your current `nvim` directory

```sh
git clone git@github.com:FarrukhKamal48/vscode-with-nvim.git ~/.config/nvim
```

Befor opening neovim, delete all previous plugins in `~/.local/share/nvim/site/pack/packer/start/` eccept for `packer.nvim`

Run `nvim ~/.config/nvim/lua/user/plugins.lua`, save and wait for the plugins to be installed

If some plugins are not loaded, then run this:
```
:PackerSync
```
After that, re-open neovim to see the plugins take effect.

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim) 


## Vscode configuration
Upon opening `~/.config/nvim` you will notice a folder named `vscodeConfig`. This contains the `keybindings.json` and `settings.json` files. 

Before you can add these to your vscode configuration, you have to install the following extensions:
  `VSCode Neovim`
  `Which Key`
  `multi-command`

After that, reload vscode. Then we can add keybindings and settings

To add keybindings:

  - Click the gear icon on the bottom of the side bar and click on `Keyboard Shortcuts`
  
  - Click on `Open Keyboard Shortcuts (JSON)` on the top right

  - Paste in all the contents of `~/.config/nvim/vscodeConfig/keybindings.json` into your `keybindings.json`. Save and you done.

To add Settings:
  - Open `Settings` and click on `Open Settings (JSON)`
  
  - Copy everything after "configuration for vscode" in `~/.config/nvim/vscodeConfig/keybindings.json` and add it to your `settings.json`

Also, add to your `settings.json` the following:

```sh
  "vscode-neovim.neovimExecutablePaths.linux": "<location to your neovim execulabe> /usr/local/bin/nvim",
  "vscode-neovim.neovimInitVimPaths.linux": "<location to your init.lua> /home/farrukh/.config/nvim/init.lua",
```
Your done!

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
