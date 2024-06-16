%Task 2
%编码函数，需要输入值（图像名称，x坐标矩阵，y坐标矩阵，图片编号）
%通过计算平均灰度值确认其图案大致颜色
%编码为00,01,10,11
%依次串联后编写入库

function calculateBinaryCode(dilatedImg,xClick,yClick,codeName)

% 获取给定坐标的像素值，转变为x1=xx，x2=xx...
%                          y1=xx, y2=xx...
pixels = dilatedImg;
for i=1:6
    X=['x',num2str(i)];
    eval([X,' = xClick(',num2str(i),');']);
    Y=['y',num2str(i)];
    eval([Y,' = yClick(',num2str(i),');']);
end

%区域1
% 计算给定坐标周围区域的灰度值的均值
region = pixels((y1-101):y1,x1:(x1+101));
mean_value = mean(region);
M1 = mean(mean_value);

%区域2
% 计算给定坐标周围区域的灰度值的均值
region = pixels(y1:(y1+101),x1:(x1+101));
mean_value = mean(region);
M2 = mean(mean_value);

%区域3
% 计算给定坐标周围区域的灰度值的均值
region = pixels((y2-101):y2,(x2-50):(x2+50));
mean_value = mean(region);
M3 = mean(mean_value);

%区域4
% 计算给定坐标周围区域的灰度值的均值
region = pixels(y2:(y2+101),(x2-50):(x2+50));
mean_value = mean(region);
M4 = mean(mean_value);

%区域5
% 计算给定坐标周围区域的灰度值的均值
region = pixels((y3-1):y3,(x3-101):x3);
mean_value = mean(region);
M5 = mean(mean_value);

%区域6
% 计算给定坐标周围区域的灰度值的均值
region = pixels(round((y3+y6)/2-50):round((y3+y6)/2+50),round((x3+x6)/2-50):round((x3+x6)/2+50));
mean_value = mean(region);
M6 = mean(mean_value);

%区域7
% 计算给定坐标周围区域的灰度值的均值
region = pixels(y4-50:y4+50,round((x1+x2)/2-50):round((x1+x2)/2+50));
mean_value = mean(region);
M7 = mean(mean_value);

%区域8
% 计算给定坐标周围区域的灰度值的均值
region = pixels((y4+75)-50:(y4+75)+50,round((x4+x5)/2-50):round((x4+x5)/2+50));
mean_value = mean(region);
M8 = mean(mean_value);

%区域9
% 计算给定坐标周围区域的灰度值的均值
region = pixels((y4-50):(y4+50),(x4-101):x4);
mean_value = mean(region);
M9 = mean(mean_value);

%区域10
% 计算给定坐标周围区域的灰度值的均值
region = pixels(y4:(y4+101),x4:(x4+101));
mean_value = mean(region);
M10 = mean(mean_value);

%区域11
% 计算给定坐标周围区域的灰度值的均值
region = pixels(round((y3+y5)/2):round((y3+y5)/2+101),(x3-101):x3);
mean_value = mean(region);
M11 = mean(mean_value);

%区域12
% 计算给定坐标周围区域的灰度值的均值
region = pixels((y5-50):(y5+50),(x5-50):(x5+50));
mean_value = mean(region);
M12 = mean(mean_value);

%区域13
% 计算给定坐标周围区域的灰度值的均值
region = pixels((y6-101):y6,(x6-101):(x6));
mean_value = mean(region);
M13 = mean(mean_value);

%区域14
% 计算给定坐标周围区域的灰度值的均值
region = pixels(y6:(y6+101),(x6-101):(x6));
mean_value = mean(region);
M14 = mean(mean_value);

% 将该区域的像素值编码为一个二进制数
binaryCode='';
for i=1:14
M=['M',num2str(i)];
area=eval(M);
n=fix(area/0.25);
if n==4
    n=n-1;
end
%将所有数组合成为一串
n=dec2bin(n,2);
binaryCode=[binaryCode,n];
end

%展示当前图片的最终编码值
eval([codeName,'=binaryCode;'])
disp(['Code ',codeName,':',binaryCode]);

%依次保存至库内
eval(['save("CODELIBRARYTEST.mat","',codeName,'","-append");']);



