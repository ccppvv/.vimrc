set runtimepath=~/.vim,/Applications/MacVim.app/Contents/Resources/vim/runtime

" set runtimepath=~/.vim, /Applications/MacVim.app/Contents/MacOS
" set runtimepath=~/.vim,/usr/local/Cellar/vim/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""plug.vim"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mbbill/fencview'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-emoji',
    \ 'coc-eslint',
    \ 'coc-explorer',
    \ 'coc-git',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-jest',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-marketplace',
    \ 'coc-fzf-preview',
    \ 'coc-pairs',
    \ 'coc-python',
    \ 'coc-sh',
    \ 'coc-tabnine',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-vimlsp',
    \ 'coc-word',
    \ 'coc-wxml',
    \ 'coc-xml',
    \ 'coc-yank',
    \ 'coc-yaml',
    \ 'coc-snippets',
    \ 'coc-prettier',
    \ 'coc-translator',
    \ ]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'rhysd/accelerated-jk' " jk提速
let g:accelerated_jk_acceleration_limit = 10
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
let g:accelerated_jk_acceleration_table = [2, 4, 4, 4]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/fzf.vim'
\ | Plug 'junegunn/fzf', { 'do': {-> fzf#install()} }
\ | Plug 'antoinemadec/coc-fzf',  {'branch': 'release'}
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*,!node_modules/*"'
let g:fzf_preview_window = ['right:33%', 'ctrl-/']
" Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
" Ag
command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --column --numbers --noheading --color --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
" GGrep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
" RG
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
nnoremap <space>rr :Rg<cr>
nnoremap <space>aa :Ag<space>
nnoremap <space>gg :GGrep<cr>
nnoremap <space>gf :Files<cr>
nnoremap <space>ff :GFiles<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'jremmen/vim-ripgrep'
" nmap <space>rr :Rg<space>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'dyng/ctrlsf.vim'
" let g:ctrlsf_position = 'right'
" let g:ctrlsf_winsize = '60%'
" nmap <space>ff :CtrlSF<space>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mattn/emmet-vim'
" let g:user_emmet_leader_key='<c-z>'
imap <c-e> <c-y>,
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'sakshamgupta05/vim-todo-highlight'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    Plug 'kyazdani42/nvim-web-devicons'
else
    Plug 'ryanoasis/vim-devicons'
endif
Plug 'wfxr/minimap.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
" Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'easymotion/vim-easymotion', {'on':
   \ [
   \ '<Plug>(easymotion-bd-f)', '<Plug>(easymotion-overwin-f)',
   \ '<Plug>(easymotion-overwin-f2)', '<Plug>(easymotion-bd-jk)',
   \ '<Plug>(easymotion-overwin-line)', '<Plug>(easymotion-bd-w)',
   \ '<Plug>(easymotion-overwin-w)', '<Plug>(easymotion-s)',
   \ ]}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'javascript']}
Plug 'ianks/vim-tsx'
Plug 'MaxMEllon/vim-jsx-pretty'   " JS and JSX syntax
let g:vim_jsx_pretty_highlight_close_tag = 1

Plug 'posva/vim-vue', {'for': ['vue']}
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-commentary' "gc
Plug 'tpope/vim-abolish' "crc crs cru
Plug 'tpope/vim-capslock'
Plug 'chemzqm/wxapp.vim', {'for':['wxml','wxss','js']}
Plug 'tommcdo/vim-exchange'
Plug 'kshenoy/vim-signature'
Plug 'psychollama/further.vim'
Plug 'azabiong/vim-highlighter', { 'branch': 'main' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" set syntax=javascript.jsx
au BufRead,BufNewFile *.jsx set filetype=javascript.jsx
let g:LanguageClient_serverCommands = {
    \ 'css': ['css-languageserver',  '--stdio'],
    \ 'less': ['css-languageserver',  '--stdio'],
    \ 'sass': ['css-languageserver',  '--stdio'],
    \ 'javascript': ['typescript-language-server',  '--stdio'],
    \ 'javascript.jsx': ['typescript-language-server',  '--stdio'],
    \ 'javascriptreact': ['typescript-language-server',  '--stdio'],
    \ 'typescript': ['typescript-language-server',  '--stdio'],
    \ 'typescript.tsx': ['typescript-language-server',  '--stdio'],
	\ }

" nnoremap <space>l :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <space>rn :call LanguageClient#textDocument_rename()<CR>
" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 这两个插件会导致tsx文件打开直接卡死
" Plug 'herringtondarkholme/yats.vim'
" Plug 'peitalin/vim-jsx-typescript'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive', {'on': ['Gwrite', 'Gcommit', 'Gread', 'Gdiff', 'Gblame', 'Gstatus', 'Glog']}
\ | Plug 'rbong/vim-flog'
\ | Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/YankRing.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nmap <space>pp <c-p>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'rking/ag.vim'
" nmap <space>gg :Ag<space>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ntpeters/vim-better-whitespace'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tmhedberg/matchit'
" Plug 'dense-analysis/ale'
" let g:ale_sign_warning = 'ϟ'
" let g:ale_sign_error = '✗'
" let g:ale_statusline_format = ['✗ %d', 'ϟ %d', '✔ OK']
" let g:ale_echo_msg_format = '[%severity% %linter%] -> %s'
" let g:ale_echo_msg_error_str = '✗'
" let g:ale_echo_msg_warning_str = 'ϟ'
" nmap gd :ALEGoToDefinition<cr>
" nmap gr :ALEFindReferences<cr>
" nmap K :ALEHover<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-surround'
" gs ds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-sensible'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-scriptease'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-repeat'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'jiangmiao/auto-pairs'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-commentary'
" gc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
" 总是匹配tag
Plug 'valloric/MatchTagAlways', {'for': ['html', 'css', 'xml']}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if has('nvim')
"     Plug 'norcalli/nvim-colorizer.lua'
" else
"     Plug 'RRethy/vim-hexokinase',  { 'do': 'make hexokinase' }
" endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-apathy'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'for': 'markdown' }
\ | Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/limelight.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'terryma/vim-smooth-scroll'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/vim-jsbeautify'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/undotree.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'honza/vim-snippets'
Plug 't9md/vim-choosewin',  { 'on': 'ChooseWin' }
Plug 'Yggdroot/indentLine'
Plug 'mg979/vim-visual-multi'
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'voldikss/vim-floaterm', {'on': ['FloatermNew', 'FloatermToggle']}
Plug 'vimwiki/vimwiki'
let g:vimwiki_path = $HOME . '/Documents/wiki/'
let g:vimwiki_list = [
        \ {
            \ 'path': g:vimwiki_path,
            \ 'path_html': g:vimwiki_path . 'wiki_html',
            \ 'syntax': 'markdown',
            \ 'auto_toc': 1,
            \ 'ext':'.md',
            \ 'auto_diary_index': 1,
        \ }
    \ ]

" 高亮checkbox
let g:vimwiki_hl_cb_checked = 2

" todo符号
let g:vimwiki_listsyms = '✗○◐●✓'

" 目录标题的等级
let g:vimwiki_toc_header_level = 2

" 快捷键
nmap <leader>ww <esc>:<c-u>VimwikiIndex<cr>
nmap <leader>wt <esc>:<c-u>VimwikiTabIndex<cr>
nmap <leader>wi <esc>:<c-u>VimwikiDiaryIndex<cr>

augroup vime_vimwiki_group
    autocmd!
    autocmd FileType wiki,md,markdown setl colorcolumn=0
    autocmd FileType wiki,md,markdown setl conceallevel=0
    autocmd FileType wiki,md,markdown setl textwidth=0

    " 避免g:vimwiki_hl_cb_checked设置为2的时候有问题
    au BufEnter *.wiki :syntax sync fromstart
augroup END
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug', 'vimwiki'], 'on': 'MarkdownPreview'}
Plug 'pseewald/vim-anyfold'
Plug 'iamcco/dict.vim', {'on':
    \ [
    \ '<Plug>DictSearch', '<Plug>DictVSearch', '<Plug>DictWSearch',
    \ '<Plug>DictWVSearch', '<Plug>DictRSearch', '<Plug>DictRVSearch'
    \ ]}
Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'}
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-eunuch', {'on': ['Mkdir', 'Rename', 'Unlink', 'Delete', 'Move', 'Chmod', 'Cfind', 'Clocate', 'Lfine', 'Llocate', 'SudoEdit', 'SudoWrite', 'Wall', 'W']}
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}
" Plug 'romgrk/barbar.nvim'
Plug 'yianwillis/vimcdoc'
" Plug 'majutsushi/tagbar'
" autocmd VimEnter * nested :call tagbar#autoopen(1)
" autocmd FileType c,cpp,js nested :TagbarOpen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" let g:UltiSnipsUsePythonVersion = 3
" let g:UltiSnipsSnippetsDir='~/.vim/plugged/vim-snippets/UltiSnips'
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-p>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf = { 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'], 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'], 'operators': '_,_', 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'], 'separately': { '*': {}, 'tex': { 'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'], }, 'lisp': { 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], }, 'vim': { 'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'], }, 'html': { 'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'], }, 'css': 0, } }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" function! IsNTOpen()
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction

" " calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNTOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction

" autocmd BufEnter * call SyncTree()

Plug 'Xuyuanp/nerdtree-git-plugin'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'heavenshell/vim-jsdoc'
Plug 'kkoomen/vim-doge', {'on': 'DogeGenerate'}
Plug 'rizzatti/dash.vim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ap/vim-buftabline'
Plug 'Shougo/denite.nvim'
" Plug 'ajmwagar/vim-deus'
" Plug 'Raimondi/delimitMate'
" Plug 'Shougo/neocomplete.vim'
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'aperezdc/vim-template'
" Plug 'kshenoy/vim-signature'
" Plug 'carlobaldassi/ConqueTerm'
" Plug 'vim-scripts/vim-colors-pencil'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'morhetz/gruvbox', { 'branch': 'main' }
Plug 'sainnhe/gruvbox-material', { 'branch': 'main' }
Plug 'sainnhe/forest-night'
Plug 'srcery-colors/srcery-vim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'spacevim/spacevim'
Plug 'sonph/onehalf'
Plug 'Rigellute/rigel'
Plug 'altercation/vim-colors-solarized'
Plug 'bluz71/vim-moonfly-colors'
Plug 'pineapplegiant/spaceduck'
Plug 'wadackel/vim-dogrun'
Plug 'overcache/NeoSolarized'
Plug 'vimwiki/vimwiki'
Plug 'raphamorim/lucario'
Plug 'elianiva/gruvy.nvim'
Plug 'lifepillar/vim-wwdc16-theme'
Plug 'bluz71/vim-nightfly-guicolors'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'matze/vim-move', {'on': [
            \ '<Plug>MoveBlockDown',
            \ '<Plug>MoveBlockUp',
            \ '<Plug>MoveBlockRight',
            \ '<Plug>MoveBlockLeft']}
Plug 'itchyny/lightline.vim'
" Plug 'vim-scripts/TaskList.vim'
" Plug 'justinmk/vim-sneak'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'terryma/vim-expand-region'
" Plug 'junegunn/vim-easy-align'
" " Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" " Multiple Plug commands can be written in a single line using | separators
" " On-demand loading
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" " Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }
" " Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" " Plugin outside ~/.vim/plugged with post-update hook
" " Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'
Plug 'mhinz/vim-startify'
let g:startify_padding_left = 10

let g:startify_files_number = 6
let g:startify_dir_number = 6
let startify_disable_at_vimenter = 0
" session
let g:startify_session_persistence = 1

" 打开buffer也显示startify
autocmd BufEnter *
     \ if !exists('t:startify_new_tab') && empty(expand('%')) && !exists('t:goyo_master') |
     \   let t:startify_new_tab = 1 |
     \   Startify |
     \ endif
autocmd VimEnter * Startify
" " Initialize plugin system
let g:python3_host_prog = '/usr/local/opt/python/libexec/bin/python' " -- Set python 3 provider
let g:python_host_prog = '/usr/local/bin/python' " -- Set python 3 provider
call plug#end()
func! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc
syntax on
filetype plugin indent on
" autocmd BufEnter * lcd %:p:h
set cc=120
set cursorcolumn cursorline
set guioptions-=r guioptions-=L
" set fu
" set nofu
" ""let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" "let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
"setting below will disable set cursorline
" autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
autocmd! bufwritepost ~/.vimrc source %
""set guicursor=i:ver100-iCursor
set guicursor=i:ver100
set nocompatible
set smarttab
set t_Co=256
set langmenu=none
"  auto reload file when changed outside current vim
set autoread
""space to toggle fold open or close
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zO')<CR>
"set foldmethod=indent
set foldmethod=manual
if line("$")>200
endif
"set foldmethod=marker
"set fdm=syntax
set confirm
set mouse=a
set cindent autoindent smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set number
set relativenumber
set history=50
set showmatch
set matchtime=5
set autowrite
set autoread
set wildmenu
set nowrap
set gdefault
""encodings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"80 per line
""h23=>vertival
""h18=>horizonal
set guifont=FiraCode\ Nerd\ Font:h16
" set guifont=Monaco:h20
" set ruler
" set laststatus=2
set showcmd magic
set nobackup noswapfile
set completeopt=longest,menu
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal g'\"" | endif
endif
"Disable event-handler attributes support:
let g:html5_event_handler_attributes_complete = 0
"Disable RDFa attributes support:
let g:html5_rdfa_attributes_complete = 0
"Disable microdata attributes support:
let g:html5_microdata_attributes_complete = 0
"Disable WAI-ARIA attribute support:
let g:html5_aria_attributes_complete = 0
""set title
""set scrolloff=8
set clipboard+=unnamed
"set no error bells
set vb t_vb=
let mapleader=","
" nmap <tab> V>
" nmap <s-tab> V<
nmap vw bve
nmap ; :
noremap H ^
noremap L $
nmap <tab> %
nmap <tab> %
vmap <tab> %
nmap <leader>a A
" nmap <leader>b <c-r>b
nmap <leader>c :source ~/.vimrc<cr>
nmap <leader>d D
nmap <leader>e :e<space>
""nmap <leader>f w<cr>
" nmap <leader>f :CocCommand explorer --preset floating<CR>
nmap <leader>f :CocCommand explorer<CR>
nmap <F2> :CocCommand explorer<CR>
""nmap <leader>k :e $VIM/vimrc<cr>
nmap <leader>kv :e ~/.vimrc<cr>
nmap <leader>ki :e ~/.config/nvim/init.vim<cr>
nmap <leader>kk :e ~/.config/nvim/config/keymap.vim<cr>
nmap <leader>kb :e ~/.config/nvim/config/base.vim<cr>
nmap <leader>kp :e ~/.config/nvim/config/layers/plugin_list.vim<cr>
nmap <leader>kl :e ~/.config/nvim/config/plugins<cr>
nmap <leader>kt :e ~/.config/nvim/config/theme/theme.vim<cr>
nmap q :q<cr>
nmap <leader>r R
nmap <leader>s :Sexplore<cr>
""nmap <leader>t :20 Sex!<cr>
" nmap <leader>tt :NERDTreeToggle<CR>
nmap <leader>tc :bw<CR>
nmap <leader>x :x<cr>
nmap <leader>v :vs<cr>
""nmap <leader>/ :Sex!<cr>
nmap <leader>w :w<cr>
nmap <leader>z :e ~/Interests<cr>
nmap <leader>1 !
nmap <leader>2 @
nmap <leader>3 #
nmap <leader>4 $
nmap <leader>5 %
nmap <leader>6 ^
nmap <leader>7 &
nmap <leader>8 *
nmap <leader>9 (
nmap <leader>0 )
nmap <leader>[ {
nmap <leader>] }
nmap gv `[v`]
nmap <C-l> :bn<CR>
nmap <C-h> :bp<CR>
nmap <C-o> <C-o>zz
nmap ; :
nmap <space>== gg=G<cr>
nmap <space>w :w<cr>
nmap <space>h <C-W>h
nmap <space>j <C-W>j
nmap <space>k <C-W>k
nmap <space>l <C-W>l
nmap <space>q <c-v>
nmap <space>v V
nmap snp set nopaste
nmap sps set paste
nmap -- <C-W>=
cmap jj <esc>
vmap <leader>a A
vmap <leader>i I
vmap <leader>g G
vmap <leader>s S
vmap <leader>u U
vmap <leader>1 !
vmap <leader>2 @
vmap <leader>3 #
vmap <leader>4 $
vmap <leader>5 %
vmap <leader>6 ^
vmap <leader>7 &
vmap <leader>8 *
vmap <leader>9 (
vmap <leader>0 )
vmap <leader>[ {
vmap <leader>] }
""vmap <leader>b :w !coffee -b %<cr>
""vmap <leader>c :w !coffee<cr>
""vmap <leader>p :w !coffee -p %<cr>
vmap <leader>r :w !node<cr>
imap ;; <esc>
imap jj <esc>
imap <C-h> <left>
imap <C-l> <right>
imap <C-j> <C-o>gj
imap <C-k> <C-o>gk
imap <C-j> <esc>ja
imap <C-k> <esc>ka
cabbr fjson %!python -m json.tool
cabbr fc %s/,/, /c<cr>
cabbr ft %s/\t/    /g<cr>
cabbr ff %s/function(/function (/g<cr>
cabbr ffor %s/for(/for (/g<cr>
cabbr fif %s/if(/if (/g<cr>
cabbr fel %s/else{/else {/g<cr>
cabbr flp %s/){/) {/g<cr>
cabbr cdph cd<space>%:p:h
cabbr dele %s/\s\+$//<cr>
cabbr dbl g/^$/d
cabbr ss 20 Sex!
cabbr tn tabn
cabbr tp tabp
cabbr tan tabnew
":smap - Display select mode maps
":xmap - Display visual mode maps
":omap - Display operator pending mode maps
syntax on
""colorscheme zenburn
" colorscheme combat256
" colorscheme cobalt2
"true color for colorscheme one"
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif
set background=dark
let g:one_allow_italics = 1
" let g:airline_theme='one'
" colorscheme gruvbox-material
" colorscheme material
" colorscheme dracula
" colorscheme cobalt
colorscheme macvim
" colorscheme NeoSolarized
" colorscheme dogrun
" colorscheme spacevim
" colorscheme rigel
" set term=builtin_ansi
" colorscheme spacemacs-theme
" colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""COC SETTINGS""""""""""""""""""""""""""""""""""""""""""""
" vimrc所在根目录
let g:vim_root_path = fnamemodify($MYVIMRC, ':h') . '/'
" 配置所在根目录
let g:config_root_path = g:vim_root_path . 'config/'
" 插件配置所在目录
let g:other_config_root_path = g:config_root_path . "other/"

" vim插件、缓存等数据根目录
let g:cache_root_path = $HOME . '/.cache/vim/'
" vim 插件安装目录
let g:plugins_install_path = g:cache_root_path . 'plugins/'
" session 保存目录
let g:session_dir = g:cache_root_path . 'sessions/'
" 撤销记录目录
let g:undo_dir = g:cache_root_path . 'undo/'

let g:os = systemlist('uname -s')[0]
let g:arch = systemlist('uname -m')[0]

" 脚本目录
let g:scripts_root_path = g:vim_root_path . "/scripts/"

" wiki笔记根目录
let g:vimwiki_path = $HOME . '/Documents/wiki/'

" 卸载不在列表中的插件
function! s:uninstall_unused_coc_extensions() abort
    if has_key(g:, 'coc_global_extensions')
        for e in keys(json_decode(join(readfile(expand(g:coc_data_home . '/extensions/package.json')), "\n"))['dependencies'])
            if index(g:coc_global_extensions, e) < 0
                execute 'CocUninstall ' . e
            endif
        endfor
    endif
endfunction
autocmd User CocNvimInit call s:uninstall_unused_coc_extensions()

" 检查当前光标前面是不是空白字符
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" tab触发补全或者选择下一个补全
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<c-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

" shift tab 选择上一个补全
inoremap <silent><expr> <S-TAB>
    \ pumvisible() ? "\<C-p>" :
    \ "\<C-h>"

" alt j选择下一个补全
inoremap <silent><expr> <m-j>
    \ pumvisible() ? "\<C-n>" : "\<C-R>=coc#rpc#request('snippetNext', [])\<cr>"
    " \ pumvisible() ? "\<C-n>" : return

" " alt k选择上一个补全
inoremap <silent><expr> <m-k>
    \ pumvisible() ? "\<C-p>" : "\<C-R>=coc#rpc#request('snippetPrev', [])\<cr>"
    " \ pumvisible() ? "\<C-p>" : return

" down 选择下一个补全
inoremap <silent><expr> <down>
    \ pumvisible() ? "\<C-n>" : "\<down>"

" up 选择上一个补全
inoremap <silent><expr> <up>
    \ pumvisible() ? "\<C-p>" : "\<up>"

" 回车选中或者扩展选中的补全内容
if exists('*complete_info')
    " 如果您的(Neo)Vim版本支持，则使用`complete_info`
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" diagnostic 跳转
nmap <silent> <M-j> <Plug>(coc-diagnostic-next)
nmap <silent> <M-k> <Plug>(coc-diagnostic-prev)

" 跳转到定义
nmap <silent> gd <Plug>(coc-definition)
" 跳转到类型定义
nmap <silent> gy <plug>(coc-type-definition)
" 跳转到实现
nmap <silent> gi <plug>(coc-implementation)
" 跳转到引用
nmap <silent> gr <plug>(coc-references)
" 重构refactor,需要lsp支持
nmap <silent> <space>rf <Plug>(coc-refactor)
" 修复代码
nmap <silent> <space>f  <Plug>(coc-fix-current)
" 变量重命名
nmap <silent> <space>rn <Plug>(coc-rename)

" 使用K悬浮显示定义
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
" 函数文档
nnoremap <silent> K :call <SID>show_documentation()<CR>
" 函数参数的文档
" nnoremap <silent> <space>k :call CocActionAsync('showSignatureHelp')<CR>
" au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

    nnoremap <silent> <space>A  :<C-u>CocFzfList diagnostics<CR>
    nnoremap <silent> <space>a  :<C-u>CocFzfList diagnostics --current-buf<CR>
    nnoremap <silent> <space>c  :<C-u>CocFzfList commands<CR>
    nnoremap <silent> <space>e  :<C-u>CocFzfList extensions<CR>
    " nnoremap <silent> <space>f :<C-u>CocFzfList<CR>
    " nnoremap <silent> <space>l  :<C-u>CocFzfList location<CR>
    nnoremap <silent> <space>o  :<C-u>CocFzfList outline<CR>
    nnoremap <silent> <space>O  :<C-u>CocFzfList symbols<CR>
    " nnoremap <silent> <space>s  :<C-u>CocFzfList services<CR>
    nnoremap <silent> <space>p  :<C-u>CocFzfListResume<CR>

    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    nnoremap <silent> <space>o  :<C-u>CocList --auto-preview outline<cr>
    nnoremap <silent> <space>O  :<C-u>CocList --auto-preview --interactive symbols<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
    " nnoremap <silent> <space>s  :<C-u>CocList services<CR>
    " show coclist 早晚要放进去的
    " nnoremap <silent> <space>f  :<C-u>CocList<CR>

" function! s:lc_coc_highlight() abort
"     " 取消csv的高亮
"     call coc#config("highlight.disableLanguages", ["csv"])
"     " 高亮当前光标下的所有单词
"     au CursorHold * silent call CocActionAsync('highlight')
" endfunction

function! s:lc_coc_lists() abort
    " session
    call coc#config('session.directory', g:session_dir)

    call coc#config('list.maxHeight', 10)
    call coc#config('list.maxPreviewHeight', 8)
    call coc#config('list.autoResize', v:false)
    call coc#config('list.disabledLists', ['node_modules'])
    call coc#config('list.source.grep.command', 'rg')
    call coc#config('list.source.grep.defaultArgs', [
                \ '--column',
                \ '--line-number',
                \ '--no-heading',
                \ '--color=always',
                \ '--smart-case'
            \ ])
    call coc#config('list.source.lines.defaultArgs', ['-e'])
    call coc#config('list.source.words.defaultArgs', ['-e'])
    call coc#config('list.source.files.command', 'rg')
    call coc#config('list.source.files.args', ['--files'])
    call coc#config('list.source.files.excludePatterns', ['.git', 'node_modules', '**/.git/**', "**/node_modules/**", "**/node_modules/**/.*", "**/node_modules/**/.*/**"])

    " 有这三个插件就用这三个插件
    " 那么快捷键不调用coc-lists
    " if common#functions#HasPlug('fzf.vim')
    "     \ || common#functions#HasPlug('LeaderF')
    "     \ || common#functions#HasPlug('vim-clap')
    "     \ || common#functions#HasPlug('fzf-preview.vim')
    "     \ || common#functions#HasCocPlug('coc-fzf-preview')
    "     return
    " endif

    function! s:cocListFilesWithWiki(query)
        if empty(a:query) && &ft ==? 'vimwiki'
            exec "CocList --no-sort files " . g:vimwiki_path
        else
            exec "CocList --no-sort files " . a:query
        endif
    endfunction

    nnoremap <silent> <M-f> :call <SID>cocListFilesWithWiki("")<CR>
    nnoremap <silent> <M-F> :call <SID>cocListFilesWithWiki($HOME)<CR>
    nnoremap <silent> <space>bb :CocList buffers<CR>
    nnoremap <silent> <M-c> :CocList vimcommands<CR>
    " tags, 需要先generate tags
    nnoremap <silent> <M-t> :CocList tags<cr>
    nnoremap <silent> <M-s> :CocList --auto-preview --interactive grep<cr>
    nnoremap <silent> ? :CocList --auto-preview --interactive lines<cr>
    nnoremap <silent> <M-r> :CocList mru -A<CR>
    nnoremap <silent> <M-m> :CocList marks<CR>
    nnoremap <silent> <M-M> :CocList maps<CR>
    nnoremap <silent> <M-w> :CocList windows<CR>
    nnoremap <silent> <M-y> :CocList yank<CR>
    nnoremap <silent> <F8> :CocList locationlist<CR>
    nnoremap <silent> <F9> :CocList quickfix<CR>
endfunction

function! s:lc_coc_yank() abort
    call coc#config('yank.highlight.duration', 200)
    call coc#config('yank.enableCompletion', v:false)
    nnoremap <silent> <space>yy  :<C-u>CocList yank<cr>
endfunction

function! s:lc_coc_translator() abort
    nmap  <leader>e <Plug>(coc-translator-e)
    nmap  <leader>d <Plug>(coc-translator-p)
endfunction

function! s:lc_coc_todolist() abort
    nmap <silent> <space>tl :<C-u>CocList todolist<cr>
    nmap <silent> <space>ta :<C-u>CocCommand todolist.create<cr>
endfunction

function! s:lc_coc_clangd() abort
    call coc#config('clangd.semanticHighlighting', v:true)
endfunction

function! s:lc_coc_kite() abort
    call coc#config('kite.pollingInterval', 1000)
endfunction

function! s:lc_coc_xml() abort
    call coc#config('xml.java.home', '/usr/lib/jvm/default/')
endfunction

function! s:lc_coc_prettier() abort
    call coc#config('prettier.tabWidth', 2)
    call coc#config('prettier.singleQuote', v:true)
    call coc#config('prettier.trailingComma', v:true)
    "coc.preferences.formatOnSaveFiletypes": 
endfunction

function! s:lc_coc_git() abort
    call coc#config('git.addGBlameToBufferVar', v:true)
    call coc#config('git.addGBlameToVirtualText', v:true)
    call coc#config('git.virtualTextPrefix', '  ➤  ')
    call coc#config('git.addedSign.hlGroup', 'GitGutterAdd')
    call coc#config('git.changedSign.hlGroup', 'GitGutterChange')
    call coc#config('git.removedSign.hlGroup', 'GitGutterDelete')
    call coc#config('git.topRemovedSign.hlGroup', 'GitGutterDelete')
    call coc#config('git.changeRemovedSign.hlGroup', 'GitGutterChangeDelete')
    call coc#config('git.addedSign.text', '▎')
    call coc#config('git.changedSign.text', '▎')
    call coc#config('git.removedSign.text', '▎')
    call coc#config('git.topRemovedSign.text', '▔')
    call coc#config('git.changeRemovedSign.text', '▋')

    " 导航到修改块
    nmap <leader>gk <Plug>(coc-git-prevchunk)
    nmap <leader>gj <Plug>(coc-git-nextchunk)
    " 显示光标处的修改信息
    nnoremap <silent> <leader>gp <esc>:CocCommand git.chunkInfo<cr>
    " 撤销当前块的修改
    nnoremap <silent> <leader>gu <esc>:CocCommand git.chunkUndo<cr>
    nnoremap <silent> <leader>gh <esc>:CocCommand git.chunkStage<cr>
endfunction

function! s:lc_coc_snippets() abort
    call coc#config("snippets.ultisnips.enable", v:true)
    call coc#config("snippets.ultisnips.directories", [
                \ g:other_config_root_path . '/UltiSnips',
            \ ])
    call coc#config("snippets.extends", {
                \ 'cpp': ['c', 'cpp'],
                \ 'typescript': ['javascript']
            \ })
endfunction

function! s:lc_coc_python() abort
    call coc#config("python.jediEnabled", v:true)
    call coc#config("python.linting.enabled", v:true)
    call coc#config("python.linting.pylintEnabled", v:true)
endfunction

function! s:lc_coc_ci() abort
    nmap <silent> w <Plug>(coc-ci-w)
    nmap <silent> b <Plug>(coc-ci-b)
endfunction

function! s:lc_coc_rainbow_fart() abort
    call coc#config("rainbow-fart.ffplay", "ffplay")
endfunction

function! s:lc_coc_fzf_preview() abort
    " if common#functions#HasPlug('fzf.vim')
    "     \ || common#functions#HasPlug('LeaderF')
    "     \ || common#functions#HasPlug('vim-clap')
    "     \ || common#functions#HasPlug('fzf-preview.vim')
    "     return
    " endif

    " TODO 重新写定义
    " 行为要一致
    function s:cocFzfPreviewWithWiki(query) abort
        if empty(a:query) && &ft ==? 'vimwiki'
            exec "CocCommand fzf-preview.DirectoryFiles " . g:vimwiki_path
        else
            exec "CocCommand fzf-preview.DirectoryFiles " . a:query
        endif
    endfunction
    nnoremap <silent> <M-f> :call <SID>cocFzfPreviewWithWiki("")<CR>
    nnoremap <silent> <M-F> :call <SID>cocFzfPreviewWithWiki($HOME)<CR>
    nnoremap <silent> <space>ba :<c-u>CocCommand fzf-preview.AllBuffers<CR>
    nnoremap <silent> <M-c> :<c-u>CocCommand fzf-preview.CommandPalette<CR>
    nnoremap <silent> <M-C> :<c-u>CocCommand fzf-preview.Changes<CR>
    " tags, 需要先generate tags
    nnoremap <silent> <M-t> :<c-u>CocCommand fzf-preview.BufferTags<cr>
    nnoremap <silent> <M-T> :<c-u>CocCommand fzf-preview.Ctags<cr>
    nnoremap <silent> <M-s> :<c-u>CocCommand fzf-preview.ProjectGrep<cr>
    nnoremap <silent> ? :<c-u>CocCommand fzf-preview.Lines<cr>
    nnoremap <silent> <M-r> :<c-u>CocCommand fzf-preview.MruFiles<CR>
    nnoremap <silent> <M-m> :CocCommand fzf-preview.Marks<CR>
    " nnoremap <silent> <M-M> :CocList maps<CR>
    nnoremap <silent> <M-y> :<c-u>CocCommand fzf-preview.Yankround<CR>
    nnoremap <silent> <M-J> :<c-u>CocCommand fzf-preview.Jumps<CR>

    nnoremap <silent> <F8> :<c-u>CocCommand fzf-preview.QuickFix<CR>
    nnoremap <silent> <F9> :<c-u>CocCommand fzf-preview.LocationList<CR>
endfunction

function! s:lc_coc_explorer() abort
    " if common#functions#HasPlug('nvim-tree.lua') | return | endif
    let g:coc_explorer_global_presets = {
        \   'cocConfig': {
        \      'root-uri': '~/.config/coc',
        \   },
        \   'tab': {
        \     'position': 'tab',
        \     'quit-on-open': v:true,
        \   },
        \   'floating': {
        \      'position': 'floating',
        \      'floating-position': 'center',
        \      'floating-width': 100,
        \      'open-action-strategy': 'sourceWindow',
        \      'file-child-template': '[git | 2] [selection | clip | 1]
                    \ [indent] [icon | 1] [diagnosticError & 1]
                    \ [filename omitCenter 1][modified][readonly]
                    \ [linkIcon & 1][link growRight 1] [timeCreated | 8] [size]'
        \   },
        \   'floatingTop': {
        \     'position': 'floating',
        \     'floating-position': 'center-top',
        \     'open-action-strategy': 'sourceWindow',
        \   },
        \   'floatingLeftSide': {
        \      'position': 'floating',
        \      'floating-position': 'left-center',
        \      'floating-width': 100,
        \      'open-action-strategy': 'sourceWindow',
        \   },
        \   'floatingRightSide': {
        \      'position': 'floating',
        \      'floating-position': 'right-center',
        \      'floating-width': 100,
        \      'open-action-strategy': 'sourceWindow',
        \   },
        \   'simplify': {
        \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
        \   },
        \   'buffer': {
        \     'sources': [{'name': 'buffer', 'expand': v:true}]
        \   },
    \ }
    " \   '.vim': {
    " \      'root-uri': g:vim_root_path,
    " \   },

    " Use preset argument to open it
    " nmap <space>rd :CocCommand explorer --preset .vim<CR>
    nmap <F2> :CocCommand explorer<CR>
    augroup vime_coc_explorer_group
        autocmd!
        " autocmd WinEnter * if &filetype == 'coc-explorer' && winnr('$') == 1 | q | endif autocmd TabLeave * if &filetype == 'coc-explorer' | wincmd w | endif augroup END

    " config
    call coc#config("explorer.icon.enableNerdfont", v:true)
    call coc#config("explorer.contentWidthType", "win-width")
    call coc#config("explorer.bookmark.child.template", "[selection | 1] [filename] [position] - [annotation]")
    call coc#config("explorer.file.column.icon.modified", "•")
    call coc#config("explorer.file.column.icon.deleted", "✗")
    call coc#config("explorer.file.column.icon.untracked", "★")
    call coc#config("explorer.file.column.icon.renamed", "➜")
    call coc#config("explorer.file.column.icon.unmerged", "")
    call coc#config("explorer.file.column.icon.ignored", "ⁱ")
    call coc#config("explorer.keyMappings.global", {
                \ 's': v:false,
                \ 't': v:false,
                \ 'E': v:false,
                \ 'e': v:false,
                \ 'zh': v:false,
                \ 'g.': v:false,
                \ 'p': v:false,
    \ })
    call coc#config("explorer.keyMappings.global", {
      \ 'k': 'nodePrev',
      \ 'j': 'nodeNext',
      \ 'h': ["wait", 'collapse'],
      \ 'l': ["wait", 'expandable?', 'expand', 'open'],
      \ 'L': ["wait", 'expand:recursive'],
      \ 'H': ["wait", 'collapse:recursive'],
      \ 'K': ["wait", 'expandablePrev'],
      \ 'J': ["wait", 'expandableNext'],
      \ 'o': ["wait", 'expanded?', 'collapse', 'expand'],
      \ '<cr>': ["wait", 'expandable?', 'cd', 'open'],
      \ '<bs>': ["wait", 'gotoParent'],
      \ 'r': 'refresh',
      \
      \ 's': ["wait", 'toggleSelection', 'normal:j'],
      \ 'S': ["wait", 'toggleSelection', 'normal:k'],
      \ '*': ["wait", 'toggleSelection'],
      \ 'gs': ["wait", "reveal:select"],
      \ '<dot>': 'toggleHidden',
      \
      \ '<c-s>': 'open:split',
      \ '<c-v>': 'open:vsplit',
      \ '<c-t>': 'open:tab',
      \
      \ 'dd': 'cutFile',
      \ 'Y': 'copyFile',
      \ 'D': 'delete',
      \ 'P': 'pasteFile',
      \ 'R': 'rename',
      \ 'N': 'addFile',
      \ 'yp': 'copyFilepath',
      \ 'yn': 'copyFilename',
      \
      \ 'pl': 'previewOnHover:toggle:labeling',
      \ 'pc': 'previewOnHover:toggle:content',
      \
      \ '<M-x>': 'systemExecute',
      \ 'f': 'search',
      \ 'F': 'searchRecursive',
      \
      \ '<tab>': 'actionMenu',
      \ '?': 'help',
      \ 'q': 'quit',
      \ '<esc>': 'esc',
      \
      \ 'gf': 'gotoSource:file',
      \ 'gb': 'gotoSource:buffer',
      \ '[[': ["wait", 'indentPrev'],
      \ ']]': ["wait", 'indentNext'],
      \
      \ '<M-k>': ["wait", 'markPrev:diagnosticError'],
      \ '<M-j>': ["wait", 'markNext:diagnosticError'],
      \
      \ '<leader>gk': ["wait", 'markPrev:git'],
      \ '<leader>gj': ["wait", 'markNext:git'],
      \ '<leader>gh': 'gitStage',
      \ '<leader>gu': 'gitUnstage'
    \ })
endfunction

function! s:tmp() abort
endfunction

" 遍历coc插件列表，载入插件配置
let s:coc_config_functions = {
            \ 'coc-lists': function('<SID>lc_coc_lists'),
            \ 'coc-yank': function('<SID>lc_coc_yank'),
            \ 'coc-translator': function('<SID>lc_coc_translator'),
            \ 'coc-todolist': function('<SID>lc_coc_todolist'),
            \ 'coc-clangd': function('<SID>lc_coc_clangd'),
            \ 'coc-kite': function('<SID>lc_coc_kite'),
            \ 'coc-xml': function('<SID>lc_coc_xml'),
            \ 'coc-prettier': function('<SID>lc_coc_prettier'),
            \ 'coc-git': function('<SID>lc_coc_git'),
            \ 'coc-snippets': function('<SID>lc_coc_snippets'),
            \ 'coc-python': function('<SID>lc_coc_python'),
            \ 'coc-rainbow-fart': function('<SID>lc_coc_rainbow_fart'),
            \ 'coc-explorer': function('<SID>lc_coc_explorer'),
            \ 'coc-ci': function('<SID>lc_coc_ci'),
            \ 'coc-fzf-preview': function('<SID>lc_coc_fzf_preview'),
            \ }
            " \ 'coc-highlight': function('<SID>lc_coc_highlight'),

" 调用插件的配置函数
if has_key(g:, 'coc_global_extensions')
    for extension in g:coc_global_extensions
        call get(s:coc_config_functions, extension, function('<SID>tmp'))()
    endfor
endif
