-- vim: ft=lua

std = "luajit"

globals = {
    "vim",
}

read_globals = {
    "describe",
    "it",
    "assert",
    "before_each",
    "after_each",
    "pending",
    "spy",
    "stub",
    "mock",
}

-- Ignore line length warnings
ignore = {
    "631", -- line is too long
}
