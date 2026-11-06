-- workspaces
for i = 1, 9 do
    hl.workspace_rule({ workspace = tostring(i), persistent = true })
end

-- windows
hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    match = { class = "cs2" }, immediate = true
})
