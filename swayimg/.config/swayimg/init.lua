swayimg.text.font = 'JetBrainsMono Nerd Font'

-- Viewer mode
swayimg.viewer.bind_reset()
swayimg.viewer.set_window_background(0xff000000)
swayimg.viewer.set_image_background(0xffffffff)

swayimg.on_window_resize(function()
    if swayimg.mode == 'viewer' then
        swayimg.viewer.set_fix_scale('optimal')
    end
end)

swayimg.viewer.on_key('q', function()
    swayimg.exit(0)
end)

swayimg.viewer.on_key('Return', function()
    swayimg.mode = 'gallery'
end)

swayimg.viewer.on_key('n', function()
    swayimg.viewer.open('next')
end)

swayimg.viewer.on_key('p', function()
    swayimg.viewer.open('prev')
end)

swayimg.viewer.on_key('f', function()
    swayimg.fullscreen = !swayimg.fullscreen
end)

swayimg.viewer.on_key('z', function()
    swayimg.viewer.reset()
end)

-- set current image as wallapper
swayimg.viewer.on_key('w', function()
    local img = swayimg.viewer.get_image()
    os.execute('awww img "'..img.path..'"')
end)

-- delete current image
swayimg.viewer.on_key('Shift-d', function()
    local img = swayimg.viewer.get_image()
    os.execute('rm -- "'..img.path..'"')
end)

-- zoom image
swayimg.viewer.on_key('Shift-plus', function()
    local scale = swayimg.viewer.scale
    swayimg.viewer.set_abs_scale(scale + 0.1)
end)

swayimg.viewer.on_key('Shift-underscore', function()
    local scale = swayimg.viewer.scale
    swayimg.viewer.set_abs_scale(scale - 0.1)
end)

-- h/j/k/l to move image
swayimg.viewer.on_key('h', function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(math.floor(pos.x + wnd.width / 10), pos.y);
end)

swayimg.viewer.on_key('l', function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(math.floor(pos.x - wnd.width / 10), pos.y);
end)

swayimg.viewer.on_key('j', function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y - wnd.width / 10));
end)

swayimg.viewer.on_key('k', function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y + wnd.width / 10));
end)

-- rotate image
swayimg.viewer.on_key('bracketleft', function()
    swayimg.viewer.rotate(270)
end)

swayimg.viewer.on_key('bracketright', function()
    swayimg.viewer.rotate(90)
end)

-- flip image
swayimg.viewer.on_key('m', function()
    swayimg.viewer.flip_vertical()
end)

swayimg.viewer.on_key('Shift-m', function()
    swayimg.viewer.flip_horizontal()
end)


-- Gallery mode
swayimg.gallery.bind_reset()
swayimg.gallery.window_color = 0xaa000000
swayimg.gallery.aspect = 'keep'
swayimg.gallery.border_color = 0xff9b98ff

swayimg.gallery.on_key('q', function()
    swayimg.exit(0)
end)

swayimg.gallery.on_key('Return', function()
    swayimg.mode = 'viewer'
end)

swayimg.gallery.on_key('h', function()
    swayimg.gallery.select('left')
end)

swayimg.gallery.on_key('l', function()
    swayimg.gallery.select('right')
end)

swayimg.gallery.on_key('j', function()
    swayimg.gallery.select('down')
end)

swayimg.gallery.on_key('k', function()
    swayimg.gallery.select('up')
end)

-- set current image as wallapper
swayimg.gallery.on_key('w', function()
    local img = swayimg.gallery.get_image()
    os.execute('awww img "'..img.path..'"')
end)

