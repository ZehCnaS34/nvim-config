local H = {}

function H.make_clamp(min, max)
    return function (v)
        return math.max(math.min(max, v), min)
    end
end

H.clamp = H.make_clamp(0, 1)

function H.hue_to_rgb(p, q, t)
  if t < 0 then t = t + 1 end
  if t > 1 then t = t - 1 end
  if t < 1/6 then return p + (q - p) * 6 * t end
  if t < 1/2 then return q end
  if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
  return p
end

local colors = {}

local rgb = {}
colors.rgb = rgb 


local T = {
    RGB = 0b00001,
    HSL = 0b00010
}

setmetatable(rgb, {
    __call = function (_, form)
        if type(form) == "string" then
            return rgb.parse(form)
        elseif type(form) == "table" and form.kind == T.RGB then
            return form
        elseif type(form) == "table" and form.kind == T.HSL then
            error("todo")
        else
            error(string.format("could not compute thing"))
        end
    end
})

function rgb.new(tbl)
    tbl.kind = T.RGB
    setmetatable(tbl, colors.rgb.mt)
    return tbl
end

function rgb.parse(str)
    assert(type(str) == "string", "rgb be a string")
    assert(#str == 7, "rgb should be in #XXXXXX format")
    assert(str:sub(1, 1) == "#", "rgb should lead with #")

    return rgb.new{
        red   = tonumber(str:sub(2, 3), 16) / 255,
        green = tonumber(str:sub(4, 5), 16) / 255,
        blue  = tonumber(str:sub(6, 7), 16) / 255
    }
end

function rgb.tostring(obj)
    red = string.format("%02x", math.floor(obj.red * 255))
    green = string.format("%02x", math.floor(obj.green * 255))
    blue = string.format("%02x", math.floor(obj.blue * 255))
    return "#" .. red .. green .. blue
end

function rgb.hsl(form)
    local r, g, b = form.red, form.green, form.blue

    local max = math.max(r, g, b)
    local min = math.min(r, g, b)
    local delta = max - min

    -- Lightness is the average of the largest and smallest color components
    local l = (max + min) / 2
    local h, s = 0, 0

    if delta ~= 0 then
        -- Saturation calculation
        if l < 0.5 then
            s = delta / (max + min)
        else
            s = delta / (2 - max - min)
        end

        -- Hue calculation based on which component is dominant
        if max == r then
            h = (g - b) / delta + (g < b and 6 or 0)
        elseif max == g then
            h = (b - r) / delta + 2
        elseif max == b then
            h = (r - g) / delta + 4
        end

        h = h / 6
    end

    return colors.hsl.new{
        hue = h,
        saturation = s,
        lightness = l,
    }
end

function rgb.darken(tbl, percent)
    local hsl = tbl:hsl()
    local amount = hsl.lightness * (percent / 100)
    hsl.lightness = H.clamp(hsl.lightness-amount)
    return hsl:rgb()
end

function rgb.lighten(tbl, percent)
    local hsl = tbl:hsl()
    local amount = hsl.lightness * (percent / 100)
    hsl.lightness = H.clamp(hsl.lightness+amount)
    return hsl:rgb()
end

rgb.mt = {
    __tostring = rgb.tostring,
    __index = {
        hsl = rgb.hsl,
        darken = rgb.darken,
        lighten = rgb.lighten
    }
}


local hsl = {}

function hsl.new(tbl)
    tbl.kind = T.HSL
    setmetatable(tbl, colors.hsl.mt)
    return tbl
end

function hsl.tostring(obj)
    return string.format("hsl(%s, %s, %s)", obj.hue, obj.saturation, obj.lightness)
end

function hsl.rgb(form)
    local h, s, l = form.hue, form.saturation, form.lightness
    local r, g, b

    if s == 0 then
        -- Achromatic (gray)
        r, g, b = l, l, l
    else
        local q = l < 0.5 and l * (1 + s) or l + s - l * s
        local p = 2 * l - q

        r = H.hue_to_rgb(p, q, h + 1/3)
        g = H.hue_to_rgb(p, q, h)
        b = H.hue_to_rgb(p, q, h - 1/3)
    end

    return rgb.new{
        red = r,
        green = g,
        blue = b
    }
end

hsl.mt = {
    __tostring = hsl.tostring,
    __index = {
        rgb = hsl.rgb
    },
}

colors.hsl = hsl


return colors
