set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Keep Plugin commands between vundle#begin/end.

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"""""""""""""""""""""""""""""""""""""""
"       LIBRARIES                     "
"""""""""""""""""""""""""""""""""""""""

" misc functions for plugins
Plugin 'xolox/vim-misc'

" Asynchronous build and test dispatcher
Plugin 'tpope/vim-dispatch'

"""""""""""""""""""""""""""""""""""""""
"       LOOK AND FEEL                 "
"""""""""""""""""""""""""""""""""""""""

" solarized using true colour
Plugin 'lifepillar/vim-solarized8'

" airline
" TODO In the future, should transition to lightline or vim's built-in statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Startup screen
Plugin 'mhinz/vim-startify'

" distraction free writing
Plugin 'junegunn/goyo.vim'


"""""""""""""""""""""""""""""""""""""""
"       GIT PLUGINS                   "
"""""""""""""""""""""""""""""""""""""""

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-rhubarb.git'

" extend fugitive with better branch and commit views
Plugin 'gregsexton/gitv'

" git gutter
Plugin 'airblade/vim-gitgutter'

"""""""""""""""""""""""""""""""""""""""
"       CONVENIENCE                   "
"""""""""""""""""""""""""""""""""""""""

" comment stuff out
Plugin 'tpope/vim-commentary'

" allow easy surrouding
Plugin 'tpope/vim-surround'

" all comma objects to be a real object
Plugin 'austintaylor/vim-commaobject'

" change between single line and multi line constructs
Plugin 'AndrewRadev/splitjoin.vim'

" Easy movement along a line with f and t
Plugin 'unblevable/quick-scope'

" Use editorconfig files if found
Plugin 'editorconfig/editorconfig-vim'

" Check code syntax
Plugin 'w0rp/ale'

"""""""""""""""""""""""""""""""""""""""
"       CODE COMPLETION               "
"""""""""""""""""""""""""""""""""""""""

" " TODO remove YouCompleteMe, look into deocomplete
" " On servers, probably want to just use ervandew/supertab since it's
" "   more lightweight and doesn't require compilations
" " Plugin 'ervandew/supertab'
" Plugin 'Valloric/YouCompleteMe'
"
Plugin 'lifepillar/vim-mucomplete'

"""""""""""""""""""""""""""""""""""""""
"       PROJECT CONTEXT               "
"""""""""""""""""""""""""""""""""""""""

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Use fzf for file search, async!
Plugin 'junegunn/fzf.vim'

" Nerdtree
Plugin 'scrooloose/nerdtree.git'


