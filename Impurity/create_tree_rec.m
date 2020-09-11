function tree = create_tree_rec(Xt,labels,treshold,index,tree,min_node)
    %Q3 E recursive function that builds decision tree.
    %we bild the tree while using the role index*2 for no group  and index*2+1 for yes group when the function split.
    [node,Xn,Xy,labelsN,labelsY,is_leaf]=split(Xt,labels,treshold,min_node);
    tree{index}=node;
    if is_leaf==0 % check if we need a split if yes the split if no then we get a leaf
        tree=create_tree_rec(Xn,labelsN,treshold,index*2,tree,min_node); %left tree 
        tree=create_tree_rec(Xy,labelsY,treshold,index*2+1,tree,min_node);%right tree
    end
end