function [x,y]=maxin(a,b,c)
roots([a b c]);
maxi=max(roots([a b c]));
mini=min(roots([a b c]));
disp(maxi)
disp(mini)
end