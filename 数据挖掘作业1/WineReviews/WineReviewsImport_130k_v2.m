%% 导入文本文件中的数据。
%    E:\MyWorkplace\DataMining\wine-reviews\winemag-data-130k-v2.csv
%% 初始化变量。
filename = 'E:\MyWorkplace\DataMining\wine-reviews\winemag-data-130k-v2.csv';
delimiter = ',';
startRow = 2;

%% 每个文本行的格式:
%   列1: 序号 双精度值 (%f)
%	列2: 国家 分类 (%C)
%   列3: 描述 文本 (%q)
%	列4: 品牌 文本 (%q)
%   列5: 得分 双精度值 (%f)
%	列6: 价格 双精度值 (%f)
%   列7: 分类 (%C)
%	列8: 分类 (%C)
%   列9: 分类 (%C)
%	列10: 分类 (%C)
%   列11: 分类 (%C)
%	列12: 文本 (%q)
%   列13: 分类 (%C)
%	列14: 文本 (%q)
formatSpec = '%f%C%q%q%f%f%C%C%C%C%C%q%C%q%[^\n\r]';

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
taster_name = dataArray{:, 10};
taster_twitter_handle = dataArray{:, 11};
title1 = cellstr(dataArray{:, 12});
variety = dataArray{:, 13};
winery = cellstr(dataArray{:, 14});

%% 清除临时变量
clearvars filename delimiter startRow formatSpec fileID dataArray ans;