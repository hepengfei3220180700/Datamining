%% 导入数据
OaklandCrimeImport_2011;
load CreateDate.mat
load ClosedDate.mat

%% 标称属性的频数
Agency_t=tabulate(Agency);
Location_t=tabulate(Location);
Beat_t=tabulate(Beat);
InctyTpeId_t=tabulate(IncidentTypeId);
InctyTypeDes_t=tabulate(IncidentTypeDescription);
xlswrite('CrimeTabulate_2011.xls',Agency_t,'Agency');
xlswrite('CrimeTabulate_2011.xls',Location_t,'Location');
xlswrite('CrimeTabulate_2011.xls',Beat_t,'Beat');
xlswrite('CrimeTabulate_2011.xls',InctyTpeId_t,'IncidentTypeId');
xlswrite('CrimeTabulate_2011.xls',InctyTypeDes_t,'IncidentTypeDescription');
%% 数值属性AreaId
max_AreaId=nanmax(AreaId);
min_AreaId=nanmin(AreaId);
mean_AreaId=nanmean(AreaId);
median_AreaId=nanmedian(AreaId);
quantile_AreaId_1=quantile(AreaId,0.25,1);
quantile_AreaId3=quantile(AreaId,0.75,1);
miss_AreaId=sum(ismissing(AreaId));
%% 数值属性 Priority
max_Priority=nanmax(Priority);
min_Priority=nanmin(Priority);
mean_Priority=nanmean(Priority);
median_Priority=nanmedian(Priority);
quantile_Priority_1=quantile(Priority,0.25,1);
quantile_Priority_3=quantile(Priority,0.75,1);
miss_Priority=sum(ismissing(Priority));
%% 数据可视化
%AreaId
figure;
histogram(AreaId);
title('AreaId-直方图');
xlabel('AreaId');
ylabel('频数');
figure;
qqplot(AreaId);
title('AreaId-QQ图');
figure;
boxplot(AreaId);
title('AreaId-盒图');
set(gca,'XTickLabel',{' '});
%% Priority
figure;
histogram(Priority);
title('Priority-直方图');
xlabel('Priority');
ylabel('频数');
figure;
qqplot(Priority);
title('Priority-QQ图');
figure;
boxplot(Priority);
title('Priority-盒图');
set(gca,'XTickLabel',{' '});
%% CreateTime
figure;
histogram(CreateDate);
title('CreateTime-直方图');
xlabel('CreateTime');
ylabel('频数');
% figure;
% qqplot(CreateDate);
% title('CreateTime-QQ图');
% figure;
% boxplot(CreateDate);
% title('CreateTime-盒图');
% set(gca,'XTickLabel',{' '});
%% ClosedTime
figure;
histogram(ClosedDate);
title('ClosedTime-直方图');
xlabel('ClosedTime');
ylabel('频数');
% figure;
% qqplot(ClosedDate);
% title('ClosedTime-QQ图');
% figure;
% boxplot(ClosedDate);
% title('ClosedTime-盒图');
% set(gca,'XTickLabel',{' '});
%% 剔除缺失部分,可视化
rmAreaId=rmmissing(AreaId);
figure;
histogram(rmAreaId);
title('price-直方图');
xlabel('AreaId');
ylabel('频数');
figure;
qqplot(rmAreaId);
title('AreaId-QQ图');
figure;
boxplot(rmAreaId);
title('AreaId-盒图');
set(gca,'XTickLabel',{' '});
%% 用最高频率值来填补缺失值
most_fill_AreaId=AreaId;
most_fill_AreaId(ismissing(AreaId))=mode(AreaId);
figure;
histogram(most_fill_AreaId);
title('AreaId-直方图');
xlabel('AreaId');
ylabel('频数');
figure;
qqplot(most_fill_AreaId);
title('AreaId-QQ图');
figure;
boxplot(most_fill_AreaId);
title('AreaId-盒图');
set(gca,'XTickLabel',{' '});
%% 通过属性的相关关系来填补缺失值
linear_fill_AreaId=AreaId;
a=polyfit(Priority,AreaId,1);
linear_fill_AreaId(ismissing(AreaId))=polyval(a,Priority(ismissing(AreaId)));
figure;
histogram(linear_fill_AreaId);
title('AreaId-直方图');
xlabel('AreaId');
ylabel('频数');
figure;
qqplot(linear_fill_AreaId);
title('AreaId-QQ图');
figure;
boxplot(linear_fill_AreaId);
title('AreaId-盒图');
set(gca,'XTickLabel',{' '});
%% 通过数据相似性填补缺失值
knnAreaId=AreaId;
test_data=Priority(ismissing(AreaId));
train_data=Priority(rmmissing(AreaId));
train_label=rmmissing(AreaId);
knnAreaId(ismissing(AreaId))=knnclassify(test_data,train_data,train_label);
figure;
histogram(knnAreaId);
title('AreaId-直方图');
xlabel('AreaId');
ylabel('频数');
figure;
qqplot(knnAreaId);
title('AreaId-QQ图');
figure;
boxplot(knnAreaId);
title('AreaId-盒图');
set(gca,'XTickLabel',{' '});

