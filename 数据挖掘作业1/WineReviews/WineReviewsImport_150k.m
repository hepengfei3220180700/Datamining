%% 导入文本文件中的数据。
%    E:\MyWorkplace\DataMining\wine-reviews\winemag-data_first150k.csv

%% 初始化变量。
filename = 'E:\MyWorkplace\DataMining\wine-reviews\winemag-data_first150k.csv';
delimiter = ',';
startRow = 2;

%% 每个文本行的格式:
%   列1: 双精度值 (%f)
%	列2: 分类 (%C)
%   列3: 文本 (%q)
%	列4: 文本 (%q)
%   列5: 双精度值 (%f)
%	列6: 双精度值 (%f)
%   列7: 分类 (%C)
%	列8: 分类 (%C)
%   列9: 分类 (%C)
%	列10: 分类 (%C)
%   列11: 文本 (%q)
formatSpec = '%f%C%q%q%f%f%C%C%C%C%q%[^\n\r]';

%% 打开文本文件。
fileID = fopen(filename,'r');

%% 根据格式读取数据列。
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% 关闭文本文件。
fclose(fileID);

%% 将导入的数组分配给列变量名称
VarName1 = dataArray{:, 1};
country = dataArray{:, 2};
description = cellstr(dataArray{:, 3});
designation = cellstr(dataArray{:, 4});
points = dataArray{:, 5};
price = dataArray{:, 6};
province = dataArray{:, 7};
region_1 = dataArray{:, 8};
region_2 = dataArray{:, 9};
variety = dataArray{:, 10};
winery = cellstr(dataArray{:, 11});

%% 清除临时变量
clearvars filename delimiter startRow formatSpec fileID dataArray ans;