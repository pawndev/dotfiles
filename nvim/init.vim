" Earthsong theme {{{

"set background=dark
"hi clear
"syntax reset

"" Colors for the User Interface.

"hi Cursor      guibg=#cc4455  guifg=white     ctermbg=4 ctermfg=15
"hi link CursorIM Cursor
"hi Normal      guibg=#36312C  guifg=#EBD1B7    gui=none ctermbg=0 ctermfg=15
"hi NonText     guibg=bg  guifg=#EBD1B7   ctermbg=8 ctermfg=14
"hi Visual      guibg=#557799  guifg=white    gui=none ctermbg=9 ctermfg=15

"hi Linenr      guibg=bg       guifg=#aaaaaa  gui=none ctermbg=bg ctermfg=7

"hi Directory   guibg=bg       guifg=#337700  gui=none ctermbg=bg ctermfg=10

"hi IncSearch   guibg=#0066cc  guifg=white    gui=none ctermbg=1 ctermfg=15
"hi link Seach IncSearch

"hi SpecialKey  guibg=bg guifg=fg       gui=none ctermbg=bg ctermfg=fg
"hi Titled      guibg=bg guifg=fg       gui=none ctermbg=bg ctermfg=fg

"hi ErrorMsg    guibg=bg guifg=#ff0000   ctermbg=bg ctermfg=12
"hi ModeMsg     guibg=bg guifg=#ffeecc  gui=none ctermbg=bg ctermfg=14
"hi link  MoreMsg     ModeMsg
"hi Question    guibg=bg guifg=#95CC5E   ctermbg=bg ctermfg=10
"hi link  WarningMsg  ErrorMsg

"hi StatusLine     guibg=#ffeecc  guifg=black     ctermbg=14 ctermfg=0
"hi StatusLineNC   guibg=#cc4455  guifg=white    gui=none ctermbg=4  ctermfg=11
"hi VertSplit      guibg=#cc4455  guifg=white    gui=none ctermbg=4  ctermfg=11

"hi DiffAdd     guibg=#446688  guifg=fg    gui=none ctermbg=1 ctermfg=fg
"hi DiffChange  guibg=#558855  guifg=fg    gui=none ctermbg=2 ctermfg=fg
"hi DiffDelete  guibg=#884444  guifg=fg    gui=none ctermbg=4 ctermfg=fg
"hi DiffText    guibg=#884444  guifg=fg     ctermbg=4 ctermfg=fg

"" Fold
"hi clear SignColumn
"hi Folded ctermfg=95 ctermbg=58 cterm=NONE guifg=#7a7267 guibg=#36312c gui=NONE

"" Colors for Syntax Highlighting.

"hi Comment  guibg=bg  guifg=#7A7267  gui=none    ctermbg=8   ctermfg=7

"hi Constant    guibg=bg    guifg=white        ctermbg=8   ctermfg=15
"hi String      guibg=bg    guifg=#F8BB39    ctermbg=bg  ctermfg=14
"hi Character   guibg=bg    guifg=#DB784D      ctermbg=bg  ctermfg=14
"hi Number      guibg=bg    guifg=#F8BB39      ctermbg=1   ctermfg=15
"hi Boolean     guibg=bg    guifg=#F8BB39  gui=none    ctermbg=1   ctermfg=15
"hi Float       guibg=bg    guifg=#F8BB39      ctermbg=1   ctermfg=15

"hi Identifier  guibg=bg    guifg=#EBD1B7      ctermbg=bg  ctermfg=12
"hi Function    guibg=bg    guifg=#DB784D      ctermbg=bg  ctermfg=12
"hi Statement   guibg=bg    guifg=#DB784D      ctermbg=bg  ctermfg=14

"hi Conditional guibg=bg    guifg=#DB784D      ctermbg=bg  ctermfg=12
"hi Repeat      guibg=bg    guifg=#DB784D      ctermbg=4   ctermfg=14
"hi Label       guibg=bg    guifg=#ffccff      ctermbg=bg   ctermfg=13
"hi Operator    guibg=bg    guifg=#DB784D      ctermbg=6   ctermfg=15
"hi Keyword     guibg=bg    guifg=#DB784D      ctermbg=bg  ctermfg=10
"hi Exception   guibg=bg    guifg=#DB784D      ctermbg=bg  ctermfg=10

