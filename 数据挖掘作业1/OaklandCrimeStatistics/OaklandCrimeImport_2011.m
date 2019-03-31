%% 导入文本文件中的数据。
%
%    E:\MyWorkplace\DataMining\oakland-crime-statistics-2011-to-2016\records-for-2011.csv
%

%% 初始化变量。
filename = 'E:\MyWorkplace\DataMining\oakland-crime-statistics-2011-to-2016\records-for-2011.csv';
delimiter = ',';
startRow = 2;
endRow = 180016;

%% 每个文本行的格式:
%   列1: 分类 (%C)
%	列2: 文本 (%s)
%   列3: 分类 (%C)
%	列4: 双精度值 (%f)
%   列5: 分类 (%C)
%	列6: 双精度值 (%f)
%   列7: 分类 (%C)
%	列8: 分类 (%C)
%   列9: 分类 (%C)
%	列10: 文本 (%s)
formatSpec = '%C%s%C%f%C%f%C%C%C%s%[^\n\r]';

%% 打开文本文件。
fileID = fopen(filename,'r');

%% 根据格式读取数据列。
dataArray = textscan(fileID, formatSpec, endRow-startRow+1, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% 关闭文本文件。
fclose(fileID);

%% 将导入的数组分配给列变量名称
Agency = dataArray{:, 1};
CreateTime = cellstr(dataArray{:, 2});
Location = dataArray{:, 3};
AreaId = dataArray{:, 4};
Beat = dataArray{:, 5};
Priority = dataArray{:, 6};
IncidentTypeId = dataArray{:, 7};
IncidentTypeDescription = dataArray{:, 8};
EventNumber = dataArray{:, 9};
ClosedTime = cellstr(dataArray{:, 10});


%% 清除临时变量
clearvars filename delimiter startRow endRow formatSpec fileID dataArray ans;