""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""plug.vim"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'tmhedberg/matchit'
Plug 'rizzatti/dash.vim'
""""颜色显示, 导致gd错误 ""
" Plug 'gorodinskiy/vim-coloresque'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 1
" Plug 'maxmellon/vim-jsx-pretty'
" let g:vim_jsx_pretty_colorful_config = 1
Plug 'mattn/emmet-vim'
imap <c-e> <c-y>,
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ap/vim-buftabline'
let g:buftabline_separators='|'
let g:buftabline_indicators='true'
set hidden
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_position = 'right'
let g:ctrlsf_winsize = '60%'
nmap <space>ff :CtrlSF<space>
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_dont_split = 'nerdtree'
nmap <space>pp <c-p>
nmap <space>jk <c-p>
nmap <space>;; <c-p>
Plug 'rking/ag.vim'
nmap <space>gg :Ag<space>
Plug 'jremmen/vim-ripgrep'
nmap <space>rr :Rg<space>
Plug 'Lokaltog/vim-easymotion'
"" default trigger <leader><leader>
nmap <space> <Plug>(easymotion-prefix)
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <space>/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> <space>? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> <space>g? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz;'
nmap s <Plug>(easymotion-s)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround' " gs ds
Plug 'tpope/vim-fugitive' " k
Plug 'tpope/vim-commentary' "gc
Plug 'tpope/vim-abolish' "cr snake_case, camelCase, MixedCase, -case
Plug 'airblade/vim-gitgutter'
let g:gitgutter_max_signs=3000
Plug 'junegunn/gv.vim'
Plug 'tommcdo/vim-exchange' " cx
" Plug 'suy/vim-context-commentstring'
Plug 'kshenoy/vim-signature'
Plug 'jiangmiao/auto-pairs'
Plug 'psychollama/further.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-startify'
highlight StartifyBracket ctermfg=240
highlight StartifyFooter  ctermfg=240
highlight StartifyHeader  ctermfg=114
highlight StartifyNumber  ctermfg=215
highlight StartifyPath    ctermfg=245
highlight StartifySlash   ctermfg=240
highlight StartifySpecial ctermfg=240
autocmd User Startified setlocal cursorline
set sessionoptions=blank,curdir,folds,help,tabpages,winpos
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   wincmd w
            \ | endif
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
let g:ale_linters = {'javascript': ['eslint'], 'css': ['csslint'], 'jsx': ['eslint'], 'tsx': ['eslint']}
" let g:ale_linters = {'javascript': ['eslint'], 'css': ['csslint'], 'jsx': ['stylelint', 'eslint']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\   'less': ['prettier', 'eslint'],
\   'scss': ['prettier', 'eslint'],
\   'jsx': ['prettier', 'eslint'],
\}

let g:ale_keep_list_window_open = 1
let g:ale_linter_aliases = {
\'jsx': ['css', 'javascript'],
\'tsx': ['css', 'javascript']
\}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none'
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_statusline_format = ['? %d', '? %d', '? OK']
let g:ale_echo_msg_error_str = '●'
let g:ale_echo_msg_warning_str = '.'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_enter = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'roman/golden-ratio'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "S",
    \ "Untracked" : "T",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "C",
    \ "Deleted"   : "x",
    \ "Dirty"     : "X",
    \ "Clean"     : "O",
    \ 'Ignored'   : "I",
    \ "Unknown"   : "?"
    \ }
let NERDTreeHijackNetrw = 1
Plug 'scrooloose/nerdtree'
let NERDTreeRespectWildIgnore=1
" let g:NERDTreeWinSize=30
set wildignore+=node_modules/*
" autocmd VimEnter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plug 'vim-scripts/vim-jsbeautify'
Plug 'vim-airline/vim-airline'
set scrolljump=3        " Scroll 3 lines at a time at bottom/top
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf = { 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'], 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'], 'operators': '_,_', 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'], 'separately': { '*': {}, 'tex': { 'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'], }, 'lisp': { 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], }, 'vim': { 'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'], }, 'html': { 'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'], }, 'css': 0, } }
Plug 'Yggdroot/indentLine'
"导致json文件引号丢失, 参考: https://github.com/Yggdroot/indentLine/issues/140最下作者的解决方案
let g:indentLine_char = '┊'
let g:indentLine_concealcursor='nc'
let g:indentLine_conceallevel = 2
let g:vim_json_syntax_conceal = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'zxqfl/tabnine-vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_use_ultisnips_completer = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
  \   'css,less,sass,scss' : ['-', 're!:\s*']
  \ }
let g:ycm_warning_symbol = "--"
let g:ycm_error_symbol = ">>"
let g:airline#extensions#ycm#enabled = 0
let g:airline#extensions#ycm#error_symbol = g:ycm_error_symbol
let g:airline#extensions#ycm#warning_symbol = g:ycm_warning_symbol
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsSnippetsDir = '~/.vim/plugged/vim-snippets/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-p>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsEditSplit="vertical"
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'liuchengxu/space-vim-dark'
Plug 'haishanh/night-owl.vim'
Plug 'joshdick/onedark.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tyrannicaltoucan/vim-quantum'
set tabstop=2
set softtabstop=2
set shiftwidth=2
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("termguicolors"))
   set termguicolors
endif
if has('gui_running')
  set background=dark
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  syntax on
  syntax enable
  " colorscheme night-owl
  " colorscheme onedark
  " colorscheme spacegray
  " colorscheme space-vim-dark
  let g:quantum_black=1
  let g:quantum_italics=1
  let g:airline_theme='quantum'
  colorscheme quantum
  colorscheme solarized
  colorscheme space-vim-dark
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  " set guifont=Dank\ Mono\ Regular:h18
  set guifont=Sauce\ Code\ Pro\ Medium\ Nerd\ Font\ Complete\ Mono:h16
  set cursorcolumn cursorline
else
  " colorscheme Brogrammer
" set guifont=Source\ Code\ Pro:h13
" set guifont=Sauce\ Code\ Pro\ Medium\ Nerd\ Font\ Complete\ Mono:h16
  " set guifont=Dank\ Mono\ Regular:h16
" set guifont=Dank\ Mono\ Italic:h18
" set macligatures
  let g:quantum_black=1
  let g:quantum_italics=1
  let g:airline_theme='quantum'
  colorscheme spacegray
  colorscheme solarized
  colorscheme quantum
  colorscheme space-vim-dark
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set cursorcolumn cursorline
endif

func! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc
syntax on
set cc=120
set guioptions-=r guioptions-=L
"setting below will disable set cursorline
" autocmd InsertLeave * se nocul
" autocmd InsertEnter * se cul
autocmd! bufwritepost ~/.vimrc source %
" set guicursor=i:ver120
set nocompatible
set cmdheight=1
set smarttab
set t_Co=256
set langmenu=none
"""""""""""""""""""""""""""""""""""""fold"""""""""""""""""""""""""""""""""""
set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=2
"  auto reload file when changed outside current vim
set autoread
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zO')<CR>
" if line("$")>200
" endif
set confirm
set mouse=a
set cindent autoindent smartindent
set hlsearch incsearch
set expandtab
set ignorecase
set number relativenumber
set history=50
set matchtime=5
set showmatch
set autowrite autoread
set wildmenu
set nowrap
set gdefault
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set statusline+=%F
set ruler
set laststatus=1
set showcmd magic
set nobackup noswapfile
set formatoptions+=j   " Delete comment character when joining commented lines
set completeopt=longest,menu
au BufRead,BufNewFile *.ts   setfiletype typescript
" if has("autocmd")
"     au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"                 \| exe "normal g'\"" | endif
" endif
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0
set title
""set scrolloff=8
set clipboard+=unnamed
set vb t_vb=
set ttyfast
set lazyredraw
let mapleader=","
map <c-j> <esc>
" nmap <tab> V>
" nmap <s-tab> V<
" noremap K kJ
noremap H ^
noremap L $
" noremap ; :
nnoremap Q :qa!<CR>
nnoremap <leader>x :x<CR>
nnoremap U <C-r>
nmap <tab> %
vmap <tab> %
if maparg('<C-L>', 'n') ==# '' | nnoremap <silent> <C-L> :nohlsearch<CR><C-L> | endif
nnoremap <space>h <c-w>h
nnoremap <space>j <c-w>j
nnoremap <space>k <c-w>k
nnoremap <space>l <c-w>l
nmap ; :
" nmap ;; za
nmap <leader>a A
nmap <leader>c :source ~/.vimrc<cr>
nmap <leader>d D
nmap <leader>e :e<space>
nmap <leader>g G
nmap <leader>i I
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>k :e ~/.vimrc<cr>
nmap <leader>o O
nmap <leader>q :q<cr>
nmap <leader>r R
" nmap <leader>s :Sexplore Vexplore Sex!
nmap <leader>s :sp<cr>
nmap <leader>x :x<cr>
nmap <leader>v :vs<cr>
nmap <leader>w :w<cr>
nmap <leader>z :e ~/Work<cr>
nmap gv `[v`]
nmap <space>== gg=G<cr>
nmap <space>w :w<cr>
nmap <space>q <c-v>
nmap <space>v V
nmap -- <C-W>=
cmap jj <esc>
vmap <leader>r :w !node<cr>
vmap <leader>s S
imap ;; <esc>
imap jj <esc>