"hi PreProc    guibg=bg   guifg=#ffcc99   ctermbg=4  ctermfg=14
"hi Include    guibg=bg   guifg=#95CC5E   ctermbg=bg ctermfg=10
"hi link Define    Include
"hi link Macro     Include
"hi link PreCondit Include

"hi Type       guibg=bg   guifg=#95CC5E      ctermbg=bg  ctermfg=12
"hi StorageClass   guibg=bg   guifg=#DB784D      ctermbg=bg  ctermfg=10
"hi Structure      guibg=bg   guifg=#EBD1B7      ctermbg=bg  ctermfg=10
"hi Typedef    guibg=bg   guifg=#95CC5E    ctermbg=bg  ctermfg=10

"hi Special    guibg=bg   guifg=#bbddff      ctermbg=1   ctermfg=15
"hi SpecialChar    guibg=bg   guifg=#bbddff      ctermbg=1   ctermfg=15
"hi Tag        guibg=bg   guifg=#bbddff      ctermbg=1   ctermfg=15
"hi Delimiter      guibg=bg   guifg=fg       ctermbg=1   ctermfg=fg
"hi SpecialComment guibg=#334455  guifg=#9a9082    ctermbg=1   ctermfg=15
"hi Debug      guibg=bg   guifg=#ff9999  gui=none    ctermbg=8   ctermfg=12

"hi Underlined guibg=bg guifg=#99ccff gui=underline ctermbg=bg ctermfg=9 cterm=underline

"hi Title    guibg=bg  guifg=#EBD1B7        ctermbg=1   ctermfg=15
"hi Ignore   guibg=bg       guifg=#cccccc    ctermbg=bg  ctermfg=8
"hi Error    guibg=#ff0000  guifg=white        ctermbg=12  ctermfg=15
"hi Todo     guibg=#556677  guifg=#ff0000      ctermbg=1   ctermfg=12

"hi htmlH2 guibg=bg guifg=fg  ctermbg=8 ctermfg=fg
"hi link htmlH3 htmlH2
"hi link htmlH4 htmlH3
"hi link htmlH5 htmlH4
"hi link htmlH6 htmlH5

" }}}

" Functions {{{
" Thomas
function ToggleQfList()
  if (filter(getwininfo(), 'v:val.quickfix') == [])
    :copen
  else
    :cclose
  endif
endfunction

function ToggleLocList()
  if (getloclist('.') != [])
    if (filter(getwininfo(), 'v:val.loclist') == [])
      :lopen
    else
      :lclose
    endif
  endif
endfunction

function PrevListItem()
  if (getqflist() != [])
    :cprevious
  elseif (getloclist('.') != [])
    :lprevious
  endif
endfunction

function NextListItem()
  if (getqflist() != [])
    :cnext
  elseif (getloclist('.') != [])
    :lnext
  endif
endfunction

" Call the save command from vim
function Save()
  :w
endfunction

" Chris

" Function that move the `help` panel to right vsplit
if has('autocmd')
  function! ILikeHelpToTheRight()
    if !exists('w:help_is_moved') || w:help_is_moved != "right"
      wincmd L
      let w:help_is_moved = "right"
    endif
  endfunction

  augroup HelpPages
    autocmd FileType help nested call ILikeHelpToTheRight()
  augroup END
endif

