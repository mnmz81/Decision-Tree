function [XtN, XtY,labelsY,labelsN] = split_helper(Xt,labels,index,treshold)
    %Q3 C this function help we to splits a set of data into XtY and XtN by Xt <= treshold
    XtY = Xt(Xt(:,index) <= treshold,:);
    XtN = Xt(Xt(:,index) > treshold,:);
    labelsY= labels(Xt(:,index) <= treshold,:);
    labelsN = labels(Xt(:,index) > treshold,:);
end
