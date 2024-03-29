

" =============================================================================================
" ==> Vim configuration
" ==> Date: 10/02/2023
" ==> Name: Wanderley Cabral
" =============================================================================================
"
" =>  Basic configuration
"
" ==> set startify
source ~/.config/vim/plug-config/start-screen.vim
"
"Desabilitarar as teclas de seta 
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


" ==> Header template for sh files
autocmd bufnewfile *.sh so ~/.vim/header_template
autocmd bufnewfile *.sh exe “1,” . 10 . “g/File Name:/s//File Name: “ .expand(“%”)
autocmd bufnewfile *.sh exe "1," . 11 . "g/Creation Date:/s//Creation Date: " .strftime("%c")
autocmd Bufwritepre,filewritepre *.sh execute "normal ma"
" =====================================================================================
"
" => Plugin coc
"source ~/.vim/coc.nvimrc
source ~/.vim/pack/git-plugins/start/coc.nvim/plugin/coc.vim
let g:coc_disable_startup_warning = 1
" =============================================================================================
" 
syntax enable
filetype plugin indent on
syntax on
let g:rehash256 = 1
"----------------------------------------------
" => detect if the system supports more colors."
" True color if available
let term_program=$TERM_PROGRAM

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
	set termguicolors
else
	if $TERM !=? 'xterm-256color'
		set termguicolors
	endif
endif

"
" => Config open files
" HTML
function HtmlConfig()
    set tabstop=2 softtabstop=2 expandtab shiftwidth=2
	autocmd FileType html call HtmlConfig()
endfunction
"
" ==> highlight all words under the cursor
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
" 
" ==> Python
function PythonConfig()
    set tabstop=4 softtabstop=4 expandtab shiftwidth=4
	autocmd FileType python call PythonConfig()
endfunction

" ---------------------------------------------
let mapleader = ","

set number              " => shows the number of lines on the side."
set title               " => shows the file title."
set showcmd
set encoding=utf8
set showmatch
set autoindent
set smartindent
set history=500         " => stores the last 500 dictated commands

" => Tabs size
set expandtab           " => turns tabs into spaces."
set tabstop=4           " => number of spaces for tabs."
set shiftwidth=4        " => amount of spaces when indenting the text.
set smarttab
set softtabstop=4

" => true italics support
" => Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" => Font  - Dev Icons
set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono:h16 

" => Shows the lines from the current one.
set relativenumber  
set confirm

" => Set Mouse
set mouse=nicr
set mouse=a				   " => pallows the use of the mouse.
set cursorline			   " => insert a line where the cursor is."

" => Use system clipboard
set clipboard=unnamedplus " => sharing clipboard in vim."
set completeopt=noinsert,menuone,noselect " => modifies the behavior of the auto-complete menu to behave more like an IDE."

" = > Splits an Tabbed Files
set splitbelow splitright   " => configure the behavior of screen splitting in the command :split(split horizontally) and :vsplit(vertically)"
set path+=**
set wildmenu  " => shows a more advanced menu for autocomplete suggestions.set incsearch"
set incsearch
set nobackup
set noswapfile

" => tab through buffers
nmap <tab> :bnext<CR>
nmap q :quit<CR>
nmap <C-s> :w<CR>

" => open the terminal in vim"
nnoremap <C-t> :below terminal<CR> 

let g:ale_disable_lsp = 1
" => call the Plugins .vimrc.plug file
if filereadable(expand("~/.config/vim/plug-config/vimrc.plug"))
	source ~/.config/vim/plug-config/vimrc.plug
endif

" ----------------------------------------------
" => Set true italics support
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" => Themes
" => GRUVBOX configuration

if has('termguicolors')
    set termguicolors
endif

set background=light
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_better_performance = 1

let g:lightline = {'colorscheme' : 'gruvbox_material'}
let g:gruvbox_material_better_performance = 1
set background=dark
let g:gruvbox_material_background='soft'
let g:gruvbox_material_better_performance = 1
colorscheme dracula
let g:indentline_enabled = 1
map <c-k>i :IndentiLinesToggle<CR>

" => Configuration the airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0 
let g:airline_theme='sonokai'  " => Theme
let g:airline#extensions#tabline#formatter = 'default'

" => Browsing between buffers"
nnoremap <M-Right> :bn<CR>
nnoremap <M-Left> :bp<CR>
nnoremap <c-x> :bp \|bd #<CR>

" =>  Plugin configuration - CTRLP
let g:ctrlp_custom_ignore = 'v[ / ] .(swp|zip)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standart']
let g:ctrlp_show_hidden = 1

" => NerdTree Configuration
let NERDTreeQuitOpen=1
nnoremap <silent> <F2> : NERDTreeFind<CR>
nnoremap <silent> <F3> : NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▷ '
let g:NERDTreeDirArrowCollapsible = '▽ '
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

 " => Plugin Commenter
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
nmap cc <Plug>NERDCommenterInvert

 " => Plugin omnifunc   
if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
	    \	if &omnifunc == "" |
	    \		setlocal omnifunc=syntaxcomplete#Complete |
	    \	endif
endif

" => Plugin ale
let g:ale_linters = {'python' : ['flake8', 'pylint'], 'javascript' : ['eslint']}
let g:ale_completion_enabled = 1

" => HTML CSS sets
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<c-z>'

let g:user_emmet_settings = {
\  'variables': {'lang': 'ja'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"pt-BR\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."\t<link type=\"text/css\" rel=\"stylesheet\" href=\"\">\n"
\              
\               ."\t<title>Document</title>\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}
" -----------------------------------------------------------------------------

" => Bracey Live Server Web

" nnoremap <leader><F8> :Bracey <CR>
" nnoremap <leader><F9> :BraceyReload <CR>
" nnoremap <leader>0 :BraceyStop <CR>
" autocmd FileType html Bracey 

" let g:bracey_browser_command=0
" let g:bracey_auto_start_browser=1
" let g:bracey_refresh_on_save=1
" let g:bracey_eval_on_save=1

" let g:bracey_auto_start_server=1
" let g:bracey_server_allow_remote_connections=0
" let g:bracey_server_port='3000'
" let g:bracey_server_path='http://127.0.0.1'
" let g:bracey_server_log='/tmp/bracey_server_logfile'


" => Set indentation
let g:indentLine_enabled = 1

" -----------------------------------------------------------------------
" => config Plug 'voldikss/vim-floaterm'
nnoremap <A-t> :FloatermNew<CR>
nnoremap <A-r> :FloatermNew lf<CR>

let g:floaterm_wintype ='belowright'
let g:floaterm_keymap_new    = '<Leader> f'
let g:floaterm_keymap_toggle = '<Leader>ft'
let g:floaterm_keymap_prev   = '<Leader>fp'
let g:floaterm_keymap_next   = '<Leader>fn'
let g:floaterm_keymap_kill   = '<Leader>fk'
let g:floaterm_position="left"

hi FloatermBorder guibg=teal  guifg=yellow

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.5
let g:floaterm_height=0.5
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

"let g:which_key_map.t = {
"      \ 'name' : '+terminal' ,
"      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
"      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
"      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
"      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
"      \ 'n' : [':FloatermNew node'                              , 'node'],
"      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
"      \ 'p' : [':FloatermNew python'                            , 'python'],
"      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
"      \ 't' : [':FloatermToggle'                                , 'toggle'],
"      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
"      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
"      \ }

