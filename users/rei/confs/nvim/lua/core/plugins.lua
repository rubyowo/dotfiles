local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'git@github.com:folke/lazy.nvim.git',
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

local opts = {
    ui = {
        border = 'rounded',
    },
    git = {
        url_format = 'git@github.com:%s.git',
    },
    dev = {
        path = '~/projects',
    },
    defaults = {
        lazy = true,
    },
    install = {
        colorscheme = { 'catppuccin' },
        missing = true,
    },
    performance = {
        disabled_plugins = {
            '2html_plugin',
            'bugreport',
            'compiler',
            'ftplugin',
            'fzf',
            'getscript',
            'getscriptPlugin',
            'gzip',
            'logipat',
            'matchit',
            'matchparen',
            'netrw',
            'netrwFileHandlers',
            'netrwPlugin',
            'netrwSettings',
            'optwin',
            'rplugin',
            'rrhelper',
            'spellfile_plugin',
            'synmenu',
            'syntax',
            'tar',
            'tarPlugin',
            'tohtml',
            'tutor',
            'vimball',
            'vimballPlugin',
            'zip',
            'zipPlugin',
        },
    },
    -- Nix Moment
    lockfile = '~/nixos/users/rei/confs/nvim/lazy-lock.json',
}

local plugins = {
    -- Stuff other plugins depend on
    { 'MunifTanjim/nui.nvim',  lazy = true },
    { 'nvim-lua/plenary.nvim', lazy = true },

    -- Theme
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        build = ':CatppuccinCompile',
        lazy = false,
        priority = 1000,
    },

    -- LSP
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    -- CMP
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
        },
        opts = require('diag.cmp'),
    },
    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = require('treesitter'),
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'windwp/nvim-ts-autotag',
            { 'windwp/nvim-autopairs', config = true },
            'p00f/nvim-ts-rainbow',
        },
    },
    -- Language Specific
    { 'simrat39/rust-tools.nvim',      ft = 'rust' },
    {
        'saecki/crates.nvim',
        event = 'BufRead Cargo.toml',
        opts = {
            null_ls = {
                enabled = true,
                name = 'crates.nvim',
            },
        },
    },
    -- Snippets
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'rafamadriz/friendly-snippets',
            config = function()
                require('luasnip.loaders.from_vscode').lazy_load()
            end,
        },
        opts = {
            history = true,
            delete_check_events = 'TextChanged',
        },
    },
    -- UI Stuff
    { 'nvim-telescope/telescope.nvim', cmd = 'Telescope', opts = require('stuff.ui.telescope') },
    {
        'stevearc/dressing.nvim',
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require('lazy').load({ plugins = { 'dressing.nvim' } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require('lazy').load({ plugins = { 'dressing.nvim' } })
                return vim.ui.input(...)
            end
        end,
        config = true,
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        lazy = false,
        opts = require('stuff.ui.tree'),
    },
    'noib3/nvim-cokeline',
    {
        'rcarriga/nvim-notify',
        opts = {
            render = 'compact',
            stages = 'slide',
        },
        init = function()
            vim.notify = function(...)
                require('lazy').load({ plugins = { 'nvim-notify' } })
                return require('notify')(...)
            end
        end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            char = '│',
            filetype_exclude = { 'help', 'neo-tree', 'lazy' },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },
    -- Statusline
    { 'nvim-lualine/lualine.nvim', event = 'VeryLazy' },
    -- Git
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = require('stuff.text.gitsigns'),
    },
    -- Sessions
    {
        'folke/persistence.nvim',
        event = 'BufReadPre',
        opts = { options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help' } },
        keys = {
            {
                '<leader>ss',
                function()
                    require('persistence').load()
                end,
                desc = 'Restore Session',
            },
            {
                '<leader>sl',
                function()
                    require('persistence').load({ last = true })
                end,
                desc = 'Restore Last Session',
            },
            {
                '<leader>sd',
                function()
                    require('persistence').stop()
                end,
                desc = "Don't Save Current Session",
            },
        },
    },
    -- Util
    {
        'folke/todo-comments.nvim',
        cmd = 'TodoTelescope',
        event = { 'BufReadPost', 'BufNewFile' },
        config = true,
        -- stylua: ignore
        keys = {
            { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
            { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
            { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
        },
    },
    { 'numToStr/Comment.nvim',     event = { 'BufReadPost', 'BufNewFile' }, opts = require('stuff.text.comment') },
    {
        'ggandor/leap.nvim',
        keys = {
            { 's',  mode = { 'n', 'x', 'o' }, desc = 'Leap forward to' },
            { 'S',  mode = { 'n', 'x', 'o' }, desc = 'Leap backward to' },
            { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from windows' },
        },
        config = function(_, _)
            local leap = require('leap')
            leap.add_default_mappings(true)
        end,
    },
    {
        'beauwilliams/focus.nvim',
        config = true,
        cmd = { 'FocusSplitLeft', 'FocusSplitRight', 'FocusSplitUp', 'FocusSplitDown' },
    },
    {
        'windwp/nvim-spectre',
        -- stylua: ignore
        keys = {
            { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
        },
    },
    { 'numToStr/FTerm.nvim',    opts = require('stuff.ui.terminal') },
    { 'famiu/bufdelete.nvim',   cmd = 'Bdelete' },
    { 'sindrets/winshift.nvim', cmd = 'WinShift' },
    { 'gbprod/cutlass.nvim',    opts = require('stuff.text.cutlass'), event = { 'BufReadPost', 'BufNewFile' } },
    { 'kylechui/nvim-surround', opts = {} },
    {
        'nullishamy/autosave.nvim',
        branch = 'dev',
        opts = {},
        event = { 'InsertLeave', 'TextChanged' },
    },
    {
        'karb94/neoscroll.nvim',
        config = function(_, _)
            require('neoscroll').setup({ mapping = {} })
            local t = {}
            t['K'] = { 'scroll', { '-10', 'true', '150' } }
            t['J'] = { 'scroll', { '10', 'true', '150' } }
            require('neoscroll.config').set_mappings(t)
        end,
        event = { 'BufReadPost', 'BufNewFile' },
    },
    -- Misc
    { 'andweeb/presence.nvim', opts = {
        main_image = 'file',
    }, event = { 'BufReadPost', 'BufNewFile' } },
    { 'kyazdani42/nvim-web-devicons', opts = {
        default = true,
    } },
}

require('lazy').setup(plugins, opts)
