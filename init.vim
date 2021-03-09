":let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
"let g:loaded_python_provider=1
"let g:python_host_prog  = '/usr/bin/python'
"let g:ycm_server_python_interpreter='/usr/bin/python'
""" prevent select in mouse active
set mouse=i
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set tags=/Users/georgexie/workspace/projects/mg-ui/tags

"let g:tagbar_type_javascript = {
    "\ 'kinds' : [
        "\ 'v:global variables:0:0',
        "\ 'c:classes',
        "\ 'p:properties:0:0',
        "\ 'm:methods',
        "\ 'f:functions',
        "\ '?:unknown',
    "\ ],
"\ }

set inccommand=split
set relativenumber
set number
set cursorline
set showcmd
set scrolloff=3
"turn tab to space
set expandtab
set softtabstop=4
set shiftwidth =2
set nowrapscan
set background=dark
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list
"do not serach around

"" key map ""
let mapleader= " "
nnoremap <F3> :set hlsearch!<CR>
nnoremap <F4> :set foldmethod=syntax<CR>
nnoremap <F5> :set foldlevel=9<CR>
"inoremap jk <Esc> cnoremap jk <Esc> 
noremap tt :tabnew<CR>
noremap tn :tabnext<CR>
noremap tp :tabprevious<CR>
noremap bs :g/{/ .+1,/}/-1 sort<CR>
noremap <leader> " :%s/'/"/g<CR>
"noremap <space> :
noremap H ^
noremap L $

"" abbrite ""
func Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc
iab <silent> cll console.log('log')<Left><C-R>=Eatchar('\s')<CR>
iab <silent> cli console.info()<Left><C-R>=Eatchar('\s')<CR>
iab <silent> cle console.error()<Left><C-R>=Eatchar('\s')<CR>

""" plug list
call plug#begin('~/.vim/plugged')

""core at most 10
"language pack
Plug 'sheerun/vim-polyglot'
"status bar
Plug 'bling/vim-airline'
"async lint and fix
Plug 'w0rp/ale'
"sidebar
Plug 'scrooloose/nerdtree'
"completation
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
"add comment
Plug 'tpope/vim-commentary'
"fuzzy find
Plug 'kien/ctrlp.vim'

"" enhancement
"gitgutter
Plug 'airblade/vim-gitgutter'
"git diff
Plug 'tpope/vim-fugitive'
"theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'

"emmet
Plug 'mattn/emmet-vim'

"format
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"support cs'" quick replace ',",[,{,<t,anyting
Plug 'tpope/vim-surround'

"auto complete parenteses
Plug 'jiangmiao/auto-pairs'

""" others
"markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

"" trash
" Plug 'pangloss/vim-javascript'
" Plug 'tpope/vim-repeat'
" Plug 'heavenshell/vim-jsdoc'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'majutsushi/tagbar'
" Plug 'valloric/youcompleteme'
" Plug 'marijnh/tern_for_vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'Chiel92/vim-autoformat'
" Plug 'tpope/vim-abolish'
" Plug 'altercation/vim-colors-solarized'

call plug#end()

"plugin setting
set t_Co=256
colorscheme gruvbox
"notes: I guess you tried to colo monomai before plug#end()? Plugins become available only after plug#end().

"" rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

""" coc.vim
"can't figure out this
" let config_path='~/.config/nvim'
" exec "source ".${config_path}."/coc.vim"
runtime coc.vim

""" airline
let g:airline_theme='light'
let g:airline#extensions#whitespace#show_message = 0
let g:airline_right_sep = ''
let g:airline_left_sep = ''
let g:airline_section_y = '%{strftime("%H:%M")}'
"let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#buffer_nr_show=1
""" ailline


"" ale
function ALE() abort
    return exists('*ALEGetStatusLine') ? ALEGetStatusLine() : ''
endfunction

let g:airline_section_error = '%{ALE()}'
let g:airline_section_warning = ''
let g:ale_statusline_format = ['😱 %d', '😉 %d', '👍 ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '😱'
let g:ale_sign_warning = '😉'
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier-eslint','eslint']
let g:ale_fixers['json'] = ['prettier-eslint']
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_set_loclist = 0
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 1
nmap <silent> <C-l> <Plug>(ale_next_wrap)
nmap <silent> <leader>f :ALEFix<CR>
"" ale"

"" nerd tree"
let g:NERDTreeDirArrows = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
"" nerd tree"

"" nerd commenter"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"" nerd commenter"

"" ctrlp"
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/target,*/node_modules,*/tmp,coverage,*/coverage_*,*/dist
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](.git)$'
"" ctrlp"

""" vim javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function = "ƒ"
""" vim javascript

""" jsdoc
map  <leader>e :JsDoc <CR>
let g:jsdoc_access_descriptions=2
let g:jsdoc_underscore_private=1
let g:jsdoc_custom_args_hook = {
            \ 'callback\|cb': {
            \   'type': ' {Function} ',
            \   'description': 'Callback function'
            \ },
            \ '\(err\|error\)$': {
            \     'type': '{Error}'
            \   },
            \   'options$': {
            \     'type': '{Object}'
            \   }
            \}
""" jsdoc

""" emmet
"let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,hbs EmmetInstall
""" emmet

"""tagbar 
let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=36                          " Default is 40, seems too wide
noremap <silent> <Leader>y :TagbarToggle       " Display panel with y (or ,y)

"""deocomplete
let g:deoplete#enable_at_startup = 1


""tern"
" 鼠标停留在方法内时显示参数提示
let g:tern_show_argument_hints = 'on_hold'
" 补全时显示函数类型定义
let g:tern_show_signature_in_pum = 1
" 跳转到浏览器
nnoremap <leader>tb :TernDocBrowse<cr>
" 显示变量定义
nnoremap <leader>tt :TernType<cr>
" 跳转到定义处
nnoremap <leader>tf :TernDef<cr>
" 显示文档
nnoremap <leader>td :TernDoc<cr>
" 预览窗口显示定义处代码
nnoremap <leader>tp :TernDefPreview<cr>
" 变量重命名
nnoremap <leader>tr :TernRename<cr>
" location 列表显示全部引用行
nnoremap <leader>ts :TernRefs<cr>
"" end of tern"
""ycm"
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
nnoremap <leader>yf :YcmCompleter GoToDefinition<cr>
""end of ycm"

""mulit cursor"
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-s>'
let g:multi_cursor_quit_key='<Esc>'
""end of multi cursor"

""vim-instant-markdown"
let g:instant_markdown_slow = 1
""vim-instant-markdown"

"" autoformatter"
"let g:formatterpath = ["/Users/georgexie/workspace/projects/mg-ui/node_modules/.bin"]
"" autmformatter"

filetype plugin on
"autocmd FileType javascript set formatprg=prettier-eslint\ --stdin
"autocmd BufWritePre *.js :normal gggqG


"" note ""
"":w !sudo tee %

"workspace
cd ~/workspace/projects/algorithm
