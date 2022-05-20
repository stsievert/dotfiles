 let g:startify_custom_header = [
            \' <leader> p : Fuzzy (git) file finer',
            \' <leader> f : rip grep (search for text inside files)',
            \' <leader> F : Toggle file browser',
            \' <leader> s : buffers',
            \'',
            \' Python shortcuts',
            \' <leader> d : goto definition (`gd` otherwise)',
            \' <leader> r : rename variable',
            \' :Pyimport [module] : goto source',
            \' K to show docstring',
            \'',
            \'vim',
            \' `[visual selection]"yy` to yank into register y',
            \' "yp to paste that register',
            \' '' : go to last position',
            \' :buffers to list buffers',
             \]
            "\' Known',
            "\' <leader>ww : open diary',
            "\' <leader>w : wrap paragraphs',
            "\' <leader> g : ungraph paragraphs',
            "\' <leader> t : align to character',
            "\' <leader> z : first spelling suggestion (`z=` otherwise)',
            "\' <leader> x : clear search',

" REQUIRED INSTALL:
filetype plugin indent on
let g:python3_host_prog = '/Users/scott/anaconda3/bin/python'
let g:pyton_host_prog = '/Users/scott/anaconda3/envs/py27/bin/python2.7'
set termguicolors
" set mouse=a
" > brew install macvim --with-nnoremap --with-lua --enable-pythoninterp=dynamic --with-python-config-dir=/Users/scott/lib/python3.5/config
" required for UltiSnips (which can default to python3 if available)
" --with-lua required for neocomplcache
"
" JEDI-VIM has the following features:
" - <leader>d : goto definition
" - K : show docstrong
" - <leader>r : renaming
" - :Pyimport {module} : Open up module's source
"
"  <C-W> in insert mode to delete current word
"  gd to goto definition
"  '' (two apostrophes) to go to last position
"  g; and g, to go to last position
"  <cntrl-I> and <cntrl-O> to navigate through psition list (works across files
"  to!)
"
" QUICK REFACTOR
"   * hover over word, press `*` to search for that word
"   * use :%s//newName/g to replace all occurrences
" MULTIPLE CURSORS
"   * <ctrl-n> highlights the word under the cursor and puts you in visual mode
" MARKDOWN PREVIEW
"   * <leader>md to open up safari and view it live
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   * use "<letter><yank command> to yank into register <letter>
"     and "<letter><paste command> to paste that register
"   * use "set nopaste" to exit -- Insert (paste) --
"   * :TagbarToggle (mapped to <F8>) shows broad structure
"   * :Sex for file system navigation
" Select buffer n by "n<C-^>". i.e., "4ctrl-^"
" List all buffers by :buffers (which also shows numbers)
"
"
"   look at `set completeopt+=noinsert` for aut select feature like neocomplete

set nocompatible " be iMproved
set nospell

" map leader key to <Space>
let mapleader = " "
let g:mapleader = " "
let maplocalleader = ','
let g:maplocalleader = ','

" set a save-every-write
" inoremap <Esc> <Esc>:w<CR>: <CR>  " save <Esc> for recording macros
set autowriteall " all the good commands?
" use jk/kj to get back to normal/command mode
" imap jk <Esc>
"imap kj <Esc>
" imap Jk <Esc>
" imap jK <Esc>
" imap JK <Esc>
set conceallevel=0
filetype plugin on

call plug#begin('~/.config/nvim/plugged')
" Plug 'LaTeX-Box-Team/LaTeX-Box'  " latex
" Plug 'unblevable/quick-scope'  " highlights characters when `f` presssed
Plug 'scrooloose/nerdcommenter'  " quick commenting
Plug 'junegunn/rainbow_parentheses.vim'  " rainbow parens
Plug 'godlygeek/tabular'  " easy tables
Plug 'wellle/targets.vim'  " new text objects (e.g., `ci,`)
Plug 'neomake/neomake' " async making
Plug 'thirtythreeforty/lessspace.vim'  " whitespace strips only on edit lines
Plug 'JuliaEditorSupport/julia-vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " completion
Plug 'zchee/deoplete-jedi'  "  async completion for python
" Plug 'davidhalter/jedi-vim'  " smarter in-editor Python hinrter
"
" Plug 'honza/vim-snippets'
" Plug 'ctrlpvim/ctrlp.vim'  " to quickly find files
Plug 'tomasr/molokai' " a colorscheme, similar to Sublime Text
" Plug 'iCyMind/NeoSolarized'
Plug 'tpope/vim-markdown'  " vim markdown files
Plug 'mhinz/vim-startify' " the start screen
Plug 'tpope/vim-rsi'  " mappings for command mode (mostly option-arrows)
Plug 'haya14busa/incsearch.vim' " search as you type
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  " fuzzy file finding. :GitFiles, :Buffers
" Plug 'psf/black', { 'branch': 'stable' }  " python code formatting
Plug 'psf/black', { 'tag': '19.10b0' }  " see https://github.com/psf/black/issues/1293