if has("python")
python << EOF
import vim
import json
def FormatJSON(fmtlStart, fmtlEnd):
    fmtlStart = fmtlStart-1
    jsonStr = "\n".join(vim.current.buffer[fmtlStart:fmtlEnd])
    prettyJson = json.dumps(json.loads(jsonStr), sort_keys=True, indent=4, separators=(',', ': '), ensure_ascii=False)
    prettyJson = prettyJson.encode('utf8')
    vim.current.buffer[fmtlStart:fmtlEnd] = prettyJson.split(b'\n')
EOF
cabbr fjson FmtJSON
    com! -range -bar FmtJSON :python FormatJSON(<line1>, <line2>)
endif

cabbr fc %s/,/, /c<cr>
cabbr ft %s/\t/  /g<cr>
cabbr ff %s/function(/function (/g<cr>
cabbr ffor %s/for(/for (/g<cr>
cabbr fif %s/if(/if (/g<cr>
cabbr fel %s/else{/else {/g<cr>
cabbr flp %s/){/) {/g<cr>
cabbr cdph cd<space>%:p:h
cabbr dele %s/\s\+$//<cr>
cabbr dbl g/^$/d
cabbr ss 20 Sex!
set concealcursor=ic

syntax on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set listchars=eol:-,tab:>·,trail:~,extends:>,precedes:<,space:-
" set list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
