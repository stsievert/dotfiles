" NOTES:
"
" * Automatic autocompletion
"     * (if new language: `:LspInstall [lang]`
" * `gc` to comment/uncomment visual selection
" * normal editor (git shown in sidebar, last place)
" * Searching:
"     *  <leader>ff := find files in current git repo
"     *  <leader>ft := find text in current git repo
"     *  <leader>fh := search help tags
"     *  <leader>fb := search buffers
"     *  <leader>b := see list of open buffers, select one with decent autocomplete

call plug#begin()
" Searching
Plug 'nvim-lua/plenary.nvim'  " for telescope 
Plug 'nvim-telescope/telescope.nvim'  " for finding files, searching, etc
Plug 'BurntSushi/ripgrep'  " required for live_grep

" Autocomplete
Plug 'neovim/nvim-lspconfig'  " Common LSP configs
Plug 'williamboman/nvim-lsp-installer'  " allow installing LSPs with `:LspInstall python`
Plug 'hrsh7th/nvim-cmp'  " LSP completion (recommended by nvim-lspconfig)
Plug 'hrsh7th/cmp-vsnip'  " use <C-n> and <C-p> to bring up autocomplete menu
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter'

" good vim shortcuts/features
Plug 'numToStr/Comment.nvim' " `gc` to comment visual regions/lines
Plug 'wellle/targets.vim'  " new text objects (e.g., `ci,`)
Plug 'Yggdroot/indentLine'  " display the thin vertical lines on indent
Plug 'dietsche/vim-lastplace' " keep editing place consitent open/close
Plug 'airblade/vim-gitgutter'  " show git tags in sidebar
Plug 'itchyny/vim-gitbranch'  " for showing current git brach
Plug 'itchyny/lightline.vim'  " for swtatus line
Plug 'itchyny/vim-gitbranch'
Plug 'bling/vim-bufferline'  " show opened buffers at bottom

" Colorscheme; other colorschemes supported by treesitter are at [1]
" [1]: https://github.com/rockerBOO/awesome-neovim#tree-sitter-supported-colorscheme
Plug 'tanvirtin/monokai.nvim'

Plug 'axelf4/vim-strip-trailing-whitespace'  " only remove whitespace from edited lines
call plug#end()

" Setup various plugins
lua <<EOF
require("nvim-lsp-installer").setup({})
require'lspconfig'.pylsp.setup{}
require('Comment').setup()

local monokai = require('monokai')
local palette = monokai.pro
monokai.setup {
    palette = {base2 = "#181818"}
}
EOF

""" Basic vim settings
" set nocompatible  " nvim is always v-improved
set smartcase  " use smart case while searching
set encoding=UTF-8
set nospell
set shortmess=a " limited "Hit <Enter> to continue" prompts
set title " set the title to filename
set breakindent  " keep indent for long lines that wrap
set scrolloff=4  " buffer for scrolling
set history=50 " keep a long history
let mapleader=" "  " <Leader>
let printencoding='utf-8'

""" Interacting with filesystem
set autowrite  " write with :e, :w, etc. Always write to disk
set autochdir " auto change to directory of file?
"set formatoptions-=t " don't insert a newline when we get to 80chars!
" set cliboard+=unnamedplus  " if want system copy/paste integration
set updatetime=1000  " git gutter/etc every 1s (swap files, etc too)
set noswapfile " because we save so often
set undofile                " Save undos after file closes
set undodir=$HOME/.nvim/nvim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

autocmd BufNew,BufNewFile,BufReadPost,BufRead *.txt,*.text,*.md,*.markdown,*.rst setlocal filetype=markdown
" autocmd BufNewFile,BufReadPost *.md,*.rst setlocal filetype=markdown
autocmd BufNew,BufNewFile,BufRead *.tex,*.tplx setlocal filetype=tex
" autocmd BufNew,BufNewFile,BufRead *.c setlocal filetype=c

""" Appearance settings
syntax on " highlight syntax!
set termguicolors
set laststatus=2  " always show status bar
set noshowmode  " hide --INSERT-- at bottom so buffers always show
set nu  " set numbers on every line
set relativenumber  " set relative numbers on every line (except current)
set numberwidth=2  " because screen not 200 lines tall
set colorcolumn=80 " highlight comlumn 80

"""  movement/completion
set completeopt=menu,menuone,preview
" Move between longlines as if there are no newlines
nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk

""" Plugin settings
" Find files using Telescope command-line sugar.
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').live_grep{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>
nnoremap <Leader>b :ls<CR>:b<Space>

let g:lightline = {'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
" highlight DiffAdd ctermbg=blue ctermfg=blue guibg=green guifg=green
" ^for git gutter, handled by monokai colorscheme

" so that lsp-installer places hooks in the right places (according to readme)
" (this config is longer than I'd like, but it's required; it's from their
" README and I tried to trim it)
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pylsp'].setup {
    capabilities = capabilities
  }
EOF
