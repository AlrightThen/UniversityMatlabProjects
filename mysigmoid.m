function G = mysigmoid(U,V)
gamma = 0.1;
c = -0.7;
G = tanh(gamma*U*V' + c);
end