" run time paths
set runtimepath+=~/.vim/pack/plugins/start

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off
      
" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

"config files syntax
setf dosini

" Security
set modelines=0

" hybrid line number
set number relativenumber

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
augroup END

" highlight active line number
"set cursorline
"hi cursorline cterm=none term=none
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline
"highlight CursorLine guibg=#303000 ctermbg=234

" make the color of highlight transparent

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" White spaces
"   
" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" nerdtree keymap
map <C-n> :NERDTreeToggle<CR>

" nerd tree settings
let g:NERDTreeFileExtensionHighlightFullName=1
let g:NERDTreeExactMatchHighlightFullName=1
let g:NERDTreePatternMatchHighlightFullName=1
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:NERDTreeGitStatusNodeColorization=1
let NERDTreeShowHidden=1

" indent line settings
let g:indentLine_char='|'

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
"let g:onedark_termcolors=256
set background=dark

"gruv box color scheme
"let g:gruvbox_invert_indent_guides=1
"let g:gruvbox_contrast_dark='hard'
"colorscheme darkocean
colorscheme ayu
hi Normal guibg=NONE ctermbg=NONE

"light line color scheme
let g:lightline = {}
let g:lightline.colorscheme = 'wombat'




"python3 highlight
" Keywords {{{
" ============

syn keyword pythonStatement break continue del
syn keyword pythonStatement exec return
syn keyword pythonStatement pass raise
syn keyword pythonStatement global nonlocal assert
syn keyword pythonStatement yield
syn keyword pythonLambdaExpr lambda
syn keyword pythonStatement with as

syn keyword pythonStatement def nextgroup=pythonFunction skipwhite
syn match pythonFunction "\%(\%(def\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonVars
syn region pythonVars start="(" skip=+\(".*"\|'.*'\)+ end=")" contained contains=pythonParameters transparent keepend
syn match pythonParameters "[^,]*" contained contains=pythonParam skipwhite
syn match pythonParam "[^,]*" contained contains=pythonExtraOperator,pythonLambdaExpr,pythonBuiltinObj,pythonBuiltinType,pythonConstant,pythonString,pythonNumber,pythonBrackets,pythonSelf,pythonComment skipwhite
syn match pythonBrackets "{[(|)]}" contained skipwhite

syn keyword pythonStatement class nextgroup=pythonClass skipwhite
syn match pythonClass "\%(\%(class\s\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonClassVars
syn region pythonClassVars start="(" end=")" contained contains=pythonClassParameters transparent keepend
syn match pythonClassParameters "[^,\*]*" contained contains=pythonBuiltin,pythonBuiltinObj,pythonBuiltinType,pythonExtraOperatorpythonStatement,pythonBrackets,pythonString,pythonComment skipwhite

syn keyword pythonRepeat        for while
syn keyword pythonConditional   if elif else
syn keyword pythonInclude       import from
syn keyword pythonException     try except finally
syn keyword pythonOperator      and in is not or

syn match pythonExtraOperator "\%([~!^&|/%+-]\|\%(class\s*\)\@<!<<\|<=>\|<=\|\%(<\|\<class\s\+\u\w*\s*\)\@<!<[^<]\@=\|===\|==\|=\~\|>>\|>=\|=\@<!>\|\.\.\.\|\.\.\|::\)"
syn match pythonExtraPseudoOperator "\%(-=\|/=\|\*\*=\|\*=\|&&=\|&=\|&&\|||=\||=\|||\|%=\|+=\|!\~\|!=\)"

syn keyword pythonStatement print

syn keyword pythonStatement async await
syn match pythonStatement "\<async\s\+def\>" nextgroup=pythonFunction skipwhite
syn match pythonStatement "\<async\s\+with\>" display
syn match pythonStatement "\<async\s\+for\>" nextgroup=pythonRepeat skipwhite

syn match pythonExtraOperator "\%(=\)"

syn match pythonExtraOperator "\%(\*\|\*\*\)"
 
syn keyword pythonSelf self cls

" }}}


" Decorators {{{
" ==============

syn match   pythonDecorator "@" display nextgroup=pythonDottedName skipwhite
syn match   pythonDottedName "[a-zA-Z_][a-zA-Z0-9_]*\(\.[a-zA-Z_][a-zA-Z0-9_]*\)*" display contained
syn match   pythonDot        "\." display containedin=pythonDottedName

" }}}


" Comments {{{
" ============

syn match   pythonComment   "#.*$" display contains=pythonTodo,@Spell
syn match   pythonRun       "\%^#!.*$"
syn match   pythonCoding    "\%^.*\(\n.*\)\?#.*coding[:=]\s*[0-9A-Za-z-_.]\+.*$"
syn keyword pythonTodo      TODO FIXME XXX contained