" requires installing shime/livedown on command line
Plug 'shime/vim-livedown', { 'branch': 'master' }  " preview markdown
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree' " Nice file browser
" Plug 'itchyny/lightline.vim' " the menu bar at the bottom
Plug 'osyo-manga/vim-over' " substitute preview for :%s/
Plug 'tpope/vim-fugitive'  " git integration
Plug 'csexton/jekyll.vim'  " for syntax highlighting of top
Plug 'Yggdroot/indentLine'  " display the thin vertical lines on indent
Plug 'python-rope/ropevim'  " python refactorings and assist
" Plug 'vimwiki/vimwiki'  " for the wiki
Plug 'majutsushi/tagbar'  " super useful structure viewing (fns, classes, etc)
Plug 'dietsche/vim-lastplace' " keep editing place consitent open/close
Plug 'google/vim-searchindex'  " nice 1/n search info
Plug 'justinmk/vim-sneak'  " command `s` to vim-sneak
" Plug 'jceb/vim-orgmode'  " emacs org mode
Plug 'vim-airline/vim-airline'  " status bar
Plug 'vim-airline/vim-airline-themes'  " status bar themes
" Plug 'vim-scripts/LustyExplorer'
" Plug 'mhinz/vim-grepper'  " setup easy grepping (mapping to leader-f)
" Plug 'tell-k/vim-autopep8'  " pep8. duh.
" Plug 'google/vim-codefmt'
Plug 'airblade/vim-gitgutter'  " show git tags in sidebar
Plug 'rakr/vim-one'  " colorscheme, based off Atom
Plug 'Vimjas/vim-python-pep8-indent'  " nicer indenting for Python
Plug 'tpope/vim-fugitive'  " git GUI of sorts
call plug#end()

set encoding=UTF-8
set termguicolors
set bg=light
set synmaxcol=256 " protect against long line slowness

set background=dark
let g:airline_theme='wombat'
colorscheme molokai

set clipboard+=unnamedplus

 let g:go_fmt_fail_silently = 1
 let g:livedown_open = 1
 let g:livedown_port = 1337

" let g:syntastic_python_python_exec = '~/anaconda/bin/python'
" nmap <F7> :SyntasticCheck<CR>
" nmap <F8> :SyntasticReset<CR>
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let b:syntastic_mode = 'passive'

let g:NERDSpaceDelims = 1
" Ctrl-f to toggle NERDTree
map <leader>F :NERDTreeToggle<CR>

 " This makes vim not conceal on the current line
 let g:indentLine_concealcursor = ''

 let python_highlight_all = 1
 " set statusline+=%#warningmsg#
 " set statusline+=%{SyntasticStatuslineFlag()}
 " set statusline+=%*

 " how (gui)vim looks
 nmap <leader>p :GitFiles<CR>
 nmap <leader>s :Buffers<CR>
 set printfont=Source\ Code\ Pro:h7
 set guifont=Source\ Code\ Pro:h12
 set guicursor+=a:blinkon0 " no blinking!
 set breakindent
 set title " set the title to filename
 set shortmess=a " limited "Hit <Enter> to continue" prompts
 set scrolloff=4
 " set background=light

 " Define a mapping to redraw syntax highlighting
 " Helps with long docstrings in Python files (it often gets flipped)
 " noremap <leader>F <Esc>:syntax sync fromstart<CR>

 set nu
 set relativenumber
 set numberwidth=2

 set nosmartindent " no annoying comment thing (comment<CR>comment)
 set guioptions-=r " remove the scroll bars
 set guioptions-=l
 set guioptions-=b
 set noerrorbells " keep Vim silent
 set visualbell
 set nospell
 set display=lastline " display the last line for long wrapped lines (ie, latex)
 "highlight CursorLineNr term=bold guibg=#eee9d4
 "autocmd ColorScheme * highlight CursorLineNr guibg=#eee9d4 term=bold
 set colorcolumn=80 " highlight comlumn 80

 " how vim behaves
 set autochdir " auto change to directory of file?
 "set formatoptions-=t " don't insert a newline when we get to 80chars!
 set history=50 " keep a long history
 " easier folding of functions
 syntax on " highlight syntax!
 " make moving around easier
 nnoremap gj j
 nnoremap gk k
 nnoremap j gj
 nnoremap k gk

 " custom leader maps
 " unwrapping paragraphs (80 col)
 nnoremap <leader>w Vgq
 nnoremap <leader>g vipgq

 " Change the cursor shape to a line in insert mode
 let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

 " turn off the conceal on the current line
 " nmap <leader>f :let @+ = expand("%:p:h")<CR>
 " nmap <leader>f :Grepper<CR>
     " get path of file easily
 nmap <silent> <leader>x :nohlsearch<CR>
     " to clear search results
 nnoremap U :redo<CR>
     " undo u, redo U
 nmap <Leader>z 1z=
     " spelling correction

 " Sets up wrapping an wanted: wrap comments at 79 chars, don't wrap code
 set textwidth=79
 set formatoptions+=c  " auto wrap comments
 set formatoptions-=t  " do not auto wrap text
 set formatoptions+=q  " allow paragraph formatting
 set formatoptions+=n  " recognize numbered lists

 " tabs
 set expandtab     " spaces for tab
 set tabstop=4     " what counts as a tab?
 set shiftwidth=4  " tab for autoindent
 set autoindent    " autoindent
 set softtabstop=4 " for <Delete> when at a tab
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

 " searching
 set incsearch       " search as you type
 set hlsearch        " highlight search terms
 set ignorecase      " case insensitive search

 " folding
 " press zc (-close) and zo (-open) to open
 set foldmethod=indent
 set foldlevel=10 " Max folding depth
 set foldnestmax=10 " deepest fold
 set nofoldenable " don't fold by default

 " encode utf-8 by default
 let printencoding='utf-8'
 " set encoding=utf-8
 set fileencodings=ucs-bom,utf-8,latin1

 " backing up
 set nobackup " because we save every <Esc>
 set noswapfile " because we save so often

