-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Using Dracula theme:
  use {
	  'maxmx03/dracula.nvim',
	  rtp = 'packages/neovim',
	  config = function()
		  vim.cmd("colorscheme dracula") -- Or any Aura theme available
	  end
  }

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }



  --- harpoon
  use {
	  "ThePrimeagen/harpoon",
	  branch = "harpoon2",
	  requires = { {"nvim-lua/plenary.nvim"} }
  }



  --- treesitter
  use( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})


  --- undotree
  use 'mbbill/undotree'


  --- LSP

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  -- {'williamboman/mason.nvim'},
		  -- {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  --- Mason
  use {
      {
          "williamboman/mason.nvim",
          opts = {
              ensure_installed = {
                  "clangd",
                  "pylsp",
                  "lua_lsp",
                  "codelldb",
              }
          }
      },
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }
  --- cmp
  use{
	  "hrsh7th/nvim-cmp"
  }

  --- vim tmux navigator
  use {'christoomey/vim-tmux-navigator'}

  --- debugger
  use 
  {
      'mfussenegger/nvim-dap',
      config = function(_, _)

      end
  }
  use 'theHamsta/nvim-dap-virtual-text'
  use
  {
      "williamboman/mason.nvim",
  }
  use 
  {
      "jay-babu/mason-nvim-dap.nvim",
      opts = {
          handlers = {},
          ensure_installed = {
              "codelldb",
          }
      }
  }
  use { "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    }

end) 

