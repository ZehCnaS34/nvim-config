local color = require'zevur.color'
local rgb, hsl = color.rgb, color.hsl

local base00   = rgb("#eeeeee")
local base00d  = base00:darken(3)
local base00dd = base00d:darken(6)
local base00l = base00:lighten(3)
local base01   = rgb("#c6c6c6")
local base01d  = base01:darken(3)
local base01dd = base01d:darken(6)
local base02   = rgb("#023658")
local base02d  = base02:darken(3)
local base02dd = base02d:darken(6)
local base03   = rgb("#011827")
local base03d  = base03:darken(3)
local base03dd = base03d:darken(6)
local base03l = base00:lighten(3)

local yellow    = rgb("#E2D511")
local yellowl10 = yellow:lighten(20)
local yellowd10 = yellow:darken(20)

local orange    = rgb("#FF5C40")
local orangel10 = orange:lighten(20)
local oranged10 = orange:darken(20)

local brown = rgb("#B26800")
local brownl10 = brown:lighten(20)
local brownd10 = brown:darken(20)

local red = rgb("#CC1514")
local redl10 = red:lighten(20)
local redd10 = red:darken(20)

local magenta = rgb("#E318FF")
local magental10 = magenta:lighten(20)
local magentad10 = magenta:darken(20)

local violet = rgb("#6C71C4")
local violetl10 = violet:lighten(20)
local violetd10 = violet:darken(20)

local blue = rgb("#3D7599")
local bluel10 = blue:lighten(20)
local blued10 = blue:darken(20)

local cyan = rgb("#00FFDA")
local cyanl10 = cyan:lighten(20)
local cyand10 = cyan:darken(20)

local green = rgb("#A6E22E")
local greenl10 = green:lighten(20)
local greend10 = green:darken(20)

local dark_grey = rgb("#444444")
local lite_grey = rgb("#eeeeee")

local function fb(fc, bc)
    assert(fc, "fc should be defined")
    local spec = {fg = tostring(fc)}
    if bc ~= nil then
        spec.bg = tostring(bc)
    end
    return spec
end

local function bf(bc, fc)
    assert(bc, "bc should be defined")
    local spec = {bg = tostring(bc)}
    if fc ~= nil then
        spec.fg = tostring(fc)
    end
    return spec
end

local set_hl = vim.api.nvim_set_hl
set_hl(0, "comment", fb(blued10))

set_hl(0, "normal", fb(base00, base03))
set_hl(0, "constant", fb(magenta))
-- set_hl(0, "number", fb(magenta))
-- set_hl(0, "string", fb(magenta))

set_hl(0, "identifier", fb(cyand10))

set_hl(0, "statement", fb(blue))

set_hl(0, "preproc", fb(bluel10))


set_hl(0, "type", fb(orangel10))

set_hl(0, "delimiter", {fg = tostring(base01)})

set_hl(0, "error", fb(base01, redl10))

-- TODO: something
set_hl(0, "todo", fb(base00l))

set_hl(0, "cursearch", fb(base00, violet))
set_hl(0, "search", fb(base00, violetd10))

set_hl(0, "cursorline", bf(base02dd))
set_hl(0, "cursorcolumn", bf(base02dd))
set_hl(0, "cursorlinenr", bf(base02dd))
set_hl(0, "linenr", bf(base03dd))

set_hl(0, "search", fb(base00, violetd10))

set_hl(0, "StatusLine", fb(base00))
set_hl(0, "StatusLineNC", fb(base00))
set_hl(0, "TabLine", fb(base00))
set_hl(0, "TabLineFill", fb(base00))


set_hl(0, "Added", fb(greenl10))
set_hl(0, "Changed", fb(orangel10))
set_hl(0, "Removed", fb(redl10))


set_hl(0, "matchparen", fb(base00l, violetd10))
