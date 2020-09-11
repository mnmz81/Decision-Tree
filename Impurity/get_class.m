function class = get_class(tree,item)
    %Q3 E helper function to  classifies an item using the decision tree
    i = 1;
    node = tree{i};
    while node{1} ~= 0
        if item(node{1}) <= node{2}
            i = 2*i+1;
        else
            i = 2*i;
        end
        node = tree{i};
    end
    class = node{2};
end