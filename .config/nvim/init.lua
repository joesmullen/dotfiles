-----------------------------------------------------------------------
-- Copyright © 2023 Joe Smullen
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.
-----------------------------------------------------------------------

-- options
local opt = vim.opt

opt.number = true
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.ignorecase = true
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.wrap = false
opt.cursorline = true
opt.completeopt = "menu,menuone,noselect"

-- plugins
require("packer").startup(function (use)
    use("wbthomason/packer.nvim")

    use("preservim/nerdtree")
    use("windwp/nvim-autopairs")
    use("tpope/vim-commentary")
    use("tpope/vim-endwise")

    use("morhetz/gruvbox")
    use("itchyny/lightline.vim")
    use("lukas-reineke/indent-blankline.nvim")

    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
end)

-- keybindings
vim.api.nvim_set_keymap("n", "<C-n>", ":NERDTreeToggle<CR>", {})

-- plugin setup
vim.cmd("colorscheme gruvbox")
require("nvim-autopairs").setup()
require("mason").setup()
require("mason-lspconfig").setup()

-- lsp setup
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "jdtls", "pyright", "tsserver", "lua_ls" }

for _, server in ipairs(servers) do
    lspconfig[server].setup({
        capabilities = capabilities
    })
end

-- autocompletion setup
local cmp = require("cmp")
cmp.setup({
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" }
    }),

    mapping = cmp.mapping.preset.insert({
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort()
    })
})
