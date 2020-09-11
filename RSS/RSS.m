function [temp] = RSS(y)
    %Q3 B
    y1 = nanmean(y);
    temp=nansum(nansum((y-y1).^2));
end