 / nrootboundedbytwo example:

factorial:{(*/) 1+til x}
binomial:{(*/) ((x+1-(1+til y))%(1+til y))} / X CHOOSE Y
powersurge:{(*/) y#x}
powerlister:{arg:x;powerlist:{powersurge [x;y]} [arg;]; powerlist each ((til y),y)}
binomiallister:{y:1%y;binomiallist:{binomial [x;y]} [y;]; binomiallist each ((til x),x)}
nrootboundedbytwo:{x:x-1;sum ((binomiallister [z;y]) * (powerlister [x;z]))} / X is base, Y is n-root and Z is precision

show "this is an example of the nrootboundedbytwo function"
show "where X is base, Y is n-root and Z is precision"
show "for 2 root 5 (50 iterations):"
nrootboundedbytwo [2;5;50]
show  " "


 / chess comp example:
show "chess comp:"
show "pairing someone with someone else randomly, using the same list"
grandmaster:("Magnus Carlson";"Gary Kasparov";"Vishy Anand";"Hikaru Nakamura";"Bobby Fischer")
grandmaster
show "simple way: rotate (predictable opponent):"
simpletable:([] opp1:grandmaster;opp2:(1+rand (count grandmaster)) rotate grandmaster;gametime:09:00:00+(count grandmaster)?06:00:00)
show simpletable
show "complex way: random swaps (simpler with symbols):"
grandmaster:(`MagnusCarlson;`GaryKasparov;`VishyAnand;`HikaruNakamura;`BobbyFischer)
grandswapped:grandmaster
{0b=(((count grandmaster)#0b)~(grandmaster=grandswapped))}{swapper:-2#(2 {x,rand til count grandmaster}/ 1);if[swapper[0]<>swapper[1];grand:grandswapped[swapper[0]];grandswapped[swapper[0]]:grandswapped[swapper[1]];grandswapped[swapper[1]]:grand]}/1
randomtable:([] opp1:grandmaster;opp2:grandswapped;gametime:09:00:00+(count grandmaster)?06:00:00)
show randomtable
show "saving to csv file"
tablesave:`:./newtable.csv
tablesave 0: csv 0: randomtable
\\
