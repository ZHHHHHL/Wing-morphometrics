# Wing-morphometrics
Using MATLAB to match photos and hand-drawn images of insect wings

1	程序文件.m	MAIN.m	包含图像处理，选点，调用编码程序。最后将所有编码存入库.mat文件
2	程序文件.m	MAIN2.m	对于指定的照片编号代码，对其与所有手绘图编码进行相似度对比
3	程序文件.m	correlationmap.m	对于库.mat文件中所有的手绘图编码进行相似度比对并且生成一张相关图
4	函数文件.m	calculateBinaryCode.m	对于所选的特征点坐标，对其附近特征区域编码后，储存到指定的库.mat文件中
5	函数文件.m	calculateSimilarity.m	对于指定的照片编号代码，对其与所有手绘图编码进行相似度对比
6	函数文件.m	selectFeaturePt.m	选取特征点坐标函数
7	库文件.mat	CODELIBRARY.mat	储存有已经处理好的所有照片及手绘图的编码数据，可直接用于生成相关图和相似度对比
8	库文件.mat	CODELIBRARYTEST.mat	空的库.mat文件，用于进行主程序测试
9	文件夹	A	储存有所有的照片
10	文件夹	B	储存有所有的手绘图
11	PPT	展示PPT	PPT由部分动画组成，请播放浏览以获取完整内容

程序运行步骤

图像处理，选点，对图像特征区域编码并存入库文件
1.打开MAIN.mat程序，将代码开头处的'路径'修改为照片或手绘图的文件夹位置路径。
例：sourceFolderPath = 'D:\桌面\昆虫翅膀\最终\maybe最终版本\A';
2.修改代码40行处的标号'B'为需要的标号，如此时在对手绘图文件夹中的图片编码，修改为'B'
例：identifier = ['A', num2str(i)]; (对照片编码时，修改为'A')
3.运行程序，在遍历文件夹中所有图片，选取特征点后，代码会储存在CODELIBRARYTEST.mat文件中供测试。 （已经处理好的所有照片及手绘图的编码数据储存在CODELIBRARY.mat文件中，可直接用于后续步骤生成相关图和相似度对比）

相似度对比

1.打开MAIN2.mat程序，修改程序中的库.mat文件名和照片编号。
例：calculateSimilarity(A3,'CODELIBRARY.mat'); (对比A3和所有手绘图代码相似度)
2.运行生成所有的相似度百分比，并且显示其中的top3。

相关图生成

1.打开Correlationmap.m程序，修改程序中的库.mat文件名（如需要）
2.运行生成一张关于所有手绘图代码的相关图。
