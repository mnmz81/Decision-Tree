function tree = create_tree(Xt,labels,threshold,min_node)
    %create_tree builds the decision tree using the recursive function create_tree_rec
    %Q3 E
    tree = {};
    tree = create_tree_rec(Xt,labels,threshold,1,tree, min_node);
end