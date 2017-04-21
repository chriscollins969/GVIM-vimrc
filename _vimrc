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
" Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier. 
        if has('win32') || has('win64')
        "if has('win64')
            "set runtimepath=$HOME/_vimrc
            "set runtimepath=$HOME/_vimrc,$HOME/vimfiles,$VIMRUNTIME
            set runtimepath=$HOME/_vimrc,$VIMRUNTIME
        endif
    " }
    " 
    " Setup Bund"le Support {
    " The next two lines ensure that the ~/.vim/bundle/ system works
        runtime! autoload/pathogen.vim
        silent! call pathogen#helptags()
        silent! call pathogen#runtime_append_all_bundles()
    " }
" }
"
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

" workspace
"nnoremap <leader>s :ToggleWorkspace<CR>
"let g:workspace_autocreate =1
"let g:workspace_persist_undo_history = 1
"let g:workspace_autosave = 1
"let g:workspace_autosave_untrailspaces = 0
" perl support

 " let g:Perl_PerlTags           = 'on'
 " let g:Templates_TemplateBrowser = 'browse'
  
 " let g:Perl_Perltidy  = 'on'
 " let g:Perl_PerltidyBackup  = 'on'

" set list of normally unprintable characters
"
set listchars=tab:>-,trail:.,extends:#,nbsp:.,eol:¬ " Highlight problematic whitespace
nmap <F5> :set invlist<cr> 
imap <F5> <esc>:set invlist<cr> 
" Recent Files {
    let MRU_Max_Entries = 1000 
    let MRU_Window_Height = 15
" }
" Formatting {
    set nowrap                         " wrap long lines
    set autoindent                     " indent at the same level of the previous line
    set shiftwidth=8                   " use indents of 4 spaces
"    set shiftwidth=0                   " use indents of 0 spaces
    set expandtab                        " tabs are spaces, not tabs
"    set noexpandtab                    " tabs are tabs
"    set softtabstop=4                 " let backspace delete indent
"    set softtabstop=0                 " let backspace delete indent
    set tabstop=8                   " Number of spaces that a <Tab> in the file counts for.
"    set matchpairs+={}()[]            " match, to be used with % 
    set pastetoggle=<F12>              " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    autocmd FileType pl,c,cpp,java,php,js,python,twig,xml,yml,pm,_vimrc autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    filetype indent plugin on
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


    " ShowMarks {
        let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        " Don't leave on by default, use :ShowMarksOn to enable
        let g:showmarks_enable = 0
        " For marks a-z
        highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
        " For marks A-Z
        highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
        " For all other marks
        highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
        " For multiple marks on the same line.
        highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
    " }
	"
    " SnipMate {
        " Setting the author var
        " If forking, please overwrite in your .vimrc.local file
        let g:snips_author = 'Chris Collins <christopher.t.collins@rrd.com>'
        " Shortcut for reloading snippets, useful when developing
        nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>
    " }
    " copyFullPath {
        " copy to windows 
        noremap <silent> <F4> :let @+=expand("%:p")<CR>
        " copy to windows clipboard
        set clipboard=unnamed
        set go+=a
        let @*=@a
    " }

    " copy pattern in new window {
        nnoremap <silent> <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR>
    " }

    " Richard's plugins {
        " Fuzzy Finder {
            """ Fuzzy Find file, tree, buffer, line
            nmap <leader>ff :FufFile **/<CR>
            nmap <leader>ft :FufFile<CR>
            nmap <leader>fb :FufBuffer<CR>
            nmap <leader>fl :FufLine<CR>
            nmap <leader>fr :FufRenewCache<CR>
        " }

        " Session List {
            set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
            nmap <leader>sl :SessionList<CR>
            nmap <leader>ss :SessionSave<CR>
        " }
        
        " Buffer explorer {
            nmap <leader>b :BufExplorer<CR>
        " }
        
        " VCS commands {
            nmap <leader>vs :VCSStatus<CR>
            nmap <leader>vc :VCSCommit<CR>
            nmap <leader>vb :VCSBlame<CR>
            nmap <leader>va :VCSAdd<CR>
            nmap <leader>vd :VCSVimDiff<CR>
            nmap <leader>vl :VCSLog<CR>
            nmap <leader>vu :VCSUpdate<CR>

        " vim-indent-guides-master {
    "#        nmap <Leader>ig
        " }

        " php-doc commands {
            nmap <leader>pd :call PhpDocSingle()<CR>
            vmap <leader>pd :call PhpDocRange()<CR>
        " }
        
        " Debugging with VimDebugger {
            map <F11> :DbgStepInto<CR>
            map <F10> :DbgStepOver<CR>
            map <S-F11> :DbgStepOut<CR>
"            map <F5> :DbgRun<CR>
            map <F6> :DbgDetach<CR>
            map <F8> :DbgToggleBreakpoint<CR>
            map <S-F8> :DbgFlushBreakpoints<CR>
            map <F9> :DbgRefreshWatch<CR>
            map <S-F9> :DbgAddWatch<CR>
        " }

        " cmd windows {
"            nmap <script> <silent> <unique> <Leader>l <ESC>:Sdcv '<cword>' <CR> 
"            vmap <script> <silent> <unique> <Leader>l y<ESC>:Sdcv <c-r>" <CR>
        " }

        " Taglist Variables {
            let Tlist_Auto_Highlight_Tag = 1
            let Tlist_Auto_Update = 1
            let Tlist_Exit_OnlyWindow = 1
            let Tlist_File_Fold_Auto_Close = 1
            let Tlist_Highlight_Tag_On_BufEnter = 1
            let Tlist_Use_Right_Window = 1
            let Tlist_Use_SingleClick = 1

            let g:ctags_statusline=1
            " Override how taglist does javascript
            "let g:tlist_javascript_settings = 'javascript;f:function;c:class;m:method;p:property;v:global'
         " }

        " JSON {
            nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
         " }
    " }
" }

"        set laststatus=2
"
"        " Broken down into easily includeable segments
"        set statusline=%<%f\    " Filename
"        set statusline+=%w%h%m%r " Options
"        set statusline+=%w%h%m%r " Options
"        set statusline+=\ [%{&ff}/%Y]            " filetype
"        set statusline+=\ [%{getcwd()}]          " current dir
"        set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
"        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
 set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
"set statusline=
"set statusline+=%<\                       " cut at start
"set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
"set statusline+=%-40f\                    " path
"set statusliset guitablabel=%tne+=%=%1*%y%*%*\              " file type
"set statusline+=%10((%l,%c)%)\            " line and column
"set statusline+=%P                        " percentage of file
" set the filename not the path on tabs
set guitablabel=%t
" GUI Settings {
    " GVIM- (here instead of .gvimrc)
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

function! InitializeDirectories()
  let separator = "."
  let parent = $HOME 
  let prefix = '.vim'
  let dir_list = { 
              \ 'backup': 'backupdir', 
              \ 'views': 'viewdir', 
              \ 'swap': 'directory', 
              \ 'undo': 'undodir' }

  for [dirname, settingname] in items(dir_list)
      let directory = parent . '/' . prefix . dirname . "/"
      if exists("*mkdir")
          if !isdirectory(directory)
              call mkdir(directory)
          endif
      endif
      if !isdirectory(directory)
          echo "Warning: Unable to create backup directory: " . directory
          echo "Try: mkdir -p " . directory
      else  
          let directory = substitute(directory, " ", "\\\\ ", "")
          exec "set " . settingname . "=" . directory
      endif
  endfor
endfunction

call InitializeDirectories() 
function! NumberOfWindows()
  let i = 1
  while winbufnr(i) != -1
  let i = i+1
  endwhile
  return i - 1
endfunction

" tabs
"autocmd VimEnter * tab all
"autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'
"nnoremap H gT
"nnoremap L gt

if (&diff==0)
    :autocmd BufReadPost * tab ball
endif

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

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

let g:netrw_cygwin = 0
let g:netrw_scp_cmd = "\"C:\\Program Files (x86)\\PuTTY\\pscp.exe\" -pw Cepacol14 "

nnoremap <nowait><expr><buffer> q
  \ len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 0
  \ ? ':bwipeout<cr>' : ':quit<cr>'

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

set hidden " abandon a buffer when unloaded

" my Perl preferences
map <F7> :%!perltidy<CR>                    " indent
map <F3> :!perl -c<CR>                     " run tests
"autocmd Filetype perl map <F4> :!prove -l --state=save<CR>        " run tests, stateful
"autocmd Filetype perl map <F5> :!prove -l --state=save,failed<CR> " run only failed tests
"autocmd filetype perl setlocal autoindent
"autocmd filetype perl setlocal expandtab
"autocmd filetype perl setlocal shiftwidth=4
"autocmd filetype perl setlocal tabstop=4

" use perltidy for .pl, .pm, and .t
autocmd BufRead,BufNewFile *.pl setl equalprg=perltidy
autocmd BufRead,BufNewFile *.pm setl equalprg=perltidy
autocmd BufRead,BufNewFile *.t  setl equalprg=perltidy
