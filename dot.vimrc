" VIMRC 
" limijd@gmail.com
" Aug. 2015

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Pathogen {{{
"Pathogen will let VIM plugins keep there own directories under ~/.vim/bundle
"https://github.com/tpope/vim-pathogen

    syntax off
    execute pathogen#infect()
    "Load Help docs in each bundle/<submodule>/
    execute pathogen#helptags()

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Syntaxes {{{

    syntax  enable 
    "F7 to toggle syntax
    map        <F7>             :echo "Toggle Syntax!"  <BAR>
             \ :if exists("g:syntax_on") <Bar>
             \     syntax off           <Bar>
             \ else                     <Bar>
             \     syntax enable        <Bar>
             \ endif                    <CR>
    filetype on

    "filetype plugin and indent are needed by pyflakes plugin
    "load plugin file depends on filetype to customize plugins
    filetype plugin on 
    "load indent file depends on filetype to customize indent
    filetype indent on 

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Tab and Shiftwidth {{{

    set     expandtab
    set     tabstop         =4
    set     shiftwidth      =4

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"code folding {{{
"  :help folding
"  :help fold-commands

"Frequently used commands:
"  za: toggle(fold/unfold) the codes at current level
"  zR: open all folds
"  :{range}foldc[lose][!]
"  :{range}foldo[pen][!]

    "fold based on indent
    "for .vimrc we using marker to make vimrc editting more clean!
    if @% == ".vimrc"
        set foldmethod =marker
    else
        set foldmethod =indent     
    endif

    "deepest fold is 10 levels
    set foldnestmax =10         

    "dont fold by default
    set nofoldenable                

    "only folder lines at same level
    set foldlevel =1          

    "fold everything inside current scope
    "set foldlevel = 99         

    "customize folding color 
    highlight Folded ctermbg=Grey ctermfg=0
    highlight FoldColumn ctermbg=Grey  ctermfg=0

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"gundo {{{
"https://github.com/sjl/gundo.vim.git bundle/gundo

    " <leader> is \
    map        <leader>g        :GundoToggle<CR> 

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"CTRL-Arrow to move around VIM split windows{{{

    map        <c-Down>         <c-w>j
    map        <c-Up>           <c-w>k
    map        <c-Right>        <c-w>l
    map        <c-Left>         <c-w>h

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"python {{{

    "pyflakes use quickfix window,use a separate window to display/locate the error 
    let g:pyflakes_use_quickfix = 0

    "pep8
    let g:pep8_map='<leader>8'

    "supertab for python completion - cool
    "let g:SuperTabDefaultCompletionType = "<c-n>"
    "let g:SuperTabContextDefaultCompletionType = "<c-n>"
    au FileType python set omnifunc=pythoncomplete#Complete
    let g:SuperTabDefaultCompletionType = "context"
    set completeopt=menuone,longest,preview
    "close the preview window automatically
    "let g:SuperTabClosePreviewOnPopupClose = 1
    map        <F8>             :pclose<CR>

    "toggle NERDTree
    map        <leader>n        :NERDTreeToggle<CR>

    "rope and ropevim: go to definition
    "map <leader>j :RopeGotoDefinition<CR>
    "map <leader>r :RopeRename<CR>

    "run current script
    map        <F12>            :!python %<CR>

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"project specific configurations{{{

    "Each project need to be registered first, so the .vimrc file will be
    "loaded.
    function! RegisterProject(var1)
        let wd = getcwd()
        let prj_path = resolve(a:var1)
        if prj_path == $HOME
            echo "Warning: home directory can't be project directory!"
            return
        endif

        if wd == prj_path
            let prj_vimrc = prj_path."/.vimrc"
            if !exists(prj_vimrc)
                silent echo "Loading project settings: ".prj_vimrc
                exec "source ".prj_vimrc
            endif
        endif
    endfunction

    call RegisterProject("/home/limijd/dev-sandbox/otapp2")
    call RegisterProject("/home/limijd/dev-sandbox/TimberWeb1")

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Misc{{{

    "avoid "Press ENTER or type command to continue" message
    :set shortmess=a

    "show all my mapped keys and commands
    command    MyKeys           :!grep -e '^\s\+map ' -e '^map ' -e '^\s\+command ' % |sort
    command    CsLoad           :cs add cscope.out

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"vimwiki {{{
    set nocompatible
    filetype plugin on
    syntax on

"}}}

"local specific config {{{
    let local_vimrc = expand("~/.vimrc.local")
    if filereadable(local_vimrc)
        silent echo "Loading local VIM settings: ".local_vimrc
        exec "source ".local_vimrc
    endif
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
