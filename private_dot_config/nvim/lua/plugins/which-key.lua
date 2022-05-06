local wk = require("which-key")

wk.register({
  -- Telescope
  s = {
    name = "Telescope",
    f = "Fuzzy search files",
    b = "Current buffer fuzzy find",
    d = "Grep string",
    p = "Live grep",
  },
  ["<space>"] = "Search buffers",

  -- Focus
  h = "Split left [Focus]",
  j = 'Split down [Focus]',
  k = 'Split up [Focus]',
  l = 'Split right [Focus]',

  -- LSP Config
  D = "Type definitions",
  r = {
    name = "rename",
    n = "Rename",
  },
  g = {
    name = "references",
    r = "References"
  },
  c = {
    name = "code actions",
    a = "Code actions"
  }
}, { prefix = "<leader>"})

wk.register({
  -- LSP config
  D = "Go to delcarations",
  d = "Go to definition",
  i = "Go to implementation",
}, { prefix = "g" })