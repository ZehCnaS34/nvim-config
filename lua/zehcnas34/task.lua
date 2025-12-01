local task = {}

function task.spawn()
end

function task.setup()
    vim.api.nvim_create_autocmd({'TermClose'}, {
        pattern = {'*.c', '*.h'},
        callback = function(ev)
            print(string.format("event fired: %s", vim.inspect(ev)))
        end
    })
end

return task
