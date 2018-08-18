set title
set cin
set tabstop=4
set shiftwidth=4
set softtabstop=4
set ls=2
"set cursorline
set fileformat=unix
set incsearch
set printoptions=number:y
set nocompatible " Use Vim defaults (much better!)
set bs=2 " allow backspacing over everything in insert mode
set ai " always set autoindenting on
set viminfo='20,\"50 " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time

abbreviate su /* sudi:sroy */
abbreviate todo /* sudi:TODO */
"abbreviate f> printf("sudi:func: %s,line no: %d\n", __func__ , __LINE__);
abbreviate p> printf("sudi: \n");
abbreviate P> printf("sudi:%s:%d: \n", __func__, __LINE__);
abbreviate k> printk("sudi: \n");
abbreviate K> printk("sudi:%s:%d: \n", __func__, __LINE__);
abbreviate s> syslog(LOG_CRIT,"sudi: \n");
abbreviate S> syslog(LOG_CRIT,"sudi:%s:%d: \n", __func__, __LINE__);
abbreviate f> fprintf(stderr,"sudi: \n");
abbreviate F> fprintf(stderr,"sudi:%s:%d: \n", __func__, __LINE__);
abbreviate e> #error "sudi:remove me"
abbreviate c> // sudi:
abbreviate d> void sudi_dump(struct sk_buff *skb) {int max_len = 64; int max=(skb->len>max_len?max_len:skb->len);while(max){printk("0x%02x%s",skb->data[64-max],(max-1)%16?" ":"\n" );max--;}printk("\n");}
abbreviate D> #define SUDIECHO(f, a...) {char sudi_buf1[100],sudi_buf2[150]; snprintf (sudi_buf1, sizeof (sudi_buf1),f,##a); snprintf (sudi_buf2, sizeof (sudi_buf2), "echo %s:%d::%s >> /tmp/sudi_logs.txt", __func__, __LINE__, sudi_buf1); system(sudi_buf2); }
abbreviate E> SUDIECHO("");

map <C-L> :grep -w <cword><CR>
map <C-N> :tn<CR>
map <C-P> :tp<CR>
map <C-Y> :pop<CR>

nnoremap <F9> :TlistToggle<CR>
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Enable_Fold_Column = 1

map <C-J> <C-W>h
map <C-K> <C-W>l
map <C-Space> <C-W><C-W>

if &term=="xterm" || &term=="xterm-color"
    set t_Co=8
    set t_Sb=^[4%dm
    "
    " Switch syntax highlighting on, when the terminal has colors
    " Also switch on highlighting the last used search pattern.
    "
    syntax on
    set hlsearch
    set t_Sf=^[3%dm
endif
"experiment sudi
set t_Co=256
"done sudi
"
" Expand tab to source codes only
"
au FileType cpp setlocal expandtab
au FileType c setlocal expandtab
au FileType h setlocal expandtab
au FileType html setlocal expandtab
"
" DONOT Expand tabs to Makefile
"
au FileType make setlocal noexpandtab
"
" Perforce uses a non-gui vim, hence will set mouse option only
" if gui is enabled
"
if has("gui")
    set guioptions+=b
    "
    " This guifont setting was for old vim
    " set guifont=-misc-fixed-medium-r-semicondensed-*-*-120-*-*-c-*-koi8-ub
    "
    "set guifont=MiscFixed
    set guifont="Monospace 10"
    "
    " winsize works in windows !
    " winsize 100 70
    "
    "set mouse=a
    set nu
    set list listchars=tab:\ ~,trail:.
    "
    " Setup the GDB that should be used
    "
    " Commenting here
    highlight Normal guibg=black guifg=white
    highlight Cursor guibg=red guifg=NONE
    highlight NonText guibg=black
    highlight Constant gui=NONE guibg=black
    highlight Special gui=NONE guibg=black
endif

"
" Setting the mswindows mapping Ctrl-C, Ctrl-V mappings
"
source $VIMRUNTIME/mswin.vim
"
" Setup the tag files
"
set tags=$TAG_FILES
"
" Setting the ctags mappings
"
run macros/tags.vim
"
" Setting the Cscope mappings (commented)
"
"run macros/cscope_maps.vim
"
" Setting the gdb mappings
"
"run macros/gdb_mappings.vim
"
" Only do this part when compiled with support for autocommands
"
if has("autocmd")
    "
    "  In text files, always limit the width of text to 78 characters
    "
    autocmd BufRead *.txt set tw=78
    "
    "  When editing a file, always jump to the last cursor position
    "
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif


let g:solarized_termcolors=256

"colorscheme newspaper
"colorscheme desert
colorscheme solarized

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>



"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%>80v.\+/

"call togglebg#map("<F5>")
set noeb vb t_vb=

" disable cursor keys in normal mode
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

if has("statusline") && !&cp
  set laststatus=2                   " always show the status bar
  set statusline=%<%1*\ %f\ %*       " filename
  set statusline+=%2*%m%r%*          " modified, readonly
  set statusline+=\ %3*%y%*          " filetype
  "set statusline+=\ %4*%{fugitive#head()}%0*
  set statusline+=%=                 " left-right separation point
  set statusline+=\ %5*%l%*/%L[%p%%] " current line/total lines
  set statusline+=\ %5*%v%*[0x%B]    " current column [hex char]
endif

let g:solarized_termcolors=256

syntax enable
set background=light
"set background=dark
colorscheme solarized

let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Sudeepto Kumar Roy"
"let g:DoxygenToolkit_licenseTag="Copyright \(C\) 2017 /<enter/>"


