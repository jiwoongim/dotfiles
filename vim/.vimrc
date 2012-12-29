set mouse=a
set number


" vundle stuff ============================
source ~/.vundlebundles

" ECLIM REQUIREMENTS ==========
filetype plugin on
set nocp

" Colorscheme
" colorscheme xoria256

" Indentation stuff
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
filetype indent plugin on

" Better command-line completion
set wildmenu
" shell style completion
" set wildmode=list:longest

" disable using alt modifier for accessing window menus
set winaltkeys=no

" smarter searching. ignores case if all letters same case
set ignorecase 
set smartcase
set incsearch

" sets the title of the shell to the curretly opened file
set title

" most of the time wrapping is annoying
set nowrap

" if we do wrap, split on words rather than characters
set linebreak

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" cursor position
set ruler

" scroll with the cursor if its within 3 lines of the edge
set scrolloff=3

" slightly faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Show partial commands in the last line of the screen
set showcmd

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Set the status line the way i like it
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Highlight when searching
set hlsearch

" enable omnicompletion
set ofu=syntaxcomplete#Complete

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <leader>cl :nohl<CR><C-L>

" swap tilde and apostrophe, for better mark navigation
nnoremap ' `
nnoremap ` '

" remap leader
let mapleader = ","

" keep longer history
set history=1000

" enable extended % matching
runtime macros/matchit.vim

syntax on
set hidden
set showmatch

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" open tag in vertsplit window
" mnemonic Tag Split
vnoremap <silent> <leader>ts :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy:vsp<CR><C-W><C-W>:tag <C-R>"<CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

nnoremap <silent> <leader>ts :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \yiw:vsp<CR><C-W><C-W>:tag <C-R>"<CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
  
" Window movement command mapping
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Movement default gj and gk
nnoremap j gj
nnoremap k gk

"-----------------------------------------------------------------------------
" Custom mappings for plugins
"-----------------------------------------------------------------------------

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" opens nerd tree in project root dir
map <F8> :ToggleNERDTree<CR>
map <F9> :TlistToggle<CR>

" Switch between complementary filetypes
" mnemonic: Go Switch
nnoremap gs :A<CR>

nmap <expr> <leader>jh ((exists(":JavaHierarchy"))?(":JavaHierarchy\n"):(""))
nmap <expr> <leader>ch ((exists(":CCallHierarchy"))?(":CCallHierarchy\n"):(""))

" easier autocompletion
" inoremap <C-Space> <C-X><C-U>

" use eclim's documentation finder
function! GetDocumentation()
    if &filetype == 'java'
        JavaDocSearch
    else
        normal! K
    endif
endfunction

nnoremap K :call GetDocumentation()<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
if has("autocmd")
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
endif
set completeopt=menuone,menu,longest

"-----------------------------------------------------------------------------
" Set up autocommands
"-----------------------------------------------------------------------------
" Source the vimrc file after saving it
if has("autocmd")
    autocmd! bufwritepost .vimrc source $MYVIMRC
endif

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has("gui_running")
    " Remove menu bar
    set guioptions-=m

    " Remove toolbar
    set guioptions-=T

    " set gfn=Courier\ New\ 12
    " set gfn=DejaVu\ Sans\ Mono\ 12
    " set gfn=Droid\ Sans\ Mono\ 12
    set gfn=Inconsolata\ 12
    " set gfn=monofur\ 14
    " colorscheme xoria256
    if !exists("g:vimrcloaded")
        winpos 0 0
        winsize 180 100
        let g:vimrcloaded = 1
    endif
endif

