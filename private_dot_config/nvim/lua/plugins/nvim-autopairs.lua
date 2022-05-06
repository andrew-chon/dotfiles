require('nvim-autopairs').setup({
  enable_check_bracket_line = false,
  fast_wrap = {},
  check_ts = true,

})

-- nvim-cmp mappings
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))