" }}}


" Errors {{{
" ==========

syn match pythonError       "\<\d\+\D\+\>" display
syn match pythonError       "[$?]" display
syn match pythonError       "[&|]\{2,}" display
syn match pythonError       "[=]\{3,}" display
syn match pythonIndentError "^\s*\( \t\|\t \)\s*\S"me=e-1 display


syn match pythonSpaceError  "\s\+$" display



" Strings {{{
" ===========

syn region pythonString     start=+[bB]\='+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,@Spell
syn region pythonString     start=+[bB]\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,@Spell
syn region pythonString     start=+[bB]\="""+ end=+"""+ keepend contains=pythonEscape,pythonEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonString     start=+[bB]\='''+ end=+'''+ keepend contains=pythonEscape,pythonEscapeError,pythonDocTest,pythonSpaceError,@Spell

syn match  pythonEscape     +\\[abfnrtv'"\\]+ display contained
syn match  pythonEscape     "\\\o\o\=\o\=" display contained
syn match  pythonEscapeError    "\\\o\{,2}[89]" display contained
syn match  pythonEscape     "\\x\x\{2}" display contained
syn match  pythonEscapeError    "\\x\x\=\X" display contained
syn match  pythonEscape     "\\$"

 " Unicode
syn region pythonUniString  start=+[uU]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,@Spell
syn region pythonUniString  start=+[uU]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,@Spell
syn region pythonUniString  start=+[uU]"""+ end=+"""+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonUniString  start=+[uU]'''+ end=+'''+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell

syn match  pythonUniEscape          "\\u\x\{4}" display contained
syn match  pythonUniEscapeError     "\\u\x\{,3}\X" display contained
syn match  pythonUniEscape          "\\U\x\{8}" display contained
syn match  pythonUniEscapeError     "\\U\x\{,7}\X" display contained
syn match  pythonUniEscape          "\\N{[A-Z ]\+}" display contained
syn match  pythonUniEscapeError "\\N{[^A-Z ]\+}" display contained

" Raw strings
syn region pythonRawString  start=+[rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawString  start=+[rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawString  start=+[rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
syn region pythonRawString  start=+[rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell

syn match pythonRawEscape           +\\['"]+ display transparent contained

" Unicode raw strings
syn region pythonUniRawString   start=+[uU][rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
syn region pythonUniRawString   start=+[uU][rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
syn region pythonUniRawString   start=+[uU][rR]"""+ end=+"""+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonUniRawString   start=+[uU][rR]'''+ end=+'''+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest,pythonSpaceError,@Spell

syn match  pythonUniRawEscape   "\([^\\]\(\\\\\)*\)\@<=\\u\x\{4}" display contained
syn match  pythonUniRawEscapeError  "\([^\\]\(\\\\\)*\)\@<=\\u\x\{,3}\X" display contained

" String formatting
syn match pythonStrFormatting   "%\(([^)]\+)\)\=[-#0 +]*\d*\(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syn match pythonStrFormatting   "%[-#0 +]*\(\*\|\d\+\)\=\(\.\(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString

" Str.format syntax
syn match pythonStrFormat "{{\|}}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syn match pythonStrFormat "{\([a-zA-Z0-9_]*\|\d\+\)\(\.[a-zA-Z_][a-zA-Z0-9_]*\|\[\(\d\+\|[^!:\}]\+\)\]\)*\(![rs]\)\=\(:\({\([a-zA-Z_][a-zA-Z0-9_]*\|\d\+\)}\|\([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*\(\.\d\+\)\=[bcdeEfFgGnoxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString

" String templates
syn match pythonStrTemplate "\$\$" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syn match pythonStrTemplate "\${[a-zA-Z_][a-zA-Z0-9_]*}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syn match pythonStrTemplate "\$[a-zA-Z_][a-zA-Z0-9_]*" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString

" DocTests
syn region pythonDocTest    start="^\s*>>>" end=+'''+he=s-1 end="^\s*$" contained
syn region pythonDocTest2   start="^\s*>>>" end=+"""+he=s-1 end="^\s*$" contained

" DocStrings
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError


" }}}

" Numbers {{{
" ===========

syn match   pythonHexError  "\<0[xX]\x*[g-zG-Z]\x*[lL]\=\>" display
syn match   pythonHexNumber "\<0[xX]\x\+[lL]\=\>" display
syn match   pythonOctNumber "\<0[oO]\o\+[lL]\=\>" display
syn match   pythonBinNumber "\<0[bB][01]\+[lL]\=\>" display
syn match   pythonNumber    "\<\d\+[lLjJ]\=\>" display
syn match   pythonFloat "\.\d\+\([eE][+-]\=\d\+\)\=[jJ]\=\>" display
syn match   pythonFloat "\<\d\+[eE][+-]\=\d\+[jJ]\=\>" display
syn match   pythonFloat "\<\d\+\.\d*\([eE][+-]\=\d\+\)\=[jJ]\=" display
syn match   pythonOctError  "\<0[oO]\=\o*[8-9]\d*[lL]\=\>" display
syn match   pythonBinError  "\<0[bB][01]*[2-9]\d*[lL]\=\>" display

" }}}

" Builtins {{{
" ============

" Builtin objects and types
syn keyword pythonBuiltinObj True False Ellipsis None NotImplemented
syn keyword pythonBuiltinObj __debug__ __doc__ __file__ __name__ __package__
 
syn keyword pythonBuiltinType type object
syn keyword pythonBuiltinType str basestring unicode buffer bytearray bytes chr unichr
syn keyword pythonBuiltinType dict int long bool float complex set frozenset list tuple
syn keyword pythonBuiltinType file super

" Builtin functions
syn keyword pythonBuiltinFunc   __import__ abs all any apply
syn keyword pythonBuiltinFunc   bin callable classmethod cmp coerce compile
syn keyword pythonBuiltinFunc   delattr dir divmod enumerate eval execfile filter
syn keyword pythonBuiltinFunc   format getattr globals locals hasattr hash help hex id
syn keyword pythonBuiltinFunc   input intern isinstance issubclass iter len map max min
syn keyword pythonBuiltinFunc   next oct open ord pow property range xrange
syn keyword pythonBuiltinFunc   raw_input reduce reload repr reversed round setattr
syn keyword pythonBuiltinFunc   slice sorted staticmethod sum vars zip

syn keyword pythonBuiltinFunc   print


" Builtin exceptions and warnings
syn keyword pythonExClass   BaseException
syn keyword pythonExClass   Exception StandardError ArithmeticError
syn keyword pythonExClass   LookupError EnvironmentError
syn keyword pythonExClass   AssertionError AttributeError BufferError EOFError
syn keyword pythonExClass   FloatingPointError GeneratorExit IOError
syn keyword pythonExClass   ImportError IndexError KeyError
syn keyword pythonExClass   KeyboardInterrupt MemoryError NameError
syn keyword pythonExClass   NotImplementedError OSError OverflowError
syn keyword pythonExClass   ReferenceError RuntimeError StopIteration
syn keyword pythonExClass   SyntaxError IndentationError TabError
syn keyword pythonExClass   SystemError SystemExit TypeError
syn keyword pythonExClass   UnboundLocalError UnicodeError
syn keyword pythonExClass   UnicodeEncodeError UnicodeDecodeError
syn keyword pythonExClass   UnicodeTranslateError ValueError VMSError
syn keyword pythonExClass   WindowsError ZeroDivisionError
syn keyword pythonExClass   Warning UserWarning BytesWarning DeprecationWarning
syn keyword pythonExClass   PendingDepricationWarning SyntaxWarning
syn keyword pythonExClass   RuntimeWarning FutureWarning
syn keyword pythonExClass   ImportWarning UnicodeWarning


" }}}

" Enhanced python highlighting
highlight pythonLambdaExpr      ctermfg=105 guifg=#8787ff
highlight pythonInclude         ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold
highlight pythonClass           ctermfg=167 guifg=#FF62B0 cterm=bold gui=bold
highlight pythonParameters      ctermfg=147 guifg=#AAAAFF
highlight pythonParam           ctermfg=175 guifg=#E37795
highlight pythonBrackets        ctermfg=183 guifg=#d7afff
highlight pythonClassParameters ctermfg=111 guifg=#FF5353
highlight pythonSelf            ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold

highlight pythonDottedName      ctermfg=74  guifg=#5fafd7

highlight pythonError           ctermfg=196 guifg=#ff0000
highlight pythonIndentError     ctermfg=197 guifg=#ff005f
highlight pythonSpaceError      ctermfg=198 guifg=#ff0087

highlight pythonBuiltinType     ctermfg=74  guifg=#9191FF
highlight pythonBuiltinObj      ctermfg=71  guifg=#5faf5f
highlight pythonBuiltinFunc     ctermfg=169 guifg=#d75faf cterm=bold gui=bold

highlight pythonException       ctermfg=207 guifg=#CC3366 cterm=bold gui=bold
