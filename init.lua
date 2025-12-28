local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_err_writeln("Failed to clone lazy.nvim:\n" .. out)
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","

local opt = vim.opt
opt.ignorecase = true
opt.smartcase = true
opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.termguicolors = true 
opt.scrolloff = 8

local map = vim.keymap.set
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { silent = true })
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "<leader>q", vim.diagnostic.setloclist)

require("lazy").setup({
  spec = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "christoomey/vim-tmux-navigator", lazy = false },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function() require('lualine').setup({ options = { theme = 'catppuccin' } }) end
    },
    {
      'nvim-telescope/telescope.nvim', 
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('telescope').setup({})

        local builtin = require("telescope.builtin")
        map('n', '<leader>p', builtin.find_files, { desc = 'Telescope find files' })
        map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      end
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function() 
        require("nvim-treesitter").setup({
          ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "tsx", "python", "json", "html", "css" },
          highlight = { enable = true },
          indent = { enable = true },
        })
      end
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        cmp.setup({
          snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
          mapping = cmp.mapping.preset.insert({
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
              else fallback() end
            end, { "i", "s" }),
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
          }),
        })
      end,
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = { 
        "williamboman/mason.nvim", 
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
      },
      config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({ 
          ensure_installed = { "ruff", "pyright", "vtsls", "eslint" } 
        })
        require("mason-tool-installer").setup({
          ensure_installed = { "prettierd" }
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        vim.api.nvim_create_autocmd('LspAttach', {
          callback = function(args)
            local opts = { buffer = args.buf }
            map("n", "gd", vim.lsp.buf.definition, opts)
            map("n", "K", vim.lsp.buf.hover, opts)
            map("n", "<leader>rn", vim.lsp.buf.rename, opts)
            map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          end,
        })

        local servers = { 'ruff', 'vtsls', 'eslint' }
        for _, server in ipairs(servers) do
          vim.lsp.config(server, { capabilities = capabilities })
          vim.lsp.enable(server)
        end
        vim.lsp.config('pyright', {
          capabilities = capabilities,
          settings = { python = { analysis = { typeCheckingMode = "off" } } }
        })
        vim.lsp.enable('pyright')
      end
    },
    {
      "stevearc/conform.nvim",
      event = { "BufWritePre" },
      cmd = { "ConformInfo" },
      opts = {
        formatters_by_ft = {
          javascript = { "prettierd" },
          typescript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescriptreact = { "prettierd" },
          python = { "ruff_format" },
          lua = { "stylua" },
        },
        format_on_save = { timeout_ms = 500, lsp_fallback = true },
      },
    },
  },
  install = { colorscheme = { "catppuccin" } },
})

vim.cmd.colorscheme "catppuccin"
