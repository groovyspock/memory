# 修改提示符lambda为$，防止在删除已经输入的命令后会产生最后一个字符删除失败的场景。
需要修改cmder.lua文件中的下列函数
```lua
function lambda_prompt_filter()
    clink.prompt.value = string.gsub(clink.prompt.value, "{lamb}", "$ >>")
end
```
上边的修改把提示符修改为"$ >>"
