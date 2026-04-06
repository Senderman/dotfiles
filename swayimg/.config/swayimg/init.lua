swayimg.text.set_font('JetBrainsMono Nerd Font')

-- Viewer mode
swayimg.viewer.bind_reset()
swayimg.viewer.set_window_background(0xff000000)
swayimg.viewer.set_image_background(0xffffffff)

swayimg.on_window_resize(function()
    swayimg.viewer.set_fix_scale('optimal')
end)

swayimg.viewer.on_key('q', function()
    swayimg.exit(0)
end)

swayimg.viewer.on_key('Return', function()
    swayimg.set_mode('gallery')
end)

swayimg.viewer.on_key('n', function()
    swayimg.viewer.switch_image('next')
end)

swayimg.viewer.on_key('p', function()
    swayimg.viewer.switch_image('prev')
end)

swayimg.viewer.on_key('f', function()
    swayimg.toggle_fullscreen()
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
swayimg.viewer.on_key('KP_Add', function()
    local scale = swayimg.viewer.get_scale()
    swayimg.viewer.set_abs_scale(scale + 0.1)
end)

swayimg.viewer.on_key('KP_Subtract', function()
    local scale = swayimg.viewer.get_scale()
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
swayimg.gallery.set_window_color(0)
swayimg.gallery.set_aspect('keep')
swayimg.gallery.set_border_color(0xff9b98ff)

swayimg.gallery.on_key('q', function()
    swayimg.exit(0)
end)

swayimg.gallery.on_key('Return', function()
    swayimg.set_mode('viewer')
end)

swayimg.gallery.on_key('h', function()
    swayimg.gallery.switch_image('left')
end)

swayimg.gallery.on_key('l', function()
    swayimg.gallery.switch_image('right')
end)

swayimg.gallery.on_key('j', function()
    swayimg.gallery.switch_image('down')
end)

swayimg.gallery.on_key('k', function()
    swayimg.gallery.switch_image('up')
end)

-- set current image as wallapper
swayimg.gallery.on_key('w', function()
    local img = swayimg.gallery.get_image()
    os.execute('awww img "'..img.path..'"')
end)

