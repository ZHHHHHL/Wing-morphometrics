%主程序
%可以识别读取指定路径文件夹下的所有图片
%经过灰度处理，二值化，腐蚀膨胀操作
%依据所选特征点编码与之相关的特征区域
%自动归列进入一个文件中

%填写文件夹路径和文件类型
  sourceFolderPath = '路径';   %修改此处'路径'为目标文件夹地址
  fileType = '*.png';
  
  imageFiles = dir(fullfile(sourceFolderPath, fileType));
  
  % 遍历所有图片文件
  for i = 1:length(imageFiles)
      % 获取完整的文件路径，筛选排列出图片
      imagePath = fullfile(sourceFolderPath, imageFiles(i).name);
  
 
    % 读取图像数据
      T= imread(imagePath);
  
      %转化为灰度图像
      T = rgb2gray(T);
  
      % 归一调整图像大小为1594x768
      T = imresize(T, [768, 1594]);
  
      %加载选点函数，选取6个特征点
      [xClick,yClick]=selectFeaturePt(T,6);
  
      % 二值化处理
      binaryImage=imbinarize(T);
 
     % 腐蚀和膨胀
      se = strel('disk', 5); % 选择结构元素大小为5
      erodedImg = imerode(binaryImage, se);
      dilatedImg = imdilate(erodedImg, se);
  
      % 生成动态的标识符 'B1', 'B2', ...或'A1', 'A2',...
      identifier = ['B', num2str(i)];     %修改此处'B'为所需标号
 
     %加载编码函数，编码图像并且生成库
      calculateBinaryCode(dilatedImg,xClick,yClick,identifier)
  
      close
  end