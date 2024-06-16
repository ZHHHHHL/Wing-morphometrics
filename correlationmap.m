%Task3
%生成手绘图编码库的联系图程序

% 读取编码库中的数据
load('CODELIBRARY.mat');

% 将所有二进制字符串存储在一个 cell 数组中
binaryStrings = cell(1, 32);

for i = 1:32
    % 声明变量：B1, B2, ..., B32
    code = ['B', num2str(i)];
    
    % 将二进制字符串存储在 cell 数组中
    binaryStrings{i} = eval(code);
end

% 计算相似度矩阵
numStrings = length(binaryStrings);
similarityMatrix = zeros(numStrings);

%通过汉明距离计算每个代码之间的相似度
for i = 1:numStrings
    for j = 1:numStrings
        binaryVectorA = double(binaryStrings{i}) - 48;
        binaryVectorB = double(binaryStrings{j}) - 48;
        hammingDistance = sum(binaryVectorA ~= binaryVectorB);
        similarity = 1 - hammingDistance / length(binaryVectorA);
        similarityMatrix(i, j) = similarity;
    end
end

% 绘制相似度矩阵的相关图
figure;
imagesc(similarityMatrix);
colormap(sky); % 选择调色板
colorbar;
title('相似度矩阵相关图');

% 设置横纵坐标刻度和标签
xticks(1:numStrings);
yticks(1:numStrings);
xticklabels(cellstr(arrayfun(@(n) ['B', num2str(n)], 1:numStrings, 'UniformOutput', false)));
yticklabels(cellstr(arrayfun(@(n) ['B', num2str(n)], 1:numStrings, 'UniformOutput', false)));
