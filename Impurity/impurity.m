function [entropy] = impurity(P)
    %Q3 A the impurity function 
    entropy = -sum(P.*log2(P));
end