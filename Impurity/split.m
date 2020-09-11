function [newNode,XtN,XtY,labelsN,labelsY,is_leaf] = split(Xt,labels,treshold,min_node)
    %Q3 C
    classes=unique(labels); % to know how much labels i have 
    % find the best split for feature and its treshold
    [alpha,index,leaf] = select_feature_threshold(Xt,labels,classes,treshold,min_node);

    if leaf==1 || index==Inf  %check if we need to  create leaf.
         XtN=[]; XtY=[]; labelsN=[]; labelsY=[];
         is_leaf=1;
         %label is max probabilty
         p=probability_calculation(labels,classes);%Calculation of the probability of each label in vector y
         [~, index] = max(p);% majority vote 
         newNode = {0, classes{index}};  
        return; 
    else
        %Create two separated groups Xy & Xn 
        [XtN,XtY,labelsY,labelsN] = split_helper(Xt,labels,index,alpha);
        is_leaf=0;
        newNode={index,alpha};
    end
end