" Let vim remember history, which allows undo at any point
set undofile                " Save undos after file closes
set undodir=$HOME/.nvim/nvim/undo " where to save undo histories
set undolevels=10000         " How many undos
set undoreload=100000        " number of lines to save for undo

 " Remove all trailing spaces every write
 fun! <SID>StripTrailingWhitespaces()
     let l = line(".")
     let c = col(".")
     %s/\s\+$//e
     call cursor(l, c)
 endfun
 " autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
 "

 autocmd BufNew,BufNewFile,BufReadPost,BufRead *.txt,*.text,*.md,*.markdown,*.rst setlocal filetype=markdown
 " autocmd BufNewFile,BufReadPost *.md,*.rst setlocal filetype=markdown
 autocmd BufNew,BufNewFile,BufRead *.tex,*.tplx setlocal filetype=tex
 " autocmd BufNew,BufNewFile,BufRead *.c setlocal filetype=c

 """"""" INDIVIDUAL PLUGIN SETTINGS
 " settings for vimwiki; set my default wiki to Dropbox
 " let g:vimwiki_list = [{'path': '~/Dropbox/Apps/nvNotes/wiki/',
            " \ 'syntax': 'markdown', 'ext': '.md',
            " \ 'list_margin': 0 }]


 " let g:vimwiki_list = [{'path': '~/Dropbox/Apps/nvNotes/wiki',
       " \ 'template_path': '~/Dropbox/Apps/nvNotes/wiki/templates/',
       " \ 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md',
       " \ 'path_html': '~/Dropbox/Apps/nvNotes/wiki_html/',
       " \ 'custom_wiki2html': 'vimwiki_markdown',
       " \ 'template_ext': '.tpl', 'list_margin': 0}]

 let g:jekyll_path = "/Users/scott/Developer/stsievert.github.io/"

 " Getting CtrlP working with shortcuts
 let g:ctrlp_map = '<c-p>'
 let g:ctrlp_cmd = 'CtrlP'


 " Disable outcompletion
 "let g:neocomplete#enable_at_startup = 1

 " Display the colorbar (and use lightline)
 " set laststatus=2

 " change number of files to see on new vim window
 let g:startify_show_files_number = 20
 let g:startify_bookmarks = ['~/.config/nvim/init.vim', '~/.zshrc']

 " Trigger a highlight only when pressing f and F.
 let g:qs_highlight_on_keys =  ['f', 'F']

 " Livedown: for markdown preview in browser
 " nmap <Leader>md :LivedownPreview<CR>

 " tabular
 vnoremap <Leader>t :Tabular<space>/
 nmap <leader>f :Rg<CR>

 " let g:neomake_tex_latexmk_maker = {
     " \ 'exe': 'latexmk',
     " \ 'args': ['-pdf', '-shell-escape'],
     " \ 'errorformat': '%f:%l:%c: %m',
     " \ }
 " let g:neomake_tex_enabled_makers = ['latexmk', 'rubberinfo']


 " Ultisnips
 let g:UltiSnipsExpandTrigger="<c-f>"
 let g:UltiSnipsListSnippets="<c-s-tab>"
 let g:UltiSnipsSnippetDir = "~/.config/nvim/UltiSnips"

 " make the undercurl go away for bad spelling
 " hi SpellBad guisp=blue gui=underline guifg=NONE guibg=Blue ctermfg=NONE ctermbg=Blue cterm=underline term=underline

 " for wrapping the display lines on a long single line
 set wrap
 set linebreak
 set nolist
 let &showbreak = ''

 set spelllang=en_us
