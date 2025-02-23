-- Bootstrap Lazy.nvim (if not already installed)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install Plugins
require("lazy").setup({
  -- 🌈 Syntax Highlighting & Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = "all",
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true }
    })
  end },

  -- 🎨 Color Theme
  { "folke/tokyonight.nvim", config = function()
    vim.cmd("colorscheme tokyonight-night")
  end },

  -- 🧠 Autocompletion (nvim-cmp)
  { "hrsh7th/nvim-cmp", config = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true })
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" }
      })
    })
  end },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "L3MON4D3/LuaSnip",

  -- 📁 File Explorer (like VSCode)
  { "nvim-tree/nvim-tree.lua", config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        highlight_opened_files = "all"
      }
    })
  end },

  -- 🔎 Telescope Setup (Search)
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.find_files, { noremap = true, silent = true })
    vim.keymap.set("n", "<C-f>", builtin.live_grep, { noremap = true, silent = true })
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" }
      }
    })
    require("telescope").load_extension("fzf")
  end },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- ⚡ LSP (Language Server Protocol)
  { "neovim/nvim-lspconfig", config = function()
    local lspconfig = require("lspconfig")
    lspconfig.ts_ls.setup{}
    lspconfig.pyright.setup{}
    lspconfig.clangd.setup{}
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
  end },
  "williamboman/mason.nvim",

  -- 🛠 Git Integration
  { "lewis6991/gitsigns.nvim", config = function()
    require("gitsigns").setup()
    vim.keymap.set("n", "<leader>gs", ":Gitsigns status<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { noremap = true, silent = true })
  end },

  -- 📊 Status Line (lualine)
  { "nvim-lualine/lualine.nvim", config = function()
    require("lualine").setup({ options = { theme = "auto" } })
  end },

  -- ✨ UI Enhancements
  { "psliwka/vim-smoothie" },
  { "ggandor/leap.nvim", config = function()
    require("leap").add_default_mappings()
  end },

  -- 💬 Commenting
  { "numToStr/Comment.nvim", config = function()
    require("Comment").setup()
    vim.keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { noremap = true, silent = true })
  end },

  -- 🖥️ Terminal Toggle
  { "akinsho/toggleterm.nvim", config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-t>]], -- Press Ctrl + T to toggle
      direction = "float"
    })
  end },

  -- 🤖 GitHub Copilot
  { "github/copilot.vim", config = function()
    vim.g.copilot_enabled = false
    vim.api.nvim_set_keymap("n", "<leader>co", ":Copilot enable<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>cx", ":Copilot disable<CR>", { noremap = true, silent = true })
  end }
})

