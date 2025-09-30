return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    -- 定義格式化 function
    local function format_with_null_ls()
      vim.lsp.buf.format({
        async = false,
        filter = function(c) return c.name == "null-ls" end, -- 只用 null-ls
      })
    end

    -- 註冊 null-ls
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.clang_format.with({
          filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
          extra_args = function(params)
            return { "--assume-filename", params.bufname }
          end,
        }),
      },
    })

    -- :W = 格式化後存檔（支援 ! 與檔名參數）
    vim.api.nvim_create_user_command("W", function(opts)
      format_with_null_ls()
      local args = ""
      if #opts.fargs > 0 then
        args = " " .. table.concat(opts.fargs, " ")
      end
      vim.cmd("write" .. (opts.bang and "!" or "") .. args)
    end, { bang = true, nargs = "*", complete = "file" })

    -- 命令列縮寫：輸入 :wf → 自動展開成 :W
    vim.cmd([[
      cnoreabbrev <expr> wf (getcmdtype() == ':' && getcmdline() =~# '^\s*wf\>') ? 'W' : 'wf'
    ]])
  end,
}
