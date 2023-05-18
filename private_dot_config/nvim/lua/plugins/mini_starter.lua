return {
    "echasnovski/mini.starter",
    version = false,
    event = "VimEnter",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = function()
        local logo = table.concat({
            "██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
            "██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z",
            "██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z",
            "██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z",
            "███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
            "╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
        }, "\n")
        local pad = string.rep(" ", 22)
        local new_section = function(name, action, section)
            return { name = name, action = action, section = section }
        end

        local starter = require("mini.starter")
        --stylua: ignore
        local config = {
            evaluate_single = true,
            header = function()
                local hour = tonumber(vim.fn.strftime('%H'))
                -- [04:00, 12:00) - morning, [12:00, 20:00) - day, [20:00, 04:00) - evening
                local part_id = math.floor((hour + 4) / 8) + 1
                local day_part = ({ 'evening', 'morning', 'afternoon', 'evening' })[part_id]

                return ('Good %s, %s'):format(day_part, "Andrew")
            end,
            -- footer = "", // Uncomment to disable helping text
            items = {
                new_section("Find file", "Telescope find_files", "Telescope"),
                new_section("Recent files", "Telescope oldfiles", "Telescope"),
                new_section("Grep text", "Telescope live_grep", "Telescope"),
                new_section("init.lua", "e $MYVIMRC", "Config"),
                new_section("Lazy", "Lazy", "Config"),
                new_section("New file", "ene | startinsert", "Built-in"),
                new_section("Quit", "qa", "Built-in"),
                new_section("Session restore", [[lua require("persistence").load()]], "Session"),
            },
        }
        return config
    end,
    config = function(_, config)
        local starter = require("mini.starter")
        starter.setup(config)
    end
}
