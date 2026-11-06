hl.monitor({
    output = "",
    mode = "highrr",
    scale = 1,
})

hl.on("monitor.added", function(monitor)
    hl.monitor({
        output = "",
        mode = "highrr",
        scale = 1,
    })
end)
