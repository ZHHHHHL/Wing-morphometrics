%Task 5
%计算照片的编码值与手绘图编码值相似度
%函数需要输入（照片编码值，储存手绘图编码值库名称）输出所有的相似度及top3

%加载储存所有代码的库.mat文件
load('CODELIBRARY.mat');     %修改此处的库.mat文件名
%加载计算相似度百分比的函数
calculateSimilarity(A1,'CODELIBRARY.mat');    %修改此处的照片编号及库.mat文件名