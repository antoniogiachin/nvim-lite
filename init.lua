local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("lazy").setup({
  -- ZENBURN
  -- {
  --   "phha/zenburn.nvim",
  --   priority = 1000,
  --   lazy = false,
  --   init = function()
  --     vim.cmd("colorscheme zenburn")
  --   end,
  -- },

  -- KANAGAWA
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    init = function()
      -- Default options:
      require('kanagawa').setup({
        compile = false,  -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        typeStyle = {},
        -- transparent = true,    -- do not set background color
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        overrides = function(colors)
          local theme = colors.theme
          return {
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          },
        },
        theme = "dragon",  -- Load "wave" theme when 'background' option is not set
        background = {     -- map the value of 'background' option to a theme
          dark = "dragon", -- try "dragon" !
          light = "lotus"
        },
      })

      -- setup must be called before loading
      vim.cmd [[colorscheme kanagawa]]
    end,
  },
  --
  -- AYU
  -- {
  --   "Shatur/neovim-ayu",
  --   priority = 1000,
  --   lazy = false,
  --   init = function()
  --     vim.cmd("colorscheme ayu")
  --   end,
  -- },

  -- GRUVBUDDY
  -- {
  --   'tjdevries/gruvbuddy.nvim',
  --   priority = 1000,
  --   lazy = false,
  --   dependencies = { 'tjdevries/colorbuddy.nvim' },
  --   init = function()
  --     require('colorbuddy').colorscheme('gruvbuddy')
  --   end,
  -- },

  -- GRUVBOX MATERIAL
  -- {
  --   'sainnhe/gruvbox-material',
  --   priority = 1000,
  --   lazy = false,
  --   init = function()
  --     vim.g.gruvbox_material_disable_italic_comment = 1
  --     vim.g.gruvbox_material_diagnostic_text_highlight = 1
  --     vim.g.gruvbox_material_diagnostic_line_highlight = 1
  --     vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
  --     vim.g.gruvbox_material_transparent_background = 1
  --     -- vim.g.gruvbox_material_background = 'hard'
  --     vim.g.gruvbox_material_foreground = 'original'
  --     -- vim.g.gruvbox_material_dim_inactive_windows = 1
  --     vim.cmd("colorscheme gruvbox-material")
  --   end,
  -- },
  --
  -- GRUBER DARKER
  -- {
  --     "blazkowolf/gruber-darker.nvim",
  --     priority = 1000,
  --     opts = {
  --         italic = {
  --             strings = false,
  --             comments = false,
  --             operators = false,
  --             folds = false,
  --         },
  --     },
  --     init = function()
  --         vim.cmd("colorscheme gruber-darker") -- vim.cmd.colorscheme('gruvbox')
  --     end,
  -- },

  -- GRUVBOX
  -- {
  --   'gruvbox-community/gruvbox',
  --   priority = 1000,
  --   init = function()
  --     vim.g.gruvbox_italic = 0
  --     vim.g.gruvbox_contrast_dark = 'hard'
  --
  --     vim.cmd("colorscheme gruvbox")
  --     vim.o.background = "dark"
  --   end,
  -- },

  -- ROSE-PINE
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   priority = 1000,
  --   -- lazy = false,
  --   init = function()
  --     require('rose-pine').setup({
  --       disable_background = true,
  --       -- disable_float_background = true,
  --       disable_italics = true, -- Force no italics
  --       groups = {
  --         panel = "Highlight Med"
  --       }
  --     })
  --     vim.cmd("colorscheme rose-pine")
  --
  --     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  --     -- vim.o.background = "dark"
  --   end,
  -- },

  -- TOKYO NIGHT
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  --     -- transparent = true, -- Enable this to disable setting the background color
  --     styles = {
  --       -- Style to be applied to different syntax groups
  --       -- Value is any valid attr-list value for `:help nvim_set_hl`
  --       comments = { italic = false },
  --       keywords = { italic = false },
  --       functions = { italic = false },
  --       variables = { italic = false },
  --       -- Background styles. Can be "dark", "transparent" or "normal"
  --       sidebars = "dark", -- style for sidebars, see below
  --       floats = "dark",   -- style for floating windows
  --     },
  --   },
  --   init = function()
  --     vim.cmd [[colorscheme tokyonight]]
  --   end
  -- },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  -- Better Escape
  -- {
  --   "max397574/better-escape.nvim",
  --   config = function()
  --     require("better_escape").setup()
  --   end,
  -- },

  -- Prettier
  {
    "MunifTanjim/prettier.nvim",
    dependencies = {
      { "jose-elias-alvarez/null-ls.nvim" },
    },
  },

  -- TELESCOPE
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    -- or                              , branch = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')

      vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>sg', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
      vim.keymap.set('n', '<leader>ssg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
      -- vim.keymap.set('n', '<leader>xq', builtin.diagnostics, {})
    end
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    "folke/trouble.nvim",
    opts = {
      icons = false,
      fold_open = "v",      -- icon used for open folds
      fold_closed = ">",    -- icon used for closed folds
      indent_lines = false, -- add an indent guide below the fold icons
      signs = {
        -- icons / text used for a diagnostic
        error = "E",
        warning = "W",
        hint = "H",
        information = "I"
      },
      use_diagnostic_signs = false
    },
  },

  {
    "tveskag/nvim-blame-line",
  },
  {
    'echasnovski/mini.surround',
    version = '*',
    config = function()
      require('mini.surround').setup()
    end,
  },
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    'echasnovski/mini.comment',
    version = false,
    config = function()
      require('mini.comment').setup()
    end,
  },

  -- TREESITTER
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = { "tsx", "javascript", "typescript", "c", "lua", "rust" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
          -- `false` will disable the whole extension
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },

  "nvim-treesitter/playground",

  -- HARPOON
  {
    "theprimeagen/harpoon",
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

      vim.keymap.set("n", "<C-t>", function() ui.nav_prev() end)
      vim.keymap.set("n", "<C-h>", function() ui.nav_next() end)
      -- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
      -- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
      -- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
      -- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
    end
  },

  "mbbill/undotree",
  -- "tpope/vim-fugitive",
  "nvim-treesitter/nvim-treesitter-context",

  -- LSP ZERO
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },

  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  "eandrju/cellular-automaton.nvim",

  -- GO
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  -- require 'custom.plugins',
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ew", "<cmd>vsp<CR>")
vim.keymap.set("n", "<leader>er", "<cmd>sp<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Prettier
vim.keymap.set("n", "<leader>P", "<cmd>Prettier<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- LAZY GIT
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

-- TODOS
vim.keymap.set("n", "<leader>T", "<cmd>TodoQuickFix<CR>", { desc = "Todos" })

-- EXIT
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>")

-- BETTER ESCAPE
-- vim.keymap.set("i", "jk", "<ESC>")
-- vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("i", "<C-c>", "<ESC>")

-- SAVE
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
-- vim.cmd [[
--     augroup tony_colorcolumn
--         autocmd!
--         autocmd BufEnter * highlight ColorColumn ctermbg=235 guibg=#363636
--     augroup END
-- ]]

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- TREESITTER CONTEXT
vim.cmd [[
    augroup tony_colorcolumn
        autocmd!
        autocmd BufEnter * highlight TreesitterContextBottom ctermbg=235 guibg=#363636
    augroup END
]]
vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })


