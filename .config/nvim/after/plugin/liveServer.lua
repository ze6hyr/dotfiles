
vim.api.nvim_create_user_command("StartServer", function(opts)
    local file = opts.args or vim.fn.expand("%:h") --%:h Use passed argument or current file path -- %:t Sirf file ka naam lyna hai
    print("check file and you have same repo to run this commond")
    print("make sure you are in same repo as file. Running live-server for file: " .. file )
    
    local is_running = os.execute("pgrep -x live-server > /dev/null")

    if is_running ~= 0 then
        print("Starting live-server...")
        os.execute("nohup live-server --open=" .. file .. " --browser=qutebrowser > /dev/null 2>&1 &")
    else
        print("Live-server is already running, reloading...")
        os.execute("qutebrowser :reload")
    end
end, {nargs = "?"})

vim.api.nvim_create_user_command("StopServer", function()
    os.execute("pkill -f live-server")
end, {})


--[[ 
📦 Requirements for PHP Server Commands
Required Packages:
-- - php (for built-in server)
-- - Neovim with Lua support
-- - lsof (to check used ports)
-- - qutebrowser (for browser opening)
-- - jq (for parsing JSON in shell if needed, but not required here since we use Lua)
-- - nohup, grep → background + filtering (coreutils)


-- 🔁 Start PHP server on first available port
-- Table to store port and associated file
-- 
-- Notes:
-- - Ports used: 5000–5024 (auto-assigned, first free one wins)
-- - Info stored in ~/.cache/php_servers.json
--
-- - StartPhp auto-assigns ports between 5000-5024
-- - ShowPhpServers shows all current running servers
-- - StopPhp      → kills all
-- - StopPhp 5001 → kills only that one
-- - SingleOpenPhp      → opens current file in browser if running
--
]]

local server_file = vim.fn.expand("~/.cache/php_servers.json")
local json = vim.fn.json_decode
local encode = vim.fn.json_encode

-- Utility to load servers from file
local function load_servers()
    local ok, content = pcall(vim.fn.readfile, server_file)
    if not ok or vim.tbl_isempty(content) then return {} end
    return json(table.concat(content, "\n")) or {}
end

-- Save servers back to file
local function save_servers(servers)
    vim.fn.mkdir(vim.fn.fnamemodify(server_file, ":h"), "p")
    vim.fn.writefile({ encode(servers) }, server_file)
end

-- Find an available port
local function get_free_port()
    for port = 5000, 5024 do
        local handle = io.popen("lsof -i :" .. port)
        local result = handle:read("*a")
        handle:close()
        if result == "" then
            return tostring(port)
        end
    end
    return nil
end

-- StartPhp
vim.api.nvim_create_user_command("StartPhp", function()
    local file = vim.fn.expand("%:t")
    local dir = vim.fn.getcwd()
    local servers = load_servers()

    -- Check if already running
    for port, data in pairs(servers) do
        if data.dir == dir and data.file == file then
            print("Already running at port " .. port)
            return
        end
    end

    local port = get_free_port()
    if not port then
        print("No free ports available!")
        return
    end

    print("Starting PHP server on port " .. port .. " for " .. file)

    vim.fn.jobstart({ "php", "-S", "localhost:" .. port, "-t", ".", "-q" }, {
        cwd = dir,
        detach = true,
    })

    servers[port] = { file = file, dir = dir }
    save_servers(servers)

    local url = "http://localhost:" .. port .. "/" .. file
    vim.fn.jobstart({ "qutebrowser", ":open -t " .. url }, { detach = true })
end, {})

-- PhpServers
vim.api.nvim_create_user_command("ShowPhpServers", function()
    local servers = load_servers()
    print("📡 Running PHP Servers:")
    for port, data in pairs(servers) do
        --print(" - Port: " .. port .. " | File: " .. data.file .. " | Dir: " .. data.dir) -- this old style
        --print(" - Port: " .. port .. " | Dir: " .. data.dir .. " | File: " .. data.file)
        print(" - Port: " .. port .. "  " .. data.dir .. "/>" .. data.file)
    end
end, {})

-- StopPhp [port]
vim.api.nvim_create_user_command("StopPhp", function(opts)
    local servers = load_servers()
    local port = opts.args
    if port == "" then
        -- Stop all
        os.execute("pkill -x php")
        save_servers({})
        print("Stopped all PHP servers.")
    else
        local target = servers[port]
        if target then
            os.execute("lsof -ti :" .. port .. " | xargs kill -9")
            servers[port] = nil
            save_servers(servers)
            print("Stopped server on port " .. port)
        else
            print("No server found on port " .. port)
        end
    end
end, { nargs = "?" })

-- OpenPhp (open browser if server already running)
vim.api.nvim_create_user_command("SingleOpenPhp", function()
    local file = vim.fn.expand("%:t")
    local dir = vim.fn.getcwd()
    local servers = load_servers()

    for port, data in pairs(servers) do
        if data.dir == dir and data.file == file then
            local url = "http://localhost:" .. port .. "/" .. file
            vim.fn.jobstart({ "qutebrowser", ":open -t " .. url }, { detach = true })
            print("Opened in browser: " .. url)
            return
        end
    end

    print("No running server found for " .. file)
end, {})


