local present, surfer = pcall(require, 'syntax-tree-surfer')

if not present then
  return
end


surfer.setup { highlight_group = "HopNextKey" }
