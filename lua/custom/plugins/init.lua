-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'uhs-robert/sshfs.nvim',
    opts = {
      -- Refer to the configuration section below
      -- or leave empty for defaults
      hooks = {
        on_exit = {
          auto_unmount = false,
          clean_mount_folders = false,
        },
        on_mount = {
          auto_change_to_dir = true,
        },
      },
    },
  },

  {
    'RRethy/vim-illuminate',
  },

  {
    'Bekaboo/dropbar.nvim',
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    config = function()
      local dropbar_api = require 'dropbar.api'
      vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
      vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
      vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-mini/mini.icons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'everforest',
          section_separators = '',
          component_separators = '|',
        },
      }
    end,
  },

  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'File Explorer',
              highlight = 'Directory',
              separator = true, -- use a "true" to enable the default, or set your own character
            },
          },

          right_mouse_command = 'vertical sbuffer %d',
          middle_mouse_command = 'bdelete! %d',
        },
        -- keymaps
        vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', { silent = true }),
        vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', { silent = true }),
        vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', { silent = true }),
        vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', { silent = true }),
        vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', { silent = true }),
        vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', { silent = true }),
        vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', { silent = true }),
        vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', { silent = true }),
        vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', { silent = true }),
        vim.keymap.set('n', '<leader>$', '<cmd>BufferLineGoToBuffer -1<CR>', { silent = true }),
      }
    end,
  },

  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,

    config = function() require('oil').setup() end,
  },

  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
  },

  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
  },

  {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
    -- multiplexer_integration = 'wezterm',
    config = function()
      -- resize panes
      vim.keymap.set('n', '<C-A-h>', require('smart-splits').resize_left)
      vim.keymap.set('n', '<C-A-j>', require('smart-splits').resize_down)
      vim.keymap.set('n', '<C-A-k>', require('smart-splits').resize_up)
      vim.keymap.set('n', '<C-A-l>', require('smart-splits').resize_right)
      -- moving between panes
      vim.keymap.set('n', '<A-h>', require('smart-splits').move_cursor_left)
      vim.keymap.set('n', '<A-j>', require('smart-splits').move_cursor_down)
      vim.keymap.set('n', '<A-k>', require('smart-splits').move_cursor_up)
      vim.keymap.set('n', '<A-l>', require('smart-splits').move_cursor_right)
      vim.keymap.set('n', "<A-'>", require('smart-splits').move_cursor_previous)
      -- swapping buffers between windows
      -- vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
      -- vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
      -- vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
      -- vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
    end,
  },
}
