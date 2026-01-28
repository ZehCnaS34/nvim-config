local color = require'zevur.color'
local rgb, hsl = color.rgb, color.hsl

local p = color.palette {
    base00    = "#eeeeee",
    base01    = "#c6c6c6",
    base02    = "#023658",
    base03    = "#011827",
    yellow    = "#E2D511",
    orange    = "#FF5C40",
    brown     = "#B26800",
    red       = "#CC1514",
    magenta   = "#E318FF",
    violet    = "#6C71C4",
    blue      = "#3D7599",
    cyan      = "#00FFDA",
    green     = "#A6E22E",
    dark_grey = "#444444",
    lite_grey = "#eeeeee",
}

local function hi(tbl)
    local group = table.remove(tbl, 1)
    assert(group, "`hi` needs a group in position 1")
    vim.api.nvim_set_hl(0, group, tbl)
end


hi {
    "normal",
    fg = p"base00",
    bg = p"base03"

}

hi {
    "comment",
    fg = p"blue-20",
}
hi {
    "constant",
    fg = p"magenta",
}
hi {
    "identifier",
    fg = p"cyan-20"
}
hi {
    "statement",
    fg = p"blue",
}

hi {
    "preproc",
    fg = p"blue+20"
}
hi {
    "type",
    fg = p"orange+34"
}
hi {
    "delimiter",
    fg = p"base01"
}
hi {
    "error",
    fg = p"base01",
    bg = p"red+20"
}
hi {
    "todo",
    fg = p"base00+3"
}
hi {
    "cursearch",
    fg = p"base00",
    bg = p"violet"
}
hi {
    "search", 
    fg = p"base00",
    bg = p"violet-20"
}
hi {
    "cursorline", 
    bg = p"base02-6"
}
hi {
    "cursorcolumn", 
    bg = p"base02-6"
}
hi {
    "cursorlinenr", 
    -- bg = p"base02-6"
    bg = p"base03-24",
    fg = p"base00"
}
hi {
    "linenr", 
    fg = p"base00-34",
    bg = p"base03-24"
}
hi {
    "folded", 
    fg = p"cyan+24",
    bg = p"base03-30"
}
hi {
    "signcolumn", 
    bg = p"base03-24"
}
hi {
    "foldcolumn", 
    bg = p"base03-30"
}
hi {
    "StatusLine",
    bg = p"base03-30"
}
hi {
    "StatusLineNC",
    bg = p"base03-30"
}
hi {
    "TabLine",
    fg = p"base00"
}
hi {
    "TabLineFill",
    fg = p"base00"
}
hi {
    "WinSeparator",
    fg = p"blue-30"
}
hi {
    "WinBar",
    bg = p"base02-6"
}
hi {
    "Added",
    fg = p"green+20"
}
hi {
    "Changed",
    fg = p"orange+20"
}
hi {
    "Removed",
    fg = p"red+20"
}
hi {
    "MatchParen",
    fg = p"base00+3",
    bg = p"violet-20"
}
hi {
    "Visual",
    fg = p"base03",
    bg = p"green"
}

-- MiniPick
hi {
    "MiniPickNormal",
    fg = p"base00",
    bg = p"base03-3",
}
hi {
    "MiniPickBorder",
    fg = p"blue-30",
}

-- MiniFiles
hi {
    "MiniFilesBorder",
    fg = p"blue-30"
}

-- MiniStatus
hi { "MiniStatuslineModeNormal", bg = p"blue-30" }
hi { "MiniStatuslineModeVisual", bg = p"violet-30" }
hi { "MiniStatuslineModeCommand", bg = p"cyan-30" }
hi { "MiniStatuslineModeInsert", bg = p"yellow-30" }
hi { "MiniStatuslineModeOther", bg = p"orange-30" }