" let g:startify_change_to_vcs_root = 1

 " hi SpellBad guisp=Blue gui=underline guifg=NONE guibg=Blue ctermfg=NONE ctermbg=Blue cterm=underline term=underline


 "" specific file types and their config
 " autocmd Filetype * call AllSetup()
 " autocmd Filetype tex call TexSetup()
 " autocmd Filetype markdown call MarkdownSetup()
 " autocmd Filetype python call PythonSetup()

 " au BufNewFile,BufFilePre,BufRead *.md,*.markdown set syntax=markdown
 " au BufNewFile,BufFilePre,BufRead *.md,*.markdown set filetype=markdown
 " autocmd BufRead,BufNewFile,BufEnter *.py set filetype=python
 " autocmd BufRead,BufNewFile,BufEnter *.py set syntax=python
 " autocmd BufRead,BufNewFile,BufEnter * call AllSetup()
 " autocmd BufRead,BufNewFile,BufEnter *.tex call TexSetup()
 " autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MarkdownSetup()

 function! s:manage_ultisnips_path()
 Python << EOF
 import sys, vim
 from UltiSnips import UltiSnips_Manager
 UltiSnips_Manager.expand()
 EOF
 return ""
 endfunction

 " Keep Syntastic's quickfix window closed
 " let g:syntastic_always_populate_loc_list = 0
 " let g:syntastic_auto_loc_list = 0

 " W391: blank line @ end of file
 " E302: two newlines before functions
 " E111: indentation not a multiple of 4

 " this shows useful Python info (available fns, etc)
 nmap <F8> :TagbarToggle<CR>

 let g:syntastic_mode_map = {
     \ "mode": "active",
     \ "active_filetypes": [],
     \ "passive_filetypes": ["tex", "markdown"] }

 set clipboard=unnamed
 let g:deoplete#enable_at_startup = 1
 let g:jedi#completions_enabled = 0  " allow deoplete-jedi to do completions
 set concealcursor="nvic"
 let g:jedi#show_call_signatures = 0

 " highlight markdownBold cterm=bold gui=bold ctermfg=white
 " highlight markdownItalic cterm=italic

 call rainbow_parentheses#activate()

 autocmd! BufWritePost * Neomake
 autocmd filetype crontab setlocal nobackup nowritebackup
 let g:neomake_python_enabled_makers = ['mypy']
 let g:neomake_python_pep8_maker = {
         \ 'args': ['--ignore-missing-imports'],
         \ 'errorformat': '%f:%l:%c: %m',
         \ }

hi MyErrorMsg guifg=red ctermfg=red ctermbg=none
let g:neomake_error_sign = { 'text': '✖', 'texthl': 'MyErrorMsg' }
hi MyWarningMsg guifg=yellow ctermfg=yellow ctermbg=none
let g:neomake_warning_sign = { 'text': '⚠', 'texthl': 'MyWarningMsg' }

hi GitGutterAdd guifg=gray guibg=none ctermfg=gray ctermbg=none

 " E111: indentation not multiple of 4
 " E501: character limit of 79 characters
 " E226: Missing whitespace around arthimetic operator
 " let g:neomake_python_pylint_maker = {
         " \ 'args': ['--confidence=UNDEFINED'],
         " \ }
 " let g:neomake_latex_enabled_makers = ['latexmk', 'rubberinfo']
 let g:SuperTabDefaultCompletionType = "<c-n>"

 let g:_today=strftime('%Y-%m-%d')
 " let g:_diary_filename='~/Sync/Apps/nvNotes/wiki/diary/' . g:_today . '.md'
 " let g:_diary_filename='~/Cloud/wiki/wiki/diary/' . g:_today . '.md'
 " map <leader>w<leader>w :execute ':e ' . g:_diary_filename<CR>

 "" Show buffers up top
 " Enable the list of buffers
 let g:airline#extensions#tabline#enabled = 1
 let g:airline_section_c = "%t"
 " let g:airline_section_b = "%{fugitive#statusline()}"
 let g:airline#extensions#tabline#buffer_nr_show = 1  " show buffer number

 " Show just the filename
 let g:airline#extensions#tabline#fnamemod = ':t'
 set inccommand=nosplit

 " text widths to truncate different fields at
  let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 79,
      \ 'x': 60,
      \ 'c': 80,
      \ 'y': 88,
      \ 'z': 45,
      \ 'warning': 80,
      \ 'error': 80,
      \ }

" let g:grepper = {}
" runtime autoload/grepper.vim
" let g:grepper.dir = 'repo,cwd'
" let g:grepper.highlight = 1
" let g:ctrlp_clear_cache_on_exit = 0
" set grepprg=rg\ --vimgrep
