%% Q3
%Q3 with fisheriris data
clear;clc
load fisheriris
%the learning data
Xt(1:35,:) = meas(1:35,:);
Xt(36:70,:) = meas(51:85,:);
Xt(71:105,:) = meas(101:135,:);
labels(1:35,:) = species(1:35,:);
labels(36:70,:) = species(51:85,:);
labels(71:105,:) = species(101:135,:);
tree = create_tree(Xt,labels,0.000001,6);
%the test data
X_test(1:15,:) = meas(36:50,:);
X_test(16:30,:) = meas(86:100,:);
X_test(31:45,:) = meas(136:150,:);
labels_test(1:15,:) =  species(36:50,:);
labels_test(16:30,:) = species(86:100,:);
labels_test(31:45,:) = species(136:150,:);
%classify
temp = {};
for i=1:length(labels_test)
    temp{i} = get_class(tree, X_test(i,:));
end
precision_error = 100*sum(~strcmp(temp',labels_test))/length(labels_test);
fprintf("The error precision for the test data is: %f\n", precision_error);

