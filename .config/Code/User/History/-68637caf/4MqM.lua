-- Install lazy.nvim automatically
local M = {}

M.echo = function(str)
    vim.cmd "redraw"
    vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

M.echo "  Installing lazy.nvim & plugins ..."
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local opts = {
    ui = {
        custom_keys = { false },
    },
    install = {
        colorscheme = { 'everforest' },
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
    },
    defaults = {
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "tohtml",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "matchit",
                "tar",
                "tarPlugin",
                "rrhelper",
                "spellfile_plugin",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
                "tutor",
                "rplugin",
                "syntax",
                "synmenu",
                "optwin",
                "compiler",
                "bugreport",
                "ftplugin",
            },
        },
    },
    checker = {
        enabled = true,
    },
    debug = false,
}

-- -- Load the plugins and options
require('lazy').setup('plugins', opts)

-- vim.api.nvim_buf_delete(0, { force = true }) -- close previously opened lazy window

-- vim.schedule(function()
--     vim.cmd "MasonInstallAll"

--     -- Keep track of which mason pkgs get installed
--     local packages = table.concat(vim.g.mason_binaries_list, " ")

--     require("mason-registry"):on("package:install:success", function(pkg)
--         packages = string.gsub(packages, pkg.name:gsub("%-", "%%-"), "") -- rm package name

--         -- run above screen func after all pkgs are installed.
--         if packages:match "%S" == nil then
--             vim.schedule(function()
--                 vim.api.nvim_buf_delete(0, { force = true })
--                 vim.cmd "echo '' | redraw" -- clear cmdline
--                 -- screen()
--             end)
--         end
--     end)
-- end)
