require("nvchad.mappings") -- Keep existing NVChad mappings

local map = vim.keymap.set
local term_buf = nil
local term_job_id = nil

map("n", "<leader>r", function()
    -- Close terminal if already open
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
        vim.api.nvim_buf_delete(term_buf, { force = true })
        term_buf = nil
        term_job_id = nil
        return
    end

    -- Get file details
    local file_dir = vim.fn.expand("%:p:h")
    local file_name = vim.fn.expand("%:t:r")
    local file_ext = vim.fn.expand("%:e")

    -- Determine the command based on file extension
    local cmd = ""
    if file_ext == "c" then
        cmd = "gcc " .. file_name .. ".c -o " .. file_name .. " -lm && ./" .. file_name
    elseif file_ext == "cpp" then
        -- Ensure you're using C++20 for C++ files
        cmd = "g++ -std=c++20 " .. file_name .. ".cpp -o " .. file_name .. " && ./" .. file_name
    elseif file_ext == "java" then
        cmd = "javac " .. file_name .. ".java && java " .. file_name
    elseif file_ext == "sh" then
        cmd = "bash " .. file_name .. ".sh"
    elseif file_ext == "js" then
        cmd = "node " .. file_name .. ".js"
    else
        vim.notify("Unsupported file type: " .. file_ext, vim.log.levels.ERROR)
        return
    end

    -- Open a terminal in a horizontal split and execute the command
    vim.cmd("split | resize 15 | term")
    term_buf = vim.api.nvim_get_current_buf()  -- Get the current terminal buffer

    -- Send the command to the terminal buffer
    vim.api.nvim_chan_send(vim.b.terminal_job_id, "cd " .. file_dir .. " && " .. cmd .. "\n")
    
    -- Set terminal buffer as active
    vim.cmd("startinsert") -- Automatically enter insert mode in terminal
end, { desc = "Run C, C++, Java, or Bash code" })

