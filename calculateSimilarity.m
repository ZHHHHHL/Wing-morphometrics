%Task 5
%计算照片的编码值与手绘图编码值相似度
%函数需要输入（照片编码值，储存手绘图编码值库名称）输出所有的相似度及top3
%通过汉明距离计算相似度百分比
%使用sort排序后给出排名及top

function [similarityScores, topThreeInfo] = calculateSimilarity(A, fileName)
% 加载保存手绘图编码库
    load(fileName);

% 创建一个数组来存储相似度百分比
similarityScores = zeros(1, 32);

% 遍历 B1 到 B32，计算相似度
for i = 1:32
    % 构造 B1 到 B32 的变量名
    code= ['B', num2str(i)];
    
    % 获取 B1 到 B32 的二进制串
    B = eval(code);
    
    % 将二进制字符串转换为数字向量
    binaryVectorA = double(A) - 48;
    binaryVectorB = double(B) - 48;
    
    % 计算汉明距离
    hammingDistance = sum(binaryVectorA ~= binaryVectorB);
    
    % 计算相似度百分比
    similarityScores(i) = (length(binaryVectorA) - hammingDistance) / length(binaryVectorA) * 100;
end

% 显示所有相似度百分比
disp('所有相似度百分比:');
for i = 1:32
    fprintf('%s = %.2f%% ', ['B', num2str(i)], similarityScores(i));
    if mod(i, 8) == 0
        fprintf('\n'); % 每行显示8个
    end
end
fprintf('\n');

% 找出前三名的索引和百分比
[sortedScores, sortedIndices] = sort(similarityScores, 'descend');
topThreeIndices = sortedIndices(1:3);
topThreeScores = sortedScores(1:3);

% 显示前三名的相似度百分比和对应的索引
fprintf('前三名的相似度百分比:\n');
for i = 1:3
    fprintf('TOP%d: %s = %.2f%%\n', i, ['B', num2str(topThreeIndices(i))], topThreeScores(i));
end
