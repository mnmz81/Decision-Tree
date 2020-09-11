%% Q3
%Q3 Car
clear;clc
% Decision tree for carsmall
load carsmall % load the sample data,contains Horsepower, Weight, MPG
X = [Horsepower Weight];
m1=length(X(:,1));
X(:,2)=X(:,2)*0.4536; % converting libras tokg
kmpL=MPG*0.4251; % converting mile per Galonto km per liter

%the learning data
m=select_feature_threshold(X,kmpL,unique(kmpL),0,6);
tree=create_tree(X,kmpL,m,6); 

t=fitrtree(X,kmpL,'MinLeafSize',10,'MaxNumSplits',2); 
view(t,'mode','graph')