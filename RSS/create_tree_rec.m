function tree = create_tree_rec(Xt,labels,treshold,index,tree,min_node)
%Q3 D
% recursive function that builds decision tree.
% from the X features vector and the leaf title we bild the tree while using the role index*2 for no group  and index*2+1 for yes group when the function split.
% returns a leaf the recursion will stop.
[newNode,XtN,XtY,labelsN,labelsY,is_leaf]=split(Xt,labels,treshold,min_node);
tree{index}=newNode;
if is_leaf==0 % check if we need a split if yes the split if no then we get a leaf
    tree=create_tree_rec(XtN,labelsN,treshold,index*2,tree,min_node);
    tree=create_tree_rec(XtY,labelsY,treshold,index*2+1,tree,min_node);
end
end