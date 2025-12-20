---thanks nxkoo for allowing me to use this mod

G.flynn_dies = {
    path = SMODS.current_mod.path,
    show_flynn = false,
    flynn_timer = 0,
    flynn_png = nil
}

SMODS.Sound {
    key = "flynnset_jumpscare",
    path = "flynnset_jumpscare.ogg"
}

local updatehook = Game.update
local flynn_check_timer = 0

function Game:update(dt)
    updatehook(self, dt)

    flynn_check_timer = (flynn_check_timer or 0) + dt
    if flynn_check_timer >= 1 then
        flynn_check_timer = flynn_check_timer - 1
        if math.random(1, 50) == 1 then
            play_sound("flynnset_jumpscare", 1, 100000)
            G.flynn_dies.show_flynn = true
            G.flynn_dies.flynn_timer = 3
        end
    end

    if G.flynn_dies.show_flynn then
        G.flynn_dies.flynn_timer = G.flynn_dies.flynn_timer - dt
        if G.flynn_dies.flynn_timer <= 0 then
            G.flynn_dies.show_flynn = false
        end
    end
end

local drawhook = love.draw
function love.draw()
    drawhook()

    function load_image(fn)
        local full_path = (G.flynn_dies.path .. "assets/flynn/" .. fn)
        local file_data = assert(NFS.newFileData(full_path))
        local tempimagedata = assert(love.image.newImageData(file_data))
        return (assert(love.graphics.newImage(tempimagedata)))
    end

    local _xscale = love.graphics.getWidth() / 1920
    local _yscale = love.graphics.getHeight() / 1080

    if G.flynn_dies.show_flynn then
        if not G.flynn_dies.flynn_png then
            G.flynn_dies.flynn_png = load_image("flynn.png")
        end
        local alpha = math.min(1, G.flynn_dies.flynn_timer * 2)
        love.graphics.setColor(1, 1, 1, alpha)
        love.graphics.draw(G.flynn_dies.flynn_png, 0, 0, 0, _xscale, _yscale)
    end
end
