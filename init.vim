:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

""" prevent select in mouse active
set mouse=i

set background=dark
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

"" key map ""
let mapleader= " "
nnoremap <F3> :set hlsearch!<CR>
nnoremap <F4> :set foldmethod=syntax<CR>
nnoremap <F5> :set foldmethod=indent<CR>
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

iab <silent> cll console.log()<Left><C-R>=Eatchar('\s')<CR>
iab <silent> cle console.error()<Left><C-R>=Eatchar('\s')<CR>

""" plug list
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'heavenshell/vim-jsdoc'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'valloric/youcompleteme'
Plug 'marijnh/tern_for_vim'
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'suan/vim-instant-markdown'


call plug#end()

"plugin setting

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

let g:ale_linters = {'javascript': ['eslint']}
let g:airline_section_error = '%{ALE()}'
let g:airline_section_warning = ''
let g:ale_statusline_format = ['😱 %d', '😉 %d', '👍 ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '😱'
let g:ale_sign_warning = '😉'
let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
"let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"" ale"

"" nerd tree"
let g:NERDTreeDirArrows = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
"" nerd tree"

"" ctrlp"
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/target
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
" Default mapping
let g:multi_cursor_next_key='<C-,>'
let g:multi_cursor_prev_key='<C-.>'
let g:multi_cursor_skip_key='<C-s>'
let g:multi_cursor_quit_key='<Esc>'
""end of multi cursor"

""vim-instant-markdown"
let g:instant_markdown_slow = 1
""vim-instant-markdown"

colorscheme gruvbox
set background=dark
filetype plugin on
" for solarized
 "let g:solarized_termcolors=256
 "colorscheme solarized
"" note ""
"":w !sudo tee %
