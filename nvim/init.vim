" Tested w/ neovim 0.9+dev
" :PlugUpdate   " to update
" pip install --upgrade python-lsp-server
" Notes:
"
" * Language server protocol: make nvim an IDE
"     * new language `foo`: `:LspInstall foo`
"     * `cn` := refactor ("change name")
"     * `cl` := lint aka "change lint" (e.g., Black for Python)
"     * Autocomplete: automatic. (<C-n> and <C-p> are vim defaults for
"       navigating list)
"     * `K` := view docstring for variable under cursor
"     * `gD` := go to definition (also highlights; might need to use gd)
"     * `gr` := see references/where else variable used
"     * `gm` := view message for current line
"     * `<space>gq` to format entire file (with Black for Python)
"     * `cn` for "change name"
"
" * Commenting:
"     * `gc` to comment/uncomment visual selection
"     * (or `Ngcc` and `gcip` for shortcuts)
" * Searching:
"     *  <leader>ff := find files in current git repo
"     *  <leader>ft := find text in current git repo
"     *  <leader>fb := search buffers
"     *  <leader>fh := search (vim) help tags
"     *  <leader>b := see list of open buffers, select one with decent autocomplete/guessing
"
"     Run `pip install python-lsp-black`

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
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-cmdline'  " https://github.com/hrsh7th/nvim-cmp/issues/1486

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter'

" good vim shortcuts/features
Plug 'numToStr/Comment.nvim' " `gc` to comment visual regions/lines
Plug 'wellle/targets.vim'  " new text objects (e.g., `ci,`)
Plug 'dietsche/vim-lastplace' " keep editing place consitent open/close
Plug 'airblade/vim-gitgutter'  " show git tags in sidebar
Plug 'itchyny/vim-gitbranch'  " for showing current git brach
Plug 'itchyny/lightline.vim'  " for swtatus line
Plug 'bling/vim-bufferline'  " show opened buffers at bottom
Plug 'vim-pandoc/vim-pandoc-syntax'  " nice markdown highlighting (usable conceal w/ latex math)

" Colorscheme; other colorschemes supported by treesitter are at [1]
" [1]: https://github.com/rockerBOO/awesome-neovim#tree-sitter-supported-colorscheme
Plug 'tanvirtin/monokai.nvim'

Plug 'axelf4/vim-strip-trailing-whitespace'  " only remove whitespace from edited lines
Plug 'lukas-reineke/indent-blankline.nvim'  " mark indentation level; see https://github.com/vim-pandoc/vim-pandoc-syntax/issues/349
Plug 'nvim-orgmode/orgmode'
Plug 'vim-scripts/Align'  " align characters
call plug#end()


set mouse=nh  " all modes
set mousehide  " hide mouse when typing tet


""" Basic vim settings
" set nocompatible  " nvim is always v-improved
set smartcase  " use smart case while searching
set cmdheight=2  " reduce number of "hit enter because file written" prompts
set encoding=UTF-8
set nospell
set shortmess=a " limited "Hit <Enter> to continue" prompts
set title " set the title to filename
set breakindent  " keep indent for long lines that wrap
set scrolloff=4  " buffer for scrolling
set history=50 " keep a long history
let mapleader=" "  " <Leader>
let printencoding='utf-8'

" Use tabs instead of spaces
set expandtab  " use spaces instead
set tabstop=4  " use 4 spaces for tab
set shiftwidth=4  " autoindent by 4

""" Interacting with filesystem
set autowrite  " write with :e, :w, etc. Always write to disk
" set autochdir " auto change to directory of file?
"set formatoptions-=t " don't insert a newline when we get to 80chars!
" set clipboard+=unnamedplus  " if want system copy/paste integration
set updatetime=1000  " git gutter/etc every 1s (swap files, etc too)
set noswapfile " because we save so often
set undofile                " Save undos after file closes
set undodir=$HOME/.nvim/nvim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" <leader>c to copy from system clipboard
vnoremap <leader>c "*y
"imap <leader>v <ESC>"+pa

augroup pandoctexsyntax
  autocmd BufRead,BufNewFile *.md,*.markdown,*.text,*.txt setlocal filetype=pandoc
augroup END

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

" show all files
noremap <leader>ff <cmd>lua require('telescope.builtin').git_files{ recurse_submodules = true, show_untracked = false, cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>
" show only files in git
nnoremap <leader>fF <cmd>lua require('telescope.builtin').find_files{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').live_grep()<cr>
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
" README [1] and I tried to trim it)
" [1]:https://github.com/hrsh7th/nvim-cmp
lua <<EOF

  require('orgmode').setup({
    org_agenda_files = {'~/wiki/org/*', '~/Developer/stsievert/radadamp/TODO.org'},
    org_default_notes_file = '~/wiki/org/refile.org',
    org_todo_keywords = {'TODO(t)', 'NEXT(n)', 'BLOCKED(b)', '|', 'DONE(d)'},
    org_startup_folded = 'content',
    calendar_week_start_day=0, -- start on sunday
    org_deadline_warning_days=7,
    org_agenda_skip_scheduled_if_done=true,
    win_split_mode="30split",
    mappings = {
     global = {
        org_agenda = 'ga',
        org_capture = 'gc',
        org_refile = 'mR',
        org_toggle_archive_tag = "m$",
      },
     agenda = {
        org_agenda_refile = 'mR',
        org_agenda_archive = "m$",
     }
    },
  })
  -- go overview
  vim.keymap.set("n", "gO", ":args ~/wiki/org/*.org<CR>")  -- :n and :N to scroll through buffers
  -- go refile
  vim.keymap.set("n", "gR", ":e ~/wiki/org/refile.org<CR>")  -- :n and :N to scroll through buffers
EOF

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
      { name = 'orgmode' } -- for orgmode
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
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local opts = { noremap=true, silent=true }
  -- trimmed config from https://github.com/neovim/nvim-lspconfig

  -- `gm` for "go message"
  vim.keymap.set('n', 'gm', vim.diagnostic.open_float, opts)
  local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'cn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)  -- 'cn' for 'change name'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'cl', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gq', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  ---- python specific nvim config
  -- require("nvim-lsp-installer").setup({})
  -- require('Comment').setup()
  local monokai = require('monokai')
  local palette = monokai.pro
  monokai.setup { palette =  { base2 = "#181818", } }
  lspconfig = require('lspconfig')
  pylsp = lspconfig["pylsp"]
  require('lspconfig').pylsp.setup {
    settings = {
      pylsp = {
        -- configurationSources = {"mypy"},
        plugins = {
          mypy = {enabled = true},
          pyflakes = {enabled = true},
          black = {enabled = true},
          flake8 = {enabled = false},
          mccabe = {enabled = false},  -- function complexity
          preload = {enabled = false},
          pydocstyle = {enabled = false},
          pylint = {enabled = false},
          yapf = {enabled = false},
          autopep8 = {enabled = false},
          rope = {enabled = false},
          pyline = {enabled = false},
          pycodestyle = {
            enabled = false,
            ignore = {"E226","E302","E41","E501","C0103","C0111", "E501", "W291", "E305", "E302"},
            select = {},
            maxLineLength = 88,
          },
        }
      }
    }
  }
EOF

" set updatetime=1000
" autocmd CursorHold,CursorHoldI * silent! lua vim.lsp.buf.signature_help()
