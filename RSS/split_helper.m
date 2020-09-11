function [XtN, XtY,labelsY,labelsN] = split_helper(Xt,labels,index,treshold)
    %Q3 C
    %split_hlper splits a set of data into y and n by Xindex <= value
    XtY = Xt(Xt(:,index) <= treshold,:);
    XtN = Xt(Xt(:,index) > treshold,:);
    labelsY= labels(Xt(:,index) <= treshold,:);
    labelsN = labels(Xt(:,index) > treshold,:);
end
