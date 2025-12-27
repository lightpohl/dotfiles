-- 1. Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_err_writeln("Failed to clone lazy.nvim:\n" .. out)
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 2. General Settings
vim.g.mapleader = ","

local opt = vim.opt
opt.ignorecase = true
opt.smartcase = true
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.termguicolors = true 
opt.scrolloff = 8

-- 3. Keymaps
local map = vim.keymap.set
map("n", "<leader>p", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { silent = true })

-- 4. Plugins
require("lazy").setup({
  spec = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
      'nvim-telescope/telescope.nvim', 
      -- Remove the 'tag' or 'branch' lines to get the latest fixes
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('telescope').setup({})
      end
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function() 
        -- THE NEW WAY: Direct setup on the main module
        require("nvim-treesitter").setup({
          ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "python" },
          highlight = { enable = true },
          indent = { enable = true },
        })
      end
    },
  },
  install = { colorscheme = { "catppuccin" } },
})

-- 5. Apply Colorscheme
vim.cmd.colorscheme "catppuccin"
