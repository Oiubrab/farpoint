factorial:{(*/) 1+til x}
binomial:{(*/) ((x+1-(1+til y))%(1+til y))} / X CHOOSE Y
powersurge:{(*/) y#x}
powerlister:{arg:x;powerlist:{powersurge [x;y]} [arg;]; powerlist each ((til y),y)}
binomiallister:{y:1%y;binomiallist:{binomial [x;y]} [y;]; binomiallist each ((til x),x)}
nrootboundedbytwo:{x:x-1;sum ((binomiallister [z;y]) * (powerlister [x;z]))} / X is base, Y is n-root and Z is precision
