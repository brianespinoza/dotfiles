local w = require('wezterm')

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
    -- this is set by the plugin, and unset on ExitPre in Neovim
    return pane:get_user_vars().IS_NVIM == 'true'
end

-- quick select : ctrl shift space

local direction_keys = {
    h = 'Left',
    j = 'Down',
    k = 'Up',
    l = 'Right',
}

local function split_nav(resize_or_move, key)
    return {
        key = key,
        mods = resize_or_move == 'resize' and 'META' or 'CTRL',
        action = w.action_callback(function(win, pane)
            if is_vim(pane) then
                -- pass the keys through to vim/nvim
                win:perform_action({
                    SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
                }, pane)
            else
                if resize_or_move == 'resize' then
                    win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
                else
                    win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
                end
            end
        end),
    }
end


function tab_title(tab_info)
    local title = tab_info.tab_title
    if title and #title > 0 then
        return title
    end

    local cwd_path = tab_info.active_pane.current_working_dir.path
    local last = ""
    for segment in string.gmatch(cwd_path, "[^/]+") do
        last = segment
    end

    return last
end

w.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
        local title = tab_title(tab)
        return {
            { Text = title },
        }
    end
)

local defaultfont = w.font 'Fira Code'
local default_cwd = os.getenv("HOME") .. "/code"

local config = {
    leader = { key = 'e', mods = 'CTRL', timeout_milliseconds = 1000 },
    default_cwd = default_cwd,
    font = defaultfont,
    color_scheme = 'Kanagawa (Gogh)',
    keys = {
        -- move between split panes
        split_nav('move', 'h'),
        split_nav('move', 'j'),
        split_nav('move', 'k'),
        split_nav('move', 'l'),
        -- resize panes
        split_nav('resize', 'h'),
        split_nav('resize', 'j'),
        split_nav('resize', 'k'),
        split_nav('resize', 'l'),
        --- open right terminal
        {
            key = 'l',
            mods = 'LEADER|CTRL',
            action = w.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
        },
        --- open bottom terminal
        {
            key = 'b',
            mods = 'LEADER|CTRL',
            action = w.action.SplitVertical { domain = 'CurrentPaneDomain' }
        },
        --- open workspace launcher
        {
            key = ' ',
            mods = 'LEADER|CTRL',
            action = w.action.ShowLauncherArgs { flags = 'WORKSPACES' },
        },
        --- send current pane to new tab
        {
            key = ']',
            mods = 'LEADER|CTRL',
            action = w.action_callback(function(win, pane)
                pane:move_to_new_tab()
            end),
        },
        --- squick select release tag
        {
            key = 't',
            mods = 'LEADER|CTRL',
            action = w.action.QuickSelectArgs {
                patterns = {
                    'release-[0-9].[0-9]{1,4}.[0-9]{1,4}'
                },
            },
        },
    },
}

-- Use the defaults as a base
config.hyperlink_rules = w.default_hyperlink_rules()


-- make username/project paths clickable. this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
table.insert(config.hyperlink_rules, {
    regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
    format = 'https://git2.rhombus.corp/$1/$3',
})

return config
