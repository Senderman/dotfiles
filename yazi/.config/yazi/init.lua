-- Init for yazi-git plugin
require("git"):setup()

-- Add uid:gid and mtime to status line
Status:children_add(function()
    local h = cx.active.current.hovered
    if not h or ya.target_family() ~= "unix" then
        return ""
    end

    local time = math.floor(h.cha.mtime or 0)
    if time == 0 then
        time = ""
    else
        time = os.date("%d.%m.%Y", time)
	end

    return ui.Line {
        ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
        ":",
        ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
        " ",
        ui.Span(time):fg("yellow"),
        " ",
    }
end, 500, Status.RIGHT)

