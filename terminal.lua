local buffer = {} -- Text buffer
local cursor_x = 1
local cursor_y = 1
-- Create a titlebar for the client.
-- By default, awful.rules will create one, but all it does is to call this
-- function.
local top_titlebar = awful.titlebar(c, {
    height    = 20,
    bg_normal = '#ff0000',
})
-- buttons for the titlebar
local buttons = gears.table.join(
    awful.button({ }, 1, function()
        client.focus = c
        c:raise()
        awful.mouse.client.move(c)
    end),
    awful.button({ }, 3, function()
        client.focus = c
        c:raise()
        awful.mouse.client.resize(c)
    end)
)
top_titlebar : setup {
    { -- Left
        awful.titlebar.widget.iconwidget(c),
        buttons = buttons,
        layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
        { -- Title
            align  = 'center',
            widget = awful.titlebar.widget.titlewidget(c)
        },
        buttons = buttons,
        layout  = wibox.layout.flex.horizontal
    },
    { -- Right
        awful.titlebar.widget.floatingbutton (c),
        awful.titlebar.widget.maximizedbutton(c),
        awful.titlebar.widget.stickybutton   (c),
        awful.titlebar.widget.ontopbutton    (c),
        awful.titlebar.widget.closebutton    (c),
        layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
}

function init_terminal()
    -- Initialize buffer with empty characters
    for y = 1, 25 do
        buffer[y] = {}
        for x = 1, 80 do
            buffer[y][x] = " "
        end
    end
end

function write_char(char)
    buffer[cursor_y][cursor_x] = char
    cursor_x = cursor_x + 1
end

function render_terminal()
    for y = 1, #buffer do
        for x = 1, #buffer[y] do
            print(buffer[y][x], flush=true) -- Print character with immediate output
        end
        print()  -- Newline
    end
end

init_terminal()
while true do
    local input = io.read()
    if input then
        write_char(input)
        render_terminal()
    end
end
