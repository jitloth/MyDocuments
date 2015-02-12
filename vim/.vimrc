autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set commentstring=#\ %s

set nocompatible

set syntax=on

set autoindent
set cindent

set tabstop=4
set expandtab

set nobackup

set softtabstop=4
set shiftwidth=4

set number

set cmdheight=1
set laststatus=2
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set showcmd

set ruler

set path=.,,/usr/include/**

filetype on

set showmatch

set smartindent

"set nowrap
set linebreak

set incsearch
set hlsearch

set mouse=a
set selection=exclusive
set selectmode=mouse,key

set t_Co=256
colorscheme molokai

set foldenable
set foldmethod=indent
set foldlevel=1
set foldlevelstart=99
nnoremap <space> za

let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Open = 1
let Tlist_Process_File_Always = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_WinWidth = 40

noremap <F2> :call TrimWhiteSpace()<CR>
function TrimWhiteSpace()
	:%s/\s\+$//e
	:"
endfunc

inoremap ( ()<esc>i
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap { {}<esc>i
inoremap [ []<esc>i
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap " <c-r>=QuoteAutoPair('"')<CR>
inoremap ' <c-r>=QuoteAutoPair("'")<CR>
inoremap <CR> <c-r>=EnterJudgement()<CR>

function QuoteAutoPair(char)
    let line = getline('.')
    let column = col('.')
    if line[column - 2] == "\\"
        return a:char
    elseif line[column - 1] == a:char
        return "\<Right>"
    else
        return a:char.a:char."\<esc>i"
    endif
endfunc

function EnterJudgement()
    let line = getline('.')
    let column = col('.')
    let nextChar = line[column - 1]
    if nextChar == "}"
        return "\<CR>\<esc>kA\<CR>"
    else
        return "\<CR>"
endfunc