-- GIT BLAME
vim.keymap.set("n", "<leader>gb", "<cmd>ToggleBlameLine<CR>", { desc = "ToggleBlameLine" })
-- FUGITIVE
-- local tony_fugitive = vim.api.nvim_create_augroup("tony_fugitive", {})
--
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd("BufWinEnter", {
--   group = tony_fugitive,
--   pattern = "*",
--   callback = function()
--     if vim.bo.ft ~= "fugitive" then
--       return
--     end
--
--     local bufnr = vim.api.nvim_get_current_buf()
--     local opts = { buffer = bufnr, remap = false }
--     vim.keymap.set("n", "<leader>p", function()
--       vim.cmd.Git('push')
--     end, opts)
--
--     -- rebase always
--     vim.keymap.set("n", "<leader>P", function()
--       vim.cmd.Git({ 'pull', '--rebase' })
--     end, opts)
--
--     -- NOTE: It allows me to easily set the branch i am pushing and any tracking
--     -- needed if i did not set the branch up correctly
--     vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
--   end,
--
--
-- })

-- TROUBLE
vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)
-- UNDOTREE
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)


-- Go format on save
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').gofmt()
  end,
  group = format_sync_grp,
})


-- LSP

local lsp = require("lsp-zero").preset({
  float_border = 'rounded',
  call_servers = 'local',
  configure_diagnostics = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = {
    preserve_mappings = false,
    omit = {},
  },
  manage_nvim_cmp = {
    set_sources = 'recommended',
    set_basic_mappings = true,
    set_extra_mappings = false,
    use_luasnip = true,
    set_format = true,
    documentation_window = true,
  },
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'tsserver',
  'eslint',
  'rust_analyzer'
})

require('lspconfig').tsserver.setup({
  on_init = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentFormattingRangeProvider = false
  end,
})

-- -- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

-- EsLint as a formatter
require('lspconfig').eslint.setup({
  on_init = function(client)
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentFormattingRangeProvider = true
  end,
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['eslint'] = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
    -- if you have a working setup with null-ls
    -- you can specify filetypes it can format.
    -- ['null-ls'] = {'javascript', 'typescript'},
  }
})

lsp.setup()

-- vim.diagnostic.config({
--     virtual_text = true
-- })
--

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})
