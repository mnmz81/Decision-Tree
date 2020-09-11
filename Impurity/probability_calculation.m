function P = probability_calculation(labels, classes)
    %Q3 A this function calculates the probabilty for each class in a node
    [classes, ~, indexes] = unique(labels);
    P = histc(indexes, 1:length(classes)) ./ length(labels); %counts occurrences in vector
end