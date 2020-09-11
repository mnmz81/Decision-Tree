function [alpha,index,leaf] = select_feature_threshold(Xt,labels,classes,treshold,min_node)
    %Q3 C
    %help variable
    best_index = Inf;
    best_value = Inf;
    best_score = 0;
    %Calculation the impurity value of Xt 
    P = probability_calculation(labels,classes);
    Ht = impurity(P);
    %to check if we need to split
    leaf = Ht < treshold; 
    if leaf==1  
        alpha = 0;
        index = 0;
        return;
    end
    for i=1:size(Xt,2)-1 
        for j=1:size(Xt,1)
            [XtN, XtY,labelsY,labelsN] = split_helper(Xt,labels, i, Xt(j,i));
            % to check if the one of the two groups is smaller thet min_node if so then not good feature 
            if (size(XtN,1) <= min_node) || (size(XtY,1) <=min_node)  
                continue;
            end
            %Calculation of the probability of each group
            noProp=probability_calculation(labelsN,labels);
            yesProp=probability_calculation(labelsY,labels);
            %Calculation entropy calculation for each group
            Hn=impurity(noProp);
            Hy=impurity(yesProp);   
            % that result in a split with the highest decrease in impurity.
            It = Ht - size(Hy,1)/size(Xt,1) * Hy - size(Hn,1)/size(Xt,1) * Hn;%Calculation min error
            if It>best_score %to fine the best split
                best_score = It;
                best_index = i;
                best_value = Xt(j,i);
            end        
        end
    end
    alpha = best_value;
    index = best_index;
end