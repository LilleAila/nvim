if vim.g.neovide then

local opt = vim.opt
local g = vim.g

opt.guifont = "JetBrainsMono Nerd Font:h12"
opt.linespace = 0

g.neovide_padding_top = 0
g.neovide_padding_bottom = 0
g.neovide_padding_right = 0
g.neovide_padding_left = 0

-- -- Helper function for transparency formatting
-- local alpha = function()
--   return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
-- end
-- -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
-- vim.g.neovide_transparency = 0.0
-- vim.g.transparency = 0.8
-- vim.g.neovide_background_color = "#0f1117" .. alpha()

g.neovide_transparency = 0.9
g.neovide_cursor_animation_length = 0.05 -- 0 to disable
g.neovide_cursor_trail_size = 0.8
g.neovide_cursor_antialiasing = true
g.neovide_cursor_animate_in_insert_mode = true
g.neovide_cursor_animate_command_line = true
g.neovide_cursor_unfocused_outline_width = 0.125
g.neovide_scroll_animation_length = 0.3
g.neovide_scroll_animation_far_lines = 1
g.neovide_hide_mouse_when_typing = true
g.neovide_cursor_vfx_mode = "railgun"
g.neovide_floating_shadow = false

g.neovide_theme = "auto"
g.neovide_refresh_rate_idle = 5 -- not on wayland
g.neovide_confirm_quit = true
g.neovide_fullscreen = false
g.neovide_remember_window_size = true

g.neovide_input_macos_alt_is_meta = false -- opt+key for symbols won't work
g.neovide_input_ime = true

end
