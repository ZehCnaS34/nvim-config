local palette, rgb, hsl, util = {}, {}, {}, {}

local T = {
    RGB = 0b00001,
    HSL = 0b00010
}

setmetatable(palette, {
    __call = function(self, alias2color_table)
        local color_palatte_instance = {
            cache = {}
        }

        for alias, hex_code in pairs(alias2color_table) do
            color_palatte_instance.cache[alias] = rgb(hex_code)
        end

        setmetatable(color_palatte_instance, {
            __call = function (self, name, hex_color_code)
                if hex_color_code ~= nil then
                    self.cache[name] = rgb(hex_color_code)
                    return tostring(self.cache[name])
                end

                if util.is_augment(name) then
                    if self.cache[name] then
                        return tostring(self.cache[name])
                    end
                    local augment = util.parse_augment(name)
                    local color = self.cache[augment.alias]
                    assert(color, "color basis does not exist in cache")
                    if augment.strategy == "+" then
                        self.cache[name] = color:lighten(augment.adjust_percentage)
                    else
                        self.cache[name] = color:darken(augment.adjust_percentage)
                    end
                    return tostring(self.cache[name])
                end

                assert(self.cache[name], string.format("color %s not found", name))
                return tostring(self.cache[name])
            end
        })

        return color_palatte_instance
    end
})

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
    setmetatable(tbl, rgb.mt)
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

function rgb.to_hsl(form)
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

    return hsl.new{
        hue = h,
        saturation = s,
        lightness = l,
    }
end

function rgb.darken(tbl, percent)
    local hsl = tbl:to_hsl()
    local amount = hsl.lightness * (percent / 100)
    -- local amount = 255 * (percent / 100)
    hsl.lightness = util.clamp(hsl.lightness-amount)
    return hsl:to_rgb()
end

function rgb.lighten(tbl, percent)
    local hsl = tbl:to_hsl()
    local amount = hsl.lightness * (percent / 100)
    -- local amount = 255 * (percent / 100)
    hsl.lightness = util.clamp(hsl.lightness+amount)
    return hsl:to_rgb()
end

rgb.mt = {
    __tostring = rgb.tostring,
    __index = {
        to_hsl = rgb.to_hsl,
        darken = rgb.darken,
        lighten = rgb.lighten
    }
}

function hsl.new(tbl)
    tbl.kind = T.HSL
    setmetatable(tbl, hsl.mt)
    return tbl
end

function hsl.tostring(obj)
    return string.format("hsl(%s, %s, %s)", obj.hue, obj.saturation, obj.lightness)
end

function hsl.to_rgb(form)
    local h, s, l = form.hue, form.saturation, form.lightness
    local r, g, b

    if s == 0 then
        -- Achromatic (gray)
        r, g, b = l, l, l
    else
        local q = l < 0.5 and l * (1 + s) or l + s - l * s
        local p = 2 * l - q

        r = util.hue_to_rgb(p, q, h + 1/3)
        g = util.hue_to_rgb(p, q, h)
        b = util.hue_to_rgb(p, q, h - 1/3)
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
        to_rgb = hsl.to_rgb
    },
}

function util.is_augment(color_name)
    return color_name:find("+") or color_name:find("-")
end

function util.parse_augment(color_name)
    local index = util.is_augment(color_name)
    return {
        strategy          = color_name:sub(index, index),
        alias             = color_name:sub(1, index-1),
        adjust_percentage = tonumber(color_name:sub(index+1), 10)
    }
end

function util.clamp(v)
    return math.max(math.min(1, v), 0)
end

function util.hue_to_rgb(p, q, t)
  if t < 0 then t = t + 1 end
  if t > 1 then t = t - 1 end
  if t < 1/6 then return p + (q - p) * 6 * t end
  if t < 1/2 then return q end
  if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
  return p
end


local p = palette {
    base0 = "#333333"
}

vim.print(p"base0")
vim.print(p"base0+3")
vim.print(p"base0+44")

return {
    hsl = hsl,
    rgb = rgb,
    palette = palette
}
