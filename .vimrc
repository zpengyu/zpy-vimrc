set nocompatible  " We don't want vi compatibility.

" mapleader
let mapleader = ","

set hidden
set nowrap
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent
set shiftwidth=2                " number of spaces for autoindenting
set shiftround                  " nuse multiple of siftwidth when indenting with '<' and ':
set showmatch                   " show matching parens
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch                    " highlight search terms!
set incsearch                   " show search matches as you type
set colorcolumn=120
set relativenumber

" When searching, will wrap from bottom of buffer to top when 'nexting'
set wrapscan

" Use spaces instead of the actual tab char
set expandtab
set tabstop=2

" Show line numbers
set number

set history=1000
set undolevels=1000
set title
set nobackup
set noswapfile
set pastetoggle=<F2>
set relativenumber
nnoremap ; :

set ts=2
filetype on  " Automatically detect file types.
filetype plugin on
filetype indent on
let g:indent_guides_start_level=2

syntax enable
colorscheme bclear

" Meta+1-0 jumps to tab 1-10, Shift+Meta+1-0 jumps to tab 11-20:
let s:windowmapnr = 0
let s:wins='1234567890!@#$%^&*()'
while (s:windowmapnr < strlen(s:wins))
  exe 'noremap <silent> <D-' . s:wins[s:windowmapnr] . '> ' . (s:windowmapnr + 1) . 'gt'
  exe 'inoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-O>' . (s:windowmapnr + 1) . 'gt'
  exe 'cnoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
  exe 'vnoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
  let s:windowmapnr += 1
endwhile
unlet s:windowmapnr s:wins

"ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|reports|coverage|log)$',
  \ 'file': '\v\.(exe|so|dll|swp)$'
  \ }
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Show whitespace
set list listchars=tab:»·,trail:·
" Highlight trailing/leading whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" Show syntastic errors in location-list
let g:syntastic_auto_loc_list=1
let g:syntastic_auto_loc_list_height=3
let g:syntastic_mode_map={ 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html'] }


" Load up pathogen / plugins
call pathogen#infect()

" nerdtree
autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <c-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.o$', '\~$', '\.DS_Store']

set runtimepath^=~/.vim/bundle/ag.vim

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
