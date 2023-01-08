local present, clext = pcall(require, 'clang_extensions')

if not present then
  return
end

clext.setup { server = 'lsp.servers.clangd' }
