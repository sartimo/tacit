\d .g

x:{[n;f]{:[n>#y;'"G stack";(x;((-n)_ y),,f .(-n)#y;z)]}}                                        / (x;y,,r;z)
y:{[n;f]{:[n>#y;'"G stack";(x;((-n)_ y),f .(-n)#y;z)]}}                                         / (x;y,r;z)
z:{[n;f]{:[n>#y;'"G stack";(x;(-n)_ y;(f .(-n)#y),z)]}}                                         / (x;y;r,z)
w:{[n;f]{:[_abs[n]>(#y;#z)n<0;'"G ",$`stack`queue n<0;f[x;y]z]}}                                / (x';y';z')

O:+(("+"  ;x[2;+])                                                                              / add
    ("-"  ;x[2;-])                                                                              / sub
    ("*"  ;x[2;*])                                                                              / mul
    ("%"  ;x[2;%])                                                                              / div
    ("_"  ;x[1;_:])                                                                             / floor
    ("^"  ;x[2;^])                                                                              / power
    ("="  ;x[2;=])                                                                              / equal
    (">"  ;x[2;>])                                                                              / more
    ("&"  ;x[2;&])                                                                              / and/min
    ("<"  ;x[1;{:[~@x;<x;~1=4:x;'"G nonce: <";!x]}])                                            / enum/up
    ("?"  ;x[2;{:[@x;y!x;x?y]}])                                                                / find/mod
    ("{"  ;x[1;=:])                                                                             / group 
    ("}"  ;x[1;?:])                                                                             / unique 
    ("("  ;x[2;#])                                                                              / take/reshape
    (")"  ;x[2;{:[(@y)&~@x;y!x;x _(),y]}])                                                      / drop/cut/rotate
    ("|"  ;x[1;|:])                                                                             / reverse
    ("@"  ;x[1;{:[~t:4:x;+x;1=_abs t;&x;'"G nonce: @"]}])                                       / where/flip
    ("~"  ;x[2;~])                                                                              / match
    ("#"  ;x[1;^:])                                                                             / shape
    ("."  ;w[1;{(x;(-1_ y),,m[x;*-1#y];z)}])                                                    / infra/amend
    ("'"  ;w[-1;{(x;y,,,*z;1_ z)}])                                                             / quote
    ("!"  ;z[1;::])                                                                             / unquote
    (","  ;x[2;,])                                                                              / join
    ("`"  ;w[1;{x,{(y,z;x)}[z]. n[*-1#y;-1_ y]}])                                               / s->s
    ("$"  ;w[1;{x,e[x;(-1_ y;z);*-1#y]1}])                                                      / state
    ("/"  ;w[3;{(x;(-3_ y),+{z[0]{-1#e[*x;x[1],y,z;x 2]1}[(x;y;z 2)]/+z 1}[x;-3_ y;-3#y];z)}])  / over
    ("\\" ;w[3;{(x;(-3_ y),+{z[0]{-1#e[*x;x[1],y,z;x 2]1}[(x;y;z 2)]\+z 1}[x;-3_ y;-3#y];z)}])  / under
    (":"  ;w[2;{(x;(-2_ y),,{{*-1#e[*x;x[1],y;x 2]1}[(x;y;z 1)]'+*z}[x;-2_ y;-2#y];z)}])        / each
    (";"  ;w[2;{(x;(-2_ y),,{{*-1#e[*x;x[1],y,z;x 2]1}[(x;y;z 1)]':*z}[x;-2_ y;-2#y];z)}]))     / prior

K:.((`type      ;x[1;4::])
    (`log       ;x[1;_log])
    (`exp       ;x[1;_exp])
    (`abs       ;x[1;_abs])
    (`sqr       ;x[1;_sqr])
    (`sqrt      ;x[1;_sqrt])
    (`floor     ;x[1;_floor])
    (`dot       ;x[2;_dot])
    (`mul       ;x[2;_mul])
    (`inv       ;x[1;_inv])
    (`lsq       ;x[2;_lsq])
    (`sin       ;x[1;_sin])
    (`cos       ;x[1;_cos])
    (`tan       ;x[1;_tan])
    (`asin      ;x[1;_asin])
    (`acos      ;x[1;_acos])
    (`atan      ;x[1;_atan])
    (`sinh      ;x[1;_sinh])
    (`cosh      ;x[1;_cosh])
    (`tanh      ;x[1;_tanh])
    (`draw      ;x[2;_draw])
    (`in        ;x[2;_in])
    (`lin       ;x[2;_lin])
    (`bin       ;x[2;_bin])
    (`binl      ;x[2;_binl])
    (`dv        ;x[2;_dv])
    (`dvl       ;x[2;_dvl])
    (`di        ;x[2;_di])
    (`vs        ;x[2;_vs])
    (`sv        ;x[2;_sv]))

I:.((`b         ;w[1;{'$**-1#y;(x;-1_ y;z)}])                                                   / break
    (`c         ;w[0;{z;E::. S::();G();(E;();())}])                                             / clear
    (`d         ;w[1;{(x;(-1_ y),((),`$_ssr[;".";"_"]'$*-1#y)_lin!x;z)}])                       / defined?
    (`e         ;w[1;{."\\e ",$*-1#y;(x;-1_ y;z)}])                                             / error
    (`g         ;w[0;{J::0;I[`c][x;y]z}])                                                       / G
    (`j         ;w[0;{J::1;I[`c][x;y]z}])                                                       / Joy
    (`k         ;w[0;{.m.r@," ";(x;y;z)}])                                                      / exit to k
    (`l         ;w[1;{l@$**-1#y;(x;-1_ y;z)}])                                                  / load file
    (`m         ;w[1;{t:_t;e[x;();*-1#y];(x;y,_t-t;z)}])                                        / measure time (ms)
    (`o         ;w[1;{`0:h f@,o[x;*-1#y];(x;-1_ y;z)}])                                         / word-form
    (`p         ;w[1;{."\\p ",$*-1#y;(x;-1_ y;z)}])                                             / print precision
    (`r         ;w[0;{(x;y;p[0:`],z)}])                                                         / read
    (`s         ;w[2;{{("g/",$*x,".","gj"J)6:h f@,/y}.|-2#y;(x;-2_ y;z)}])                      / store file
    (`t         ;w[1;{T::*-1#y;(x;-1_ y;z)}])                                                   / set T
    (`u         ;w[1;{(x{:[y _in!x;x _di y;x]}/`$_ssr[;".";"_"]'$*-1#y;-1_ y;z)}])              / undefine
    (`v         ;w[0;{`0:,f@!x;(x;y;z)}])                                                       / variables
    (`x         ;w[0;{z;_exit 0}])                                                              / exit
    (`w         ;w[1;{`0:,h f@*-1#y;(x;-1_ y;z)}])                                              / write
    (`z         ;w[0;{`0:,"y: ",h f y;`0:,"z: ",h f z;:[#0:`;0#';::](x;y;z)}]))                 / halt

L:.((`syms      ;0#`)                                                                           / empty syms
    (`ints      ;!0)                                                                            / empty ints
    (`floats    ;0#0.)                                                                          / empty floats
    (`sym       ;`)                                                                             / prototype sym
    (`null      ;)                                                                              / null
    (`Inf       ;0I)                                                                            / maxint
    (`Nan       ;0N)                                                                            / minint
    (`inf       ;0i)                                                                            / infinity
    (`nan       ;0n))                                                                           / NaN

C:(" \n\r\t"                                                                                    / blanks
   "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"                                       / letters
   "0123456789"                                                                                 / digits
   ,"."                                                                                         / dot/decimal
   ,"-"                                                                                         / neg/sub/shuffle
   ,"\"")                                                                                       / quote

V:" a-An.NqQoO"                                                                                 / states
W:V?/:" AQoO"                                                                                   / end-states

X:(" anooqo"                                                                                    / blank
   " ana-qo"                                                                                    / name1
   " Anooqo"                                                                                    / shuffle
   " Anooqo"                                                                                    / name2
   " an.oqo"                                                                                    / num1
   " aNooqo"                                                                                    / dot
   " aNooqo"                                                                                    / num2
   "qqqqqQq"                                                                                    / open quote
   " anooqo"                                                                                    / close quote
   " anOOqO"                                                                                    / operator
   " anooqo")                                                                                   / next operator

Z:{{.[x;(;y);:;z]}/[(#x)#,&256;_ic y;+x]}[V?/:/:X]C,,"`[]",O[0]_dvl".-"                         / state machine
p:{(*(r .)/(();!0;v's(&~0=':W _binl 1_0 Z\_ic x)_ x,:" "))_dv""}                                / tokenize, parse
s:{{@[x;&y;"-",]_di&1!y}[x]0{(((*x)_in C 2)|x _in$`inf`Inf)&"-"=*y}':x}                         / sign: - n -> -n

v:{:[(c:*x)_in*C        ;""                                                                     / blank
     (s:`$x)_in!K       ;K s                                                                    / system function
     s _in!L            ;L s                                                                    / literals
     x~"-inf"           ;-0i                                                                    / -inf
     x~"-Inf"           ;-0I                                                                    / -Inf
     c _in C 1          ;s                                                                      / symbol
     (*|x)_in C 2       ;. x                                                                    / number
     c _in C 5          ;:[3<#x;"";(i:`$x 1)_in!I;I i;'"G char: ",x 1]                          / char/string
     c _in*O            ;O[1;O[0]?c]                                                            / operator
                         c]}                                                                    / brackets

r:{:[~#z                ;(x;y;z)                                                                / empty queue
     "["~*z             ;(.[x;y;,;,()];y,#x . y;1_ z)                                           / open list
     "]"~*z             ;(.[x;-1_ y;,;()];-1_ y;1_ z)                                           / close list
                         (.[x;y;{:[y _in L[];x,,y;x,y]};*z];y;1_ z)]}                           / stack

a:{:[-3=t:4:*z;(x;y;z 1);7=t;z[0][x;y]z 1;4=t;b[x;y]z;(x;y,,*z;z 1)]}                           / apply next
b:{:[`~*z:@[z;0;{`$_ssr[$x;".";"_"]}];(x;y,`;z 1);z[0]_in!x;x,c[y;z 1]x@*z;k[x;y]z]}            / evaluate symbol
c:{:[J;(x;z,y);(x,,z;y)]}                                                                       / catenate value
k:{:[~#y;(x;-1_ y;z 1);"-"_in$*z;q[x;y]("-",$*z;z 1);(@[x;*z;:;*-1#y];-1_ y;z 1)]}              / assign symbol
q:{x,{(y,z;x)}[z 1]. n[,/@[`$''1_'(&z[0]="-")_ *z;0;,:];y]}                                     / shuffle
e:{:[#z;2#(a . t .)/(x;y;z,());(x;())]}                                                         / evaluate y on x
f:{(1_,/(" ",g@)'x),""}                                                                         / format

g:{:[7=t:4:x    ;(O[0],($!K),(1!"\"\"",)'$!I)(O[1],K[],I[])?x                                   / function
     3=t        ;1!"\"\"",x                                                                     / char
     x~()       ;"[]"                                                                           / empty list
     x _in L[]  ;$(!L)L[]?x                                                                     / literal
     x~-0i      ;"-inf"                                                                         / -inf
     x~-0I      ;"-Inf"                                                                         / -Inf
     4=t        ;_ssr[$x;"_";"."]                                                               / name
     @x         ;5:x                                                                            / number                                                             
     1=#x       ;"'",_f@*x                                                                      / unit-list
                 1!"][",1_,/" ",'_f'x]}                                                         / list

h:{*({:[2>#z            ;(x,z;y;"")                                                             / done
        "[]"~2#z        ;(x,2#z;y;2_ z)                                                         / nil
        i:(z="[")?0     ;(x,(i#z),:[#x;"\n",(y+i)#"";""];y+i;i _ z)                             / opening [s
        i:(z="]")?0     ;(x,(i#z),"\n",(y-i+1)#"";y-i;i _ z)                                    / closing ]s
                         (x,i#z;y;(i:(z _lin"[]")?1)_ z)]}.)/("";0;x)}                          / not []s

T:()                                                                                            / trace-list
t:{k:0;if[((@T)|(*z)_in(),T)&#y,z;d[y]z;k:(0:`)~," "];(x;y;:[k|~#z;("";());(*z;1_ z)])}         / trace
d:{`0:(40$f x)," \004 ",(-40)$f y}                                                              / display trace

o:{{:[0>t:4:y;y;~t;_f[x]'y;~7=t;y;{(x,z)y?,z}[!x;x[];y]]}[x]:[(1=#y)&-4=4:y;x@*y;y]}            / word-form

m:{:[1=#y               ;e[x;();*y]1                                                            / infra
     2=#y               ;(*y). e[x;();y 1]1                                                     / index
     (4:*y)_in 4 6      ;'"G nonce: ."                                                          / no assignment
     3=#y               ;.@[y;2;{{*-1#e[*x;y,();x 1]1}[(x;y)]}[x]]                              / monad
                         .@[y;2;{{*-1#e[*x;y,,z;x 1]1}[(x;y)]}[x]]]}                            / dyad

n:{:[(#y)<-i:-#*x;'"G pattern";(i _ y;{{i[z;*{j[y]. x}/[(;x);y]]}[y;(),*x]1_ x}[x]i#y)]}        / map pattern 
i:{:[~@x;@[x;_n;_f;y];x _in!y;y x;x]}                                                           / dict -> list
j:{:[~@x;(*{j[y]. x}/[(y;*z);x];1_ z);91>_ic*$x;(@[y;x;:;z];());(@[y;x;:;*z];1_(),z)]}          / list -> dict

J:0                                                                                             / joy semantics?
E:. S:()                                                                                        / environment, stack
G:{l'($`g`prelude),x;.m.p:"GJ"[J],">";.m.r:{:[x~," ";.m[`p`r]:_n;u x];`0:,f S}}                 / prompt, respond
l:{if[x _in,:'"01";I.j[E;,0$x]0;:_n];if[~*r:@[6::;"g/",x,".","gj"J;:];u r 1;`0:,f S]}           / load from file
u:{@[`.g;`E`S;:;e[E;S]p x];}                                                                    / update E, S

`0:"G 2007-01-10 Copyright (C) 2006-7 Stevan Apter\n[space] for K, [return] to clear"           / console begin

G _i                                                                                            / interpret

