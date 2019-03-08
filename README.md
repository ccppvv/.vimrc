### Lifechanging plugins:
* file search
    * kien/ctrlp.vim

* file content search
    * dyng/ctrlsf.vim
    * rking/ag.vim
    * jremmen/vim-ripgrep

* jump
    * Lokaltog/vim-easymotion
    * haya14busa/incsearch.vim
    * haya14busa/incsearch-fuzzy.vim
```
function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction
```
<space> to trigger search
* json format
    * axiaoxin/vim-json-line-format
* Emmet
    * mattn/emmet-vim

* tpope series
    * tpope/vim-sensible
    * tpope/vim-scriptease
    * tpope/vim-repeat
    * tpope/vim-surround
    * tpope/vim-fugitive
    * tpope/vim-commentary
* git enhancement
    * airblade/vim-gitgutter
* easy exchange
    * tommcdo/vim-exchange
* auto pairs
    * jiangmiao/auto-pairs
* customize ur first met of vim
    * mhinz/vim-startify
* file explore
    * scrooloose/nerdtree
* beautify your status bar
    * vim-airline/vim-airline
* beautify your parentheses
    * luochen1990/rainbow
* clear indent
    * nathanaelkane/vim-indent-guides
* snippets
    * SirVer/ultisnips
    * honza/vim-snippets
* auto format and linters
    * prettier/vim-prettier
