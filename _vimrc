"=====[ Convert to Unicode defaults ]===============================

"setglobal termencoding=utf-8 fileencodings=
"scriptencoding utf-8

"autocmd BufNewFile,BufRead  *   if &modifiable 
"autocmd BufNewFile,BufRead  *   set encoding=utf-8
"autocmd BufNewFile,BufRead  *   endif

set nocompatible              " required

filetype off                  " required

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
set nowrap
set nu
set background=dark
set showmode                       " display the current mode
set cursorline                  " highlight current line


if has('cmdline_info')
   set ruler                      " show the ruler
   set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    "    set showcmd                    " show partial commands in status line and
                                   " selected characters/lines in visual mode
endif

syntax on                     " syntax highlighting

if has('win32') || has('win64')
   color desert                         " load a colorscheme
endif
" Windows Compatible {statusline
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier. 
        if has('win32') || has('win64')
        "if has('win64')
            "set runtimepath=$HOME/_vimrc
            "set runtimepath=$HOME/_vimrc,$HOME/vimfiles,$VIMRUNTIME
            set runtimepath=$HOME/_vimrc,$VIMRUNTIME
		" buffer clode
			set runtimepath=$HOME/_vimrc,$VIMRUNTIME,$HOME/vimfiles/bundle/bbye
			"set runtimepath=$HOME/_vimrc,$VIMRUNTIME,/vim/fundle/bbye
        endif
    " }
    " 
    " Setup Bundle Support {
    " The next two lines ensure that the ~/.vim/bundle/ system works
"        runtime! autoload/pathogen.vim
"        silent! call pathogen#helptags()
"        silent! call pathogen#runtime_append_all_bundles()
    " }
" }
"
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('$HOME/.vim/bundle/Vundle')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
"Plugin 'unite.vim'
"Plugin 'c9s/perlomni.vim'
"Plugin 'WolfgangMehner/vim-plugins'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-a>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
                
set history=1000                  " Store a ton of history (default is 20)
"set spell                          " spell checking on

set backspace=indent,eol,start    " backspace for dummys
set linespace=1                    " No extra spaces between rows
set nu                            " Line numbers on
set showmatch                    " show matching brackets/parenthesis
set incsearch                    " find as you type search
set hlsearch                    " highlight search terms
set winminheight=0                " windows can be 0 line high 
set ignorecase                    " case insensitive search
set smartcase                    " case sensitive when uc present
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full    " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]    " backspace and cursor keys wrap to
set scrolljump=3                 " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
" set foldenable                  " auto fold code
set nofoldenable                  " nofen                       " auto fold code
set nofen                  " nofen                       " auto fold code
set gdefault                    " the /g flag on :s substitutions by default
" set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.,eol:¬ " Highlight problematic whitespace
nmap <F5> :set invlist<cr> 
imap <F5> <esc>:set invlist<cr> 
" Formatting {
    set nowrap                         " wrap long lines
    set autoindent                     " indent at the same level of the previous line
"    set shiftwidth=4                   " use indents of 4 spaces
"    set shiftwidth=0                   " use indents of 0 spaces
"    set expandtab                        " tabs are spaces, not tabs
    set noexpandtab                    " tabs are tabs
"    set tabstop=4                     " an indentation every four columns
"    set softtabstop=4                 " let backspace delete indent
"    set softtabstop=0                 " let backspace delete indent
        set tabstop=4                   " Number of spaces that a <Tab> in the file counts for.
"    set matchpairs+=<{}()[]            " match, to be used with % 
    set pastetoggle=<F12>              " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    autocmd FileType pl,c,cpp,java,php,js,python,twig,xml,yml,pm,_vimrc autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }
" Key (re)Mappings {

    "The default leader is '\', but many people prefer ',' as it's in a standard
    "location
    let mapleader = ','
	"
	" tabs
	nnoremap th  :tabfirst<CR>
	nnoremap tj  :tabnext<CR>
	nnoremap tk  :tabprev<CR>
	nnoremap tl  :tablast<CR>
	nnoremap tt  :tabedit<Space>
	nnoremap tn  :tabnext<Space>
	nnoremap tm  :tabm<Space>
	nnoremap td  :tabclose<CR>
	
    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_
    
    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " The following two lines conflict with moving to top and bottom of the
    " screen
    " If you prefer that functionality, comment them out.
    map <S-H> gT          
    map <S-L> gt

    " Stupid shift key fixes
    cmap W w                         
    cmap WQ wq
    cmap wQ wq
    cmap Q q
    cmap Tabe tabe

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$
        
    "clearing highlighted search
    nmap <silent> <leader>/ :nohlsearch<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv 

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0
        
    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null
" }
" copyFullPath {
" copy to windows 
	noremap <silent> <F4> :let @+=expand("%:p")<CR>
	" copy to windows clipboard
	set clipboard=unnamed    
	set go+=a
	let @*=@a
" }
"
noremap <silent> <F5> :let @+ = substitute(expand("%:p"), '\', '/', 'g')<cr>

set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" GUI Settings {
    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T              " remove the toolbar
        set guioptions+=b           " set the bottom scroll bar
        set lines=40                   " 40 lines of text instead of 24,
		set si						" auto indenting
    else
        set term=builtin_ansi       " Make arrow and other keys work
    endif
" }
"
" get gui lable
function! GuiTabLabel()
    return fnamemodify(bufname(winbufnr(1)), ":t")
endfunction

set guitablabel=%!GuiTabLabel()

"function! NumberOfWindows()
"  let i = 1
"  while winbufnr(i) != -1
"  let i = i+1
"  endwhile
"  return i - 1
"endfunction

" tabs
autocmd VimEnter * tab all
autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'
nnoremap H gT
nnoremap L gt


map <C-L> 80zl " Scroll 20 characters to the right
map <C-H> 80zh " Scroll 20 characters to the left

" move tabs
function ShiftTab(direction)
        let tab_number = tabpagenr()
        if a:direction ==0
                if tab_number == 1
                        exe 'tabm ' . tabpagenr('$')
                else
                        exe 'tabm ' . (tab_number - 2)
                endifProgram Files (x86)
        else
                if tab_number == tabpagenr('$')
                        exe 'tabm ' . 0
                else
                        exe 'tabm ' . tab_number
                endif
        endif
        return ''
endfunction


inoremap <silent> <C-S-Left> <C-r>=ShiftTab(0)<CR>
inoremap <silent> <C-S-Right> <C-r>=ShiftTab(1)<CR>

noremap <silent> <C-S-Left> <C-r>=ShiftTab(0)<CR>
noremap <silent> <C-S-Right> <C-r>=ShiftTab(1)<CR>

function! s:close_wintab()
  try
    WintabsClose 
  catch
    quit
  endtry
endfunction

au BufEnter * call MyLastWindow()

function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction

" setting auto complete
set iskeyword+=:

" copyFullPath {
        " copy to windows 
        noremap <silent> <F4> :let @+=expand("%:p")<CR>
        noremap <silent> <F2> :let @+=expand("%:p:gs?\\?/?")<CR>
        " copy to windows clipboard
        set clipboard=unnamed
        set go+=a
        let @*=@a
" }

" set list of normally unprintable characters
"
set listchars=tab:>-,trail:.,extends:#,nbsp:.,eol:? " Highlight problematic whitespace
nmap <F5> :set invlist<cr> 
imap <F5> <esc>:set invlist<cr>

