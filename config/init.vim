"dein -------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/root/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/root/.cache/dein')
  call dein#begin('/root/.cache/dein')

  " TOML ファイルのパスを変数に代入
  let s:nvim_dir = '/root/.config/nvim'
  let s:toml = s:nvim_dir . '/toml/dein.toml'
  let s:lazy_toml = s:nvim_dir . '/toml/dein_lazy.toml'

  " TOML ファイルを読み込む
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" Required:
filetype plugin indent on
syntax enable

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}
"dein -------------------------

"visual -------------------------
set fenc=utf-8
set backspace=indent,eol,start
set number
set expandtab
set tabstop=2
set shiftwidth=2
colorscheme molokai
"visual -------------------------

"key binds -------------------------
noremap <silent><C-e> :CocCommand explorer<CR>
nnoremap <silent> <Leader>m :OverCommandLine<CR>
"key binds -------------------------

"They are window layouts. They will be executed with starting nvim.
autocmd VimEnter * execute 'syntax on'
autocmd VimEnter * execute 'sp | terminal'
autocmd VimEnter * call feedkeys("\<CR>", "n")
autocmd VimEnter * call feedkeys("\<C-w>x", "n")
autocmd VimEnter * execute 'CocCommand explorer'
autocmd VimResized * wincmd =
