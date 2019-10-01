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

function! OuicarInsertPath()
  let p = split(expand('%:p:h'), '/')
  if (index(p, 'src') >= 0)
    let src = index(p, 'app')
    let c = ["ouicar"] + p[src+1:]
    return join(c, '/')
  endif
endfunction

function! InsertBeforeCursor(c)
  execute 'normal! i'.a:c
endfunction


function! InsertAfterCursor(c)
  execute 'normal! a'.a:c
endfunction

function! InsertEndOfLine(c)
  let save_pos = getpos(".")
  execute 'normal! A'.a:c
  call setpos('.', save_pos)
endfunction

" }}}

" Config {{{
set termguicolors
set backspace=indent,eol,start
set breakindent
set clipboard+=unnamedplus,unnamed
"set completeopt+=menu
set completeopt=noinsert,menuone,noselect
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
autocmd FileType vim,zsh,i3config,dosini,conf setlocal foldmethod=marker
" }}}

" Plugin {{{
call plug#begin('~/.config/nvim/plugged')

" Completion {{{
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ncm2/ncm2-vim-lsp'

Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'

Plug 'davidhalter/jedi'
Plug 'ncm2/ncm2-jedi'

"Plug 'felixfbecker/php-language-server', {'do': 'composer install && composer run-script parse-stubs'}

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
" }}}

" Themes {{{
"Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
"Plug 'ryanoasis/vim-devicons'
"Plug 'pawndev/colour-schemes', {'rtp': 'vim'}
"Plug 'tyrannicaltoucan/vim-quantum'
"Plug 'tyrannicaltoucan/vim-deep-space'
"Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
" }}}

" Utilities {{{
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'dietsche/vim-lastplace'
"Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'stevearc/vim-arduino'
Plug 'simnalamburt/vim-mundo'
Plug 'pawndev/mpc.vim'
Plug 'Timoses/vim-venu'
Plug 'chrisbra/Colorizer'
Plug 'lifepillar/pgsql.vim'
" to configure vim-venu
" install and config https://github.com/vimwiki/vimwiki
"
"Plug 'mbbill/undotree'
"Plug 'sjl/gundo.vim'
"Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" }}}

call plug#end()
" }}}

" Theme {{{
"
" vim one {{{
colorscheme one
let g:airline_theme='one'
set background=dark
let g:one_allow_italics = 1
" }}}
"
" vim quantum {{{
"set background=light
"set termguicolors
"colorscheme quantum
"let g:airline_theme='quantum'
"let g:lightline = {
      "\ 'colorscheme': 'quantum',
      "\ }
" }}}
"
" vim deep-space {{{
"set background=dark
"set termguicolors
"colorscheme deep-space
"let g:deepspace_italics=1
"let g:airline_theme='deep_space'
"let g:lightline = {
      "\ 'colorscheme': 'deepspace',
      "\ }
" }}}
"
" Earthsong {{{
"colorscheme earthsong
"color earthsong
" }}}
"
" Ayu {{{
"set termguicolors
"let ayucolor="light"
"let ayucolor="mirage"
"let ayucolor="dark"
"colorscheme ayu
" }}}
" }}}

" PluginConfig {{{

  " ncm2 {{{
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " }}}

  " vim-lsp {{{
  let g:lsp_signs_enabled = 1
  let g:lsp_diagnostics_echo_cursor = 1
  " }}}

  " ale {{{

  let g:ale_sign_error = 'E>'
  let g:ale_sign_warning = 'W>'

  let g:ale_pattern_options = {
    \'.*node_modules/.*$': {'ale_enabled': 0},
  \}


  let g:ale_fixers = {
    \'typescript': ['tslint', 'eslint']
  \}

  "let g:ale_fixers = {
    "\'javascript': ['prettier', 'eslint'],
    "\'javascript.jsx': ['prettier', 'eslint'],
  "\}

  "let g:ale_linters = {
    "\'javascript': ['prettier', 'eslint', 'flow'],
    "\'javascript.jsx': ['prettier', 'eslint', 'flow'],
  "\}
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

  " terraform {{{
  let g:terraform_align=1
  " }}}

  " SuperTab {{{
  "let g:SuperTabDefaultCompletionType = "context"
  "let g:SuperTabCrMapping = 0
  " autocomple popup color
  highlight Pmenu guibg=brown gui=bold
  " }}}

  " UltiSnips {{{
  let g:UltiSnipsJumpForwardTrigger = "<c-j>"
  let g:UltiSnipsJumpBackwardTrigger  = "<c-k>"
  "let g:UltiSnipsRemoveSelectModeMappings = 0
  let g:UltiSnipsSnippetDirectories = ['snips']
  let g:UltiSnipsEditSplit="vertical"
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
  " rustup component add rls-preview rust-analysis rust-src
  if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'Cargo.toml'))},
        \ 'whitelist': ['rust'],
        \ })
  endif
  " }}}

  " vim-venu {{{

  " }}}

  " javascript {{{
  " FLOW
  " npm install -g flow-bin
  " npm install -g flow-language-server

  if executable('flow-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'flow-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'flow-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
        \ 'whitelist': ['javascript', 'javascript.jsx'],
        \ })
  endif
  "
  " Typescript
  "if executable('typescript-language-server')
      "au User lsp_setup call lsp#register_server({
        "\ 'name': 'typescript-language-server',
        "\ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        "\ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
        "\ 'whitelist': ['typescript', 'javascript', 'javascript.jsx']
        "\ })
  "endif
  " }}}

  " php {{{
  au User lsp_setup call lsp#register_server({
     \ 'name': 'php-language-server',
     \ 'cmd': {server_info->['php', expand('~/.config/nvim/plugged/php-language-server/bin/php-language-server.php')]},
     \ 'whitelist': ['php'],
   \ })
  " }}}

  " typescript {{{
  " npm install -g typescript typescript-language-server
  if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript'],
        \ })
  endif
  " }}}

  " CSS {{{
  " npm install -g vscode-css-languageserver-bin
  if executable('css-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
  endif
  " }}}

" }}}

" Bindings {{{

" indent bindings
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

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
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Thomas custom binding

nnoremap <silent> <leader>n :Explore<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>i :History<CR>

nnoremap <silent> <leader>c :call ToggleQfList()<CR>
nnoremap <silent> <leader>x :call ToggleLocList()<CR>

nnoremap <silent> [[ :call PrevListItem()<CR>
nnoremap <silent> ]] :call NextListItem()<CR>

" Custom bindings
nnoremap <esc><esc> :noh<return>

nnoremap <silent> <leader>; :call InsertEndOfLine(";")<CR>

" Ouicar custom bindings
nnoremap <silent> <leader>o :call InsertBeforeCursor(OuicarInsertPath())<CR>
nnoremap <silent> <leader>O :call InsertAfterCursor(OuicarInsertPath())<CR>

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
