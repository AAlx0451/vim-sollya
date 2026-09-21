" Vim syntax file
" Language:    Sollya
" Maintainer:  AAlx0451 <https://github.com/AAlx0451>
" URL:         https://github.com/AAlx0451

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpoptions
set cpoptions&vim

" Control flow keywords
syn keyword sollyaConditional  if then else
syn keyword sollyaRepeat       while for from to by in do
syn keyword sollyaStatement    proc procedure return nop match with
syn keyword sollyaControl      restart quit rename

" Variables and predefined identifiers
syn keyword sollyaDeclaration  var
syn keyword sollyaFreeVar      _x_
syn keyword sollyaPredefVar    __argv __unique_id __program_name

" Booleans and special constants
syn keyword sollyaBoolean      true false
syn keyword sollyaSpecialConst void error default on off pi
syn keyword sollyaSpecialConst infty NaN
syn match   sollyaSpecialConst '@NaN@'
syn match   sollyaSpecialConst '@Inf@'

" Display and rounding modes
syn keyword sollyaMode         decimal binary dyadic powers hexadecimal
syn keyword sollyaRoundingMode RN RD RU RZ
syn keyword sollyaModifier     absolute relative fixed floating perturb honorcoeffprec
syn keyword sollyaFileType     file postscript postscriptfile

" Types
syn keyword sollyaType         boolean constant function integer range string object
syn match   sollyaType         'list\s\+of'

" Numerical formats
syn keyword sollyaFormat       halfprecision single double doubleextended
syn keyword sollyaFormat       doubledouble quad tripledouble
syn keyword sollyaFormat       HP SG D DE DD QD TD

" Built-in functions and commands
syn keyword sollyaFunction     abs accurateinfnorm acos acosh annotatefunction asciiplot
syn keyword sollyaFunction     asin asinh atan atanh autodiff autosimplify
syn keyword sollyaFunction     bashevaluate bashexecute bezout bind canonical ceil
syn keyword sollyaFunction     chebyshevform checkinfnorm coeff composepolynomials
syn keyword sollyaFunction     cos cosh degree denominator diam dieonerrormode diff
syn keyword sollyaFunction     dirtyfindzeros dirtyinfnorm dirtyintegral dirtysimplify
syn keyword sollyaFunction     display div erf erfc evaluate execute exp expand
syn keyword sollyaFunction     expm1 exponent externaldata externalplot externalproc
syn keyword sollyaFunction     findzeros floor fpminimax fullparentheses gcd
syn keyword sollyaFunction     getbacktrace getsuppressedmessages guessdegree head
syn keyword sollyaFunction     hopitalrecursions horner implementconstant implementpoly
syn keyword sollyaFunction     inf infnorm interpolate isbound isevaluable length
syn keyword sollyaFunction     library libraryconstant log log10 log1p log2 mantissa
syn keyword sollyaFunction     max mid midpointmode min mod nearestint numberroots
syn keyword sollyaFunction     numerator objectname parse plot points prec precision
syn keyword sollyaFunction     print printdouble printexpansion printsingle printxml
syn keyword sollyaFunction     rationalapprox rationalmode readfile readxml remez revert
syn keyword sollyaFunction     round roundcoefficients roundcorrectly roundingwarnings
syn keyword sollyaFunction     searchgal showmessagenumbers simplify sin sinh sort
syn keyword sollyaFunction     sqrt subpoly substitute sup supnorm suppressmessage
syn keyword sollyaFunction     tail tan tanh taylor taylorform taylorrecursions
syn keyword sollyaFunction     time timing unsuppressmessage verbosity worstcase write

" Comments
syn keyword sollyaTodo         contained TODO FIXME XXX BUG NOTE
syn match   sollyaCommentLine  '//.*$' contains=sollyaTodo,@Spell
syn match   sollyaCommentLine  '#.*$' contains=sollyaTodo,@Spell
syn region  sollyaCommentBlock start='/\*' end='\*/' contains=sollyaTodo,@Spell

" Strings and escape sequences
syn match   sollyaEscape       display contained '\\\([ntrvabf?''"\\]\|x\x\{2\}\|[0-7]\{1,3\}\)'
syn region  sollyaString       start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=sollyaEscape,@Spell

" Numbers and numeric literals
" Hexadecimal floats (e.g. 0x1.14p4, 0x4031400000000000)
syn match   sollyaHexNumber    display '\<0x[0-9a-fA-F]\+\(\.[0-9a-fA-F]\+\)\?\(p[+-]\?\d\+\)\?\>'
" Binary literals (e.g. 1.000101_2, 1_2)
syn match   sollyaBinNumber    display '\<[01]\+\(\.[01]\+\)\?_2\>'
" Dyadic numbers (e.g. 69b-2, 330700b-165)
syn match   sollyaDyadicNumber display '\<\d\+b[+-]\?\d\+\>'
" Midpoint notation (e.g. 0.17~2/5~e5)
syn match   sollyaMidpoint     display '\d\+\(\.\d\+\)\?\~\d\+\(/\d\+\)\?\~\(e[+-]\?\d\+\)\?'
" Precision-annotated constants (e.g. %24%0.1)
syn match   sollyaPrecNumber   display '%\d\+%\d\+\(\.\d\+\)\?\(e[+-]\?\d\+\)\?'
" Decimal integers and standard floats
syn match   sollyaNumber       display '\<\d\+\(\.\d\+\)\?\(e[+-]\?\d\+\)\?\>'

" Operators and delimiters
syn match   sollyaOperator     '[-+*/^!]'
syn match   sollyaOperator     ':='
syn match   sollyaOperator     '='
syn match   sollyaOperator     '==\|!=\|<=\|>=\|<\|>'
syn match   sollyaOperator     '&&\|||'
syn match   sollyaOperator     '@'
syn match   sollyaOperator     '\.\:\|\:\.'
syn match   sollyaOperator     '\~'
syn match   sollyaDelimiter    '[;,]'

" Sollya list brackets [| and |]
syn match   sollyaListBracket  '\[|'
syn match   sollyaListBracket  '|\]'

" Highlighting links
hi def link sollyaConditional       Conditional
hi def link sollyaRepeat            Repeat
hi def link sollyaStatement         Statement
hi def link sollyaControl           Keyword
hi def link sollyaDeclaration       Type
hi def link sollyaFreeVar           Special
hi def link sollyaPredefVar         Identifier
hi def link sollyaBoolean           Boolean
hi def link sollyaSpecialConst      Constant
hi def link sollyaMode              StorageClass
hi def link sollyaRoundingMode      PreProc
hi def link sollyaModifier          Type
hi def link sollyaFileType          Special
hi def link sollyaType              Type
hi def link sollyaFormat            Typedef
hi def link sollyaFunction          Function
hi def link sollyaTodo              Todo
hi def link sollyaCommentLine       Comment
hi def link sollyaCommentBlock      Comment
hi def link sollyaEscape            SpecialChar
hi def link sollyaString            String
hi def link sollyaHexNumber         Number
hi def link sollyaBinNumber         Number
hi def link sollyaDyadicNumber      Number
hi def link sollyaMidpoint          Number
hi def link sollyaPrecNumber        SpecialComment
hi def link sollyaNumber            Number
hi def link sollyaOperator          Operator
hi def link sollyaDelimiter         Delimiter
hi def link sollyaListBracket       Delimiter

let b:current_syntax = "sollya"

let &cpoptions = s:cpo_save
unlet s:cpo_save
