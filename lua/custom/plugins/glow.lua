return {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    config = function()
        require('glow').setup({
            style = "dark",
            width = 120,
            height = 100,
        })
    end
}
