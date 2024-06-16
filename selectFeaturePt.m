function [xClick,yClick]=selectFeaturePt(T,n)
%% This program is to select feature points
% T is the input image
% n is the click number or number of feature points 

[rowN,colN,layerN]=size(T);
figure;imshow(T);
hold on;
k=1;
while k<=n
    [xClickTemp,yClickTemp]=ginput(1);
    if xClickTemp<0 | yClickTemp<0 | xClickTemp>colN | yClickTemp>rowN
        k=k-1;
    else
        xClick(k)=round(xClickTemp);
        yClick(k)=round(yClickTemp);
        scatter(xClick(k),yClick(k),'r','filled');
    end
    k=k+1;
end
hold off;

