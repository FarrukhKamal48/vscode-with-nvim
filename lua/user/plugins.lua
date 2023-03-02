local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim", commit = "1d0cf98a561f7fd654c970c49f917d74fafe1530"})

    use({ "nvim-lua/plenary.nvim", commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9"})
    use({ "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" }) -- Autopairs, integrates with both cmp and treesitter
    use({ "numToStr/Comment.nvim", commit = "eab2c83a0207369900e92783f56990808082eac2"})
    use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "a0f89563ba36b3bacd62cf967b46beb4c2c29e52"})
    use({ "kyazdani42/nvim-web-devicons", commit = "ade34ca7d19543904b28b903e606be8930fb9ee3"})
    use({ "kyazdani42/nvim-tree.lua", commit = "02fdc262eba188198a7deb2117b3b996e6763d65"})
    use({ "akinsho/bufferline.nvim", commit = "c7492a76ce8218e3335f027af44930576b561013"})
    use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56"})
    use({ "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" })
    use({ "akinsho/toggleterm.nvim", commit = "19aad0f41f47affbba1274f05e3c067e6d718e1e"})
    use({ "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" })
    use({ "lewis6991/impatient.nvim", commit = "c90e273f7b8c50a02f956c24ce4804a47f18162e"})
    use({ "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" })
    use({ "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" })
    use { 'CRAG666/code_runner.nvim', commit = "a010649236fe245eaab2641a13228cd601499715", requires = 'nvim-lua/plenary.nvim' }

    -- Colorschemes
    use({ "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" })
    use({ "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" })
    use("navarasu/onedark.nvim")
    use("Shatur/neovim-ayu")


    -- cmp plugins
    use({ "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" }) -- The completion plugin
    use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- buffer completions
    use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23"})
    use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566"})
    use({ "hrsh7th/cmp-nvim-lsp", commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef"})
    use({ "hrsh7th/cmp-nvim-lua", commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6"})

    -- unity
    use({"OmniSharp/omnisharp-vim"})--, commit = "7e88f137ad7b74b0beb7034e592bcd07922be5e8"})

    -- snippets
    use({ "L3MON4D3/LuaSnip", commit = "9bff06b570df29434a88f9c6a9cea3b21ca17208"})
    use({ "rafamadriz/friendly-snippets", commit = "a6f7a1609addb4e57daa6bedc300f77f8d225ab7"})

    -- LSP
    use({ "neovim/nvim-lspconfig", commit = "3913d27d757f6da6135aeca9800700f40d73b15e"})
    use({ "williamboman/nvim-lsp-installer", commit = "17e0bfa5f2c8854d1636fcd036dc8284db136baa"})
    use({ "jose-elias-alvarez/null-ls.nvim", commit = "60b4a7167c79c7d04d1ff48b55f2235bf58158a7"})
    use({ "RRethy/vim-illuminate", commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298"})

    -- Telescope
    use({ "nvim-telescope/telescope.nvim", commit = "203bf5609137600d73e8ed82703d6b0e320a5f36"})

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        commit = "f6df07be122de665fb363476cc3680c90f5bdf05"
    })
    use({"p00f/nvim-ts-rainbow", commit = "ef95c15a935f97c65a80e48e12fe72d49aacf9b9"})

    -- Git
    use({ "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" })
    use({"kdheepak/lazygit.nvim", commit = "9c73fd69a4c1cb3b3fc35b741ac968e331642600"})



    -- DAP
    use({ "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" })
    use({ "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" })
    use({ "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
