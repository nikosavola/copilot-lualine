describe("copilot-lualine.spinners", function()
    local spinners = require("copilot-lualine.spinners")

    it("is a table", function()
        assert.is_table(spinners)
    end)

    it("contains the default 'dots' spinner", function()
        assert.is_table(spinners.dots)
        assert.is_true(#spinners.dots > 0)
    end)

    describe("each spinner", function()
        for name, frames in pairs(spinners) do
            it(name .. " is a non-empty table of strings", function()
                assert.is_table(frames, name .. " should be a table")
                assert.is_true(#frames > 0, name .. " should have at least one frame")
                for i, frame in ipairs(frames) do
                    assert.is_string(frame, name .. " frame " .. i .. " should be a string")
                    assert.is_true(#frame > 0, name .. " frame " .. i .. " should not be empty")
                end
            end)
        end
    end)

    it("includes all expected built-in spinners", function()
        local expected = {
            "dots",
            "dots_negative",
            "dots_snake",
            "dots_footsteps",
            "dots_hop",
            "line",
            "pipe",
            "dots_ellipsis",
            "dots_scrolling",
            "star",
            "flip",
            "hamburger",
            "grow_vertical",
            "grow_horizontal",
            "noise",
            "dots_bounce",
            "triangle",
            "arc",
            "circle",
            "square_corners",
            "circle_quarters",
            "circle_halves",
            "dots_toggle",
            "box_toggle",
            "arrow",
            "zip",
            "bouncing_bar",
            "bouncing_ball",
            "clock",
            "earth",
            "moon",
            "dots_pulse",
            "meter",
        }

        for _, name in ipairs(expected) do
            assert.is_not_nil(spinners[name], "missing spinner: " .. name)
        end
    end)
end)