" Function that get the content select in visual mode.
function! GetVisualSelection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)

    if len(lines) == 0
        return ""
    endif

    let lines[-1] = lines[-1][:column_end - (&selection == "inclusive" ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]

    return join(lines, "\n")
endfunction

" Function that move the current line to `offset`
function! MoveLines(offset) range
    let l:col = virtcol('.')
    let l:offset = str2nr(a:offset)
    exe 'silent! :' . a:firstline . ',' . a:lastline . 'm'
        \ . (l:offset > 0 ? a:lastline + l:offset : a:firstline + l:offset)
    exe 'normal ' . l:col . '|'
endfunction

set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
        let s = '' " complete tabline goes here
        " loop through each tab page
        for t in range(tabpagenr('$'))
                " set highlight
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " set the tab page number (for mouse clicks)
                let s .= '%' . (t + 1) . 'T'
                let s .= ' '
                " set page number string
                let s .= t + 1 . ' '
                " get buffer names and statuses
                let n = ''      "temp string for buffer names while we loop and check buftype
                let m = 0       " &modified counter
                let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
                " loop through each buffer in a tab
                for b in tabpagebuflist(t + 1)
                        " buffer types: quickfix gets a [Q], help gets [H]{base fname}
                        " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
                        if getbufvar( b, "&buftype" ) == 'help'
                                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
                        elseif getbufvar( b, "&buftype" ) == 'quickfix'
                                let n .= '[Q]'
                        else
                                let n .= pathshorten(bufname(b))
                        endif
                        " check and ++ tab's &modified count
                        if getbufvar( b, "&modified" )
                                let m += 1
                        endif
                        " no final ' ' added...formatting looks better done later
                        if bc > 1
                                let n .= ' '
                        endif
                        let bc -= 1
                endfor
                " add modified label [n+] where n pages in tab are modified
                if m > 0
                        let s .= '[' . m . '+]'
                endif
                " select the highlighting for the buffer names
                " my default highlighting only underlines the active tab
                " buffer names.
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " add buffer names
                if n == ''
                        let s.= '[New]'
                else
                        let s .= n
                endif
                " switch to no underlining and add final space to buffer list
                let s .= ' '
        endfor
        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#TabLineFill#%T'
        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
                let s .= '%=%#TabLineFill#%999Xclose'
        endif
        return s
      endfunction
" }}}

" Config {{{
set termguicolors
"hi Normal guibg=NONE ctermbg=NONE
"hi NonText ctermbg=NONE guibg=NONE
set backspace=indent,eol,start
set breakindent
set clipboard+=unnamedplus,unnamed
set completeopt+=menu
set expandtab
set history=1000
set hlsearch
set ignorecase
set incsearch
set linebreak
set ruler
set scrolloff=3
set shiftwidth=2
set smartcase
set softtabstop=2
set tabstop=2
set ttimeoutlen=50
set t_Co=256
set encoding=utf-8
set number
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list!
set splitright
set hidden
set expandtab ts=2 sw=2 ai
set pastetoggle=<F2>
set laststatus=2
set backup
set writebackup
set swapfile
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/backups
if has("persistent_undo")
    set undodir=~/.config/nvim/undodir
    set undofile
endif
"hi clear FoldColumn
au FileType qf wincmd J
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
au BufWritePre * let &bex = '-' . strftime("%Y_%m_%d-%H_%M_%S") . '.vimbackup'
autocmd FileType vim,zsh,i3config,dosini setlocal foldmethod=marker
" }}}

" Plugin {{{
call plug#begin('~/.config/nvim/plugged')

" Completion {{{
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'mattn/emmet-vim'
Plug 'raimondi/delimitmate'
Plug 'docunext/closetag.vim'
" }}}

" Fuzzy finder {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
" }}}

" Languages {{{
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'fatih/vim-go'
Plug 'posva/vim-vue'
Plug 'hashivim/vim-terraform'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'elixir-editors/vim-elixir'
Plug 'ekalinin/Dockerfile.vim'
Plug 'StanAngeloff/php.vim'
Plug 'mboughaba/i3config.vim'
Plug 'jparise/vim-graphql'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'SirVer/ultisnips'
" }}}

" Themes {{{
"Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
"Plug 'ryanoasis/vim-devicons'
Plug 'pawndev/colour-schemes', {'rtp': 'vim'}
" }}}

" Utilities {{{
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'dietsche/vim-lastplace'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'stevearc/vim-arduino'
Plug 'mbbill/undotree'
"Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" }}}

call plug#end()
" }}}

" Theme {{{
colorscheme earthsong
color earthsong
" }}}

" PluginConfig {{{
  " ncm2 {{{
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()

  " IMPORTANTE: :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect

  " LSP
  let g:LanguageClient_autoStart = 1
  let g:LanguageClient_selectionUI = 'fzf'
  let g:LanguageClient_serverCommands = {
  \ 'javascript': ['flow', 'lsp', '--from', './node_modules/.bin'],
  \ 'javascript.jsx': ['flow', 'lsp', '--from', './node_modules/.bin'],
  \ 'typescript': ['javascript-typescript-stdio'],
  \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  \ 'python': ['pyls']
  \ }

  let g:LanguageClient_rootMarkers = ['.flowconfig']
  " }}}

  " closetag {{{
  let g:closetag_html_style=1
  " }}}

  " rainbows {{{
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
  " }}}

  " Golang {{{
  let g:go_fmt_command = "goimports"
  " }}}

  " Emmet {{{
  "let g:user_emmet_mode='n'
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall
  " }}}

  " NERDTree {{{
  let NERDTreeShowHidden=1
  " }}}

  " terraform {{{
  let g:terraform_align=1
  " }}}

  " SuperTab {{{
  let g:SuperTabDefaultCompletionType = "context"
  let g:SuperTabCrMapping = 0
  " autocomple popup color
  highlight Pmenu guibg=brown gui=bold
  " }}}

  " UltiSnips {{{
  let g:UltiSnipsJumpForwardTrigger = "<c-j>"
  let g:UltiSnipsJumpBackwardTrigger  = "<c-k>"
  let g:UltiSnipsRemoveSelectModeMappings = 0
  let g:UltiSnipsExpandTrigger = '<C-b>'
  let g:UltiSnipsSnippetDirectories = ['snips']
  " }}}

  " lastplace {{{
  let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
  let g:lastplace_ignore_buftype = "quickfix,nofile,help"
  let g:lastplace_open_folds = 0
  " }}}

  " closetag {{{
  let g:closetag_html_style=1
  " }}}

  "gitgutter {{{
  let g:gitgutter_realtime = 0
  " }}}

  " rust {{{
  let g:autofmt_autosave = 1
  " }}}