"""""""""""""""""""""""""""""""""""""""
"       LANGUAGE SUPPORT              "
"""""""""""""""""""""""""""""""""""""""
Plugin 'dgryski/vim-godef'
Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rails'
Plugin 'rust-lang/rust.vim'
Plugin 'davidbeckingsale/writegood.vim' " English y'all
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'
Plugin 'cespare/vim-toml' " Toml syntax highlighting
Plugin 'jparise/vim-graphql' 
Plugin 'derekwyatt/vim-scala'
Plugin 'tikhomirov/vim-glsl'
Plugin 'elmcast/elm-vim'
Plugin 'LnL7/vim-nix'
Plugin 'elixir-editors/vim-elixir'
Plugin 'udalov/kotlin-vim'

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
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""
"       SETTINGS                      "
"""""""""""""""""""""""""""""""""""""""

" map capitals, cause my pinky is slow
:command! WQ wq
:command! Wq wq
:command! W w
:command! -bang Q  quit<bang>

" set a map leader for more key combos
let mapleader = '\'
" shortcut to sourcing (reloading) vimrc
:nnoremap <leader>r :source $MYVIMRC<cr>

" shortcut to save
nnoremap <leader>\ :w<cr>

" map ctrl-[ to exit with no checks, and ctrl-c to exit
" terminal.app on macOS has a problem with the next line
" also maybe alacritty with zsh???
" noremap <C-[> <C-c>
" noremap <C-c> <Esc>

" switch because 0 is easier to hit and ^ is more useful
" commented out in favour of using _ for ^. same behaviour when no count
nnoremap ^ 0
nnoremap 0 ^

" Gutentags
" let g:gutentags_ctags_executable_ruby = 'starscope && starscope -e cscope'
" let g:gutentags_ctags_executable_javascript = 'starscope && starscope -e cscope'
" let g:gutentags_ctags_executable_golang = 'starscope && starscope -e cscope'

" Dispatch
autocmd FileType ruby let b:dispatch = 'rspec %'

" splitjoin
let g:splitjoin_ruby_curly_braces = 1
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

nmap sj :SplitjoinJoin<cr>
nmap sk :SplitjoinSplit<cr>

" mu autocomplete 
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert,popup,menu
let g:mucomplete#enable_auto_at_startup = 1
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion

" QuickScope options
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

" Set Vundle to use ssh
let g:vundle_default_git_proto = 'git'

" fzf
let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
" Default fzf layout
let g:fzf_layout = { 'down': '~25%' }
nnoremap <C-P> :Files<CR>
nnoremap <leader>b :Buffers<Cr>
" Add Find command to use rg in fzf
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything
"  in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find
            \ call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" search directory for word under cursor
nnoremap <Leader>sW :execute ":Find " . expand("<cWORD>")<CR>
nnoremap <Leader>sw :execute ":Find " . expand("<cword>")<CR>
vnoremap <leader>sw y:Find<SPACE><C-R>"<CR>
" Search for selection
vnoremap // y/<C-R>"<CR>

"editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" " use fugitive to get a list of commits used in startify
" function! s:list_commits()
"     let git = 'git'
"     let commits = systemlist(git .' log --oneline | head -n10')
"     let git = 'G'. git[1:]
"     return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
" endfunction

" fugitive
function! GalaxyUrl(opts, ...) abort
    if a:0 || type(a:opts) != type({})
        return ''
    endif

    let remote = matchlist(a:opts.remote, '\v^galaxy::(.{-1,})(\.git)?$')
    if empty(remote)
        return ''
    end

    let opts = copy(a:opts)
    let opts.remote = "https://github.com/" . remote[1] . ".git"
    return call("rhubarb#FugitiveUrl", [opts])
endfunction

if !exists('g:fugitive_browse_handlers')
    let g:fugitive_browse_handlers = []
endif

if index(g:fugitive_browse_handlers, function('GalaxyUrl')) < 0
    call insert(g:fugitive_browse_handlers, function('GalaxyUrl'))
endif

" startify
let g:startify_padding_left = 3
let g:startify_lists = [
    \ { 'type': 'dir', 'header': ['MRU '.getcwd()] },
    \ { 'type': 'sessions', 'header': ['Sessions'] },
    \ { 'type': 'bookmarks', 'header': ['Bookmarks'] },
    \ { 'type': 'commands', 'header': ['Commands'] },
    \ ]
    " \ { 'type': function('s:list_commits'), 'header': ['Commits'] },
let g:startify_bookmarks = [ '~/.vimrc', '~/.zshrc' ]
let g:startify_change_to_vcs_root = 1
" Update old files on the fly
let g:startify_update_oldfiles = 0
let g:startify_custom_header = ['']
" Set cursorline
autocmd User Startified setlocal cursorline

" ALE
nnoremap <LEADER>af :ALEFix<CR>
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'javascript': ['eslint', 'remove_trailing_lines', 'prettier'],
            \ 'ruby': ['trim_whitespace', 'rubocop'],
            \ 'javascript.jsx': ['prettier', 'eslint'],
            \ 'typescript': ['prettier', 'eslint', 'tslint --jsx'],
            \ 'typescript.tsx': ['prettier', 'eslint', 'tslint --jsx'],
            \ 'rust': ['rustfmt'],
            \ }
let g:ale_linters = {
            \'ruby': ['rubocop', 'ruby']
            \ }

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1

" let g:ale_ruby_rubocop_executable = 'bundle'
" let g:ale_ruby_rubocop_options = '--display-cop-names --rails'
" let g:ruby_indent_assignment_style = 'variable'

let g:ale_virtualenv_dir_names = []

" completion
let g:ale_completion_enabled = 0
" let g:ale_ruby_solargraph_executable = 'solargraph'

map <buffer> K <plug>(ale_hover)
map <buffer> <c-]> <plug>(ale_go_to_definition)
map <buffer> <c-}> <plug>(ale_go_to_definition_in_vsplit)
map <buffer> <c-t> <plug>(ale_go_to_type_definition)

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" airline
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline_detect_paste=0
let g:airline_detect_modified=1
let g:airline_detect_spell=0
let g:airline_inactive_collapse=0
let g:airline#extensions#tmuxline#enabled = 0 " we use tmuxline plugin
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_exclude_preview = 1
let g:airline_focuslost_inactive = 1

let g:airline_section_x = ''
let g:airline_section_y = ''
  
" javascript
let g:javascript_plugin_flow = 1

" " you complete me
" " compatability https://github.com/SirVer/ultisnips/issues/512
" let g:ycm_allow_changing_updatetime = 1         " leave my updatetime alone
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"supertab
" let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:SuperTabNoCompleteAfter = ['^', ',', '\s']

" UtilSnips
" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" set completeopt="menu" " remove preview from completeopt

"tmuxline
let g:tmuxline_powerline_separators = 0

" set git gutter to update faster
set updatetime=100
set signcolumn=yes

" Open Netrw in a vsplit
noremap <leader>n :Vexplore<CR>
" Default netrw to tree view
let g:netrw_liststyle = 3
" Remove the banner
let g:netrw_banner = 0
let g:netrw_winsize = 30
" Change how files are opened by default
" 0 - current netrw window (default)
" 1 - open files in a new horizontal split
" 2 - open files in a new vertical split
" 3 - open files in a new tab
" 4 - open in previous window
let g:netrw_browse_split = 4
let g:netrw_preview=1

hi! vertsplit guifg=fg guibg=fg term=NONE

" set ruby to not do expensive syntax highlighting
let ruby_no_expensive=1

" column length
" this is for readability
set colorcolumn=80

" set line the cursor is on to be highlighted
set cursorline

" Improved indentation on newline
set autoindent
set smartindent

" spell sugesstion window at 15 entries
set spellsuggest=15

" set wrap on word
set linebreak

" keep the cursor away from the bottom of the screen
set scrolloff=3

" Tab control
set expandtab               " insert spaces for tabs
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2               " the visible width of tabs
set softtabstop=2           " edit as if the tabs are 4 characters wide
set shiftwidth=2            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'
" set completeopt+=longest

" code folding settings
set foldmethod=indent       " fold based on indent
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=2

" set default yank/copy/delete buffer to be system clipboard
set clipboard=unnamed

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

set splitbelow              " New window goes below
set splitright              " New windows goes right
set termguicolors           " Enable true color support
set undofile                " Persistent Undo

" Set colours
if !exists("g:syntax_on")
    syntax enable
endif

" Ctrl-l to remove clear search highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Ruby is an oddball in the family, use special spacing/rules
autocmd FileType ruby setlocal regexpengine=1 ts=2 sts=2 sw=2 expandtab shiftwidth=2 tabstop=2

" relative line numbers only in active buffer
set number
set relativenumber
set numberwidth=4
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * set norelativenumber
augroup END

" While scrolling, VIM blanks the background sometimes.  This fixes that
" behaviour.
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    set t_ut=
endif

" Split single line in multiple after comma ,
command! NewLineAfterComma %s/,/,\r/g

" make comments and HTML attributes italic
highlight htmlArg cterm=italic

" TrueColor (24-bit) colorscheme
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
" execute "set t_8b=\e[48;2;%lu;%lu;%lum"

" Set the colorscheme to solarized
set background=dark
colorscheme solarized8
let g:solarized_term_italics = 0
let g:solorized_old_cursor_style = 1
let g:solarized_visibility = "high"
let g:solarized_diffmode = "high"

" Toggle light and dark solarized
" nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
"     \ ? substitute(g:colors_name, 'dark', 'light', '')
"     \ : substitute(g:colors_name, 'light', 'dark', '')
"     \ )<cr>

" Break insert mode at punctuation
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap , ,<c-g>u

" up and down do expected things
noremap j gj
noremap k gk

" Spellchecking
nnoremap <leader>s :setlocal spell<cr>

" Don't overrite the register when pasting
vnoremap p "_dP

" working on a plugin
set runtimepath+=~/src/github.com/Shopify/vim-devilish/

" maybe make an arglist fzf command
" fun! something() abort
"   " TODO add support for Denite and potentially other fuzzy finders
"   if exists('*fzf#run')
"     call fzf#run(fzf#wrap({
"           \ 'source':  '/opt/dev/bin/dev cd --list',
"           \ 'sink*': function('s:cd')
"           \ }))
"   else
"     echohl Error | echom 'Try doing a `:Dev cd <repo>` with tab-completion. Interactive selection requires fzf.vim' | echohl None
"   endif
" endf
