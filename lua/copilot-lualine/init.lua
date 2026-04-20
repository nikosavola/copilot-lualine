--- Copilot status checking functions for copilot-lualine.
--- Provides functions to query the current state of copilot.lua.
---@module "copilot-lualine"
local component = {}
local blinkStatus, _ = pcall(require, "blink-cmp-copilot")

--- Lazy-load a module to avoid blocking Neovim startup.
--- Credit: TJDevries (https://github.com/tjdevries/lazy-require.nvim)
---@param require_path string The module path to lazy-load
---@return table proxy A proxy table that loads the module on first access
local function lazy_require(require_path)
    return setmetatable({}, {
        __index = function(_, key)
            return require(require_path)[key]
        end,

        __newindex = function(_, key, value)
            require(require_path)[key] = value
        end,
    })
end

local c = lazy_require("copilot.client")
local s = lazy_require("copilot.status")

--- Check if the Copilot LSP client is attached to the current buffer.
---@return boolean
local is_current_buffer_attached = function()
    return c.buf_is_attached(vim.api.nvim_get_current_buf())
end

--- Check if Copilot is enabled and attached to the current buffer.
---@return boolean
component.is_enabled = function()
    if c.is_disabled() then
        return false
    end

    if not is_current_buffer_attached() then
        return false
    end

    return true
end

--- Check if Copilot reports a warning/error status.
---@return boolean
component.is_error = function()
    if c.is_disabled() then
        return false
    end

    if not is_current_buffer_attached() then
        return false
    end

    local data = s.data.status
    if data == "Warning" then
        return true
    end

    return false
end

--- Check if Copilot is currently processing a suggestion (InProgress).
---@return boolean
component.is_loading = function()
    if c.is_disabled() then
        return false
    end

    if not is_current_buffer_attached() then
        return false
    end

    local data = s.data.status
    if data == "InProgress" then
        return true
    end

    return false
end

--- Check if Copilot auto-trigger is disabled (sleep mode) for the current buffer.
---@return boolean
component.is_sleep = function()
    if c.is_disabled() then
        return false
    end

    if not is_current_buffer_attached() then
        return false
    end

    if blinkStatus then
        return false
    end

    if vim.b.copilot_suggestion_auto_trigger == nil then
        return not lazy_require("copilot.config").suggestion.auto_trigger
    end
    return not vim.b.copilot_suggestion_auto_trigger
end

return component
