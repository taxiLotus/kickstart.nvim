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
}