" }}}

" Bindings {{{

" indent bindings
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" NERDTree
map <F8> :NERDTreeToggle<CR>
map <F10> :NERDTreeFind<CR>

" NERDCommenter
nmap <Leader>z <Plug>NERDCommenterToggle
vmap <Leader>z <Plug>NERDCommenterToggle
nnoremap <c-/> :NERDCommenterToggle
inoremap <c-/> :NERDCommenterToggle
vnoremap <c-/> :NERDCommenterToggle
nnoremap <c-_> <Plug>NERDCommenterToggle<CR>
inoremap <c-_> <Plug>NERDCommenterToggle<CR>
vnoremap <c-_> <Plug>NERDCommenterToggle<CR>
" nvim-completion-manager
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Thomas custom binding

nnoremap <silent> <leader>n :Explore<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>i :History<CR>

nnoremap <leader>v :call LanguageClient_textDocument_hover()<CR>
nnoremap <leader>d :call LanguageClient_textDocument_definition()<CR>
nnoremap <leader>r :call LanguageClient_textDocument_rename()<CR>

nnoremap <silent> <leader>c :call ToggleQfList()<CR>
nnoremap <silent> <leader>x :call ToggleLocList()<CR>

nnoremap <silent> [[ :call PrevListItem()<CR>
nnoremap <silent> ]] :call NextListItem()<CR>

" Custom bindings

vnoremap <silent><leader>f <Esc>:FZF -q <C-R>=GetVisualSelection()<CR>
nnoremap <silent><leader>f <Esc>:FZF -q <C-R>=expand("<cword>")<CR>

nnoremap <silent><leader>g <Esc>:Ag <C-R>=expand("<cword>")<CR>
vnoremap <silent><leader>g <Esc>:Ag <C-R>=GetVisualSelection()<CR>

nnoremap <silent><C-F> <Esc>:FZFMru<CR>
vnoremap <silent><C-F> <Esc>:FZFMru<CR>
inoremap <silent><C-F> <Esc>:FZFMru<CR>

nnoremap <silent><C-p> <Esc>:FZF<CR>
vnoremap <silent><C-p> <Esc>:FZF<CR>
inoremap <silent><C-p> <Esc>:FZF<CR>

nnoremap <silent><C-g> <Esc>:Ag<CR>
vnoremap <silent><C-g> <Esc>:Ag<CR>
inoremap <silent><C-g> <Esc>:Ag<CR>

imap <silent> <M-up> <C-O>:call MoveLines('-2')<CR>
imap <silent> <M-down> <C-O>:call MoveLines('+1')<CR>
nmap <silent> <M-up> :call MoveLines('-2')<CR>
nmap <silent> <M-down> :call MoveLines('+1')<CR>
vmap <silent> <M-up> :call MoveLines('-2')<CR>gv
vmap <silent> <M-down> :call MoveLines('+1')<CR>gv

map <leader>ss :setlocal spell!<cr>
map <leader>sv :vsplit<cr>
map <leader>sh :split<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t :tabnext<cr>
map <leader>1 1gt<cr>
map <leader>2 2gt<cr>
map <leader>3 3gt<cr>
map <leader>4 4gt<cr>
map <leader>5 5gt<cr>
map <leader>6 6gt<cr>
map <leader>7 7gt<cr>
map <leader>8 8gt<cr>
map <leader>9 9gt<cr>
map <leader>0 :tablast<cr>

map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" }}}
