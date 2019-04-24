%% 使用Apriori算法挖掘关联规则

%数据导入
WineReviewsImport;
%数据预处理
DataTrans;
% 参数初始化
inputfile = 'data.txt'; % 销量及其他属性数据
outputfile='as.txt';% 输出转换后0,1矩阵文件
minSup = 0.1; % 最小支持度
minConf = 0.3;% 最小置信度
nRules = 1000;% 输出最大规则数
sortFlag = 1;% 按照支持度排序
rulefile = 'rules.txt'; % 规则输出文件

%% 调用转换程序 ，把数据转换为0,1矩阵，自定义函数
[transactions,code] = trans2matrix(inputfile,outputfile,','); 

%% 调用Apriori关联规则算法，自定义函数
[Rules,FreqItemsets] = findRules(transactions, minSup, minConf, nRules, sortFlag, code, rulefile);

disp('Apriori算法挖掘WineReviews关联规则完成！');