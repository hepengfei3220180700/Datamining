%% 导入数据
clear
clc
WineReviewsImport_130k_v2;
%% 标称属性的频数
coun=tabulate(country);
prov=tabulate(province);
reg1=tabulate(region_1);
reg2=tabulate(region_2);
vari=tabulate(variety);
name=tabulate(taster_name);
twitter=tabulate(taster_twitter_handle);
xlswrite('frequency.xls',coun,'country');
xlswrite('frequency.xls',prov,'province');
xlswrite('frequency.xls',reg1,'region1');
xlswrite('frequency.xls',reg2,'region2');
xlswrite('frequency.xls',vari,'variety');
xlswrite('frequency.xls',name,'taster_name');
xlswrite('frequency.xls',twitter,'taster_twitter');
%% 数值属性price
max_price=nanmax(price);
min_price=nanmin(price);
mean_price=nanmean(price);
median_price=nanmedian(price);
quantile_price1=quantile(price,0.25,1);
quantile_price3=quantile(price,0.75,1);
miss_price=sum(ismissing(price));
%% 数值属性 points
max_points=nanmax(points);
min_points=nanmin(points);
mean_points=nanmean(points);
median_points=nanmedian(points);
quantile_points1=quantile(points,0.25,1);
quantile_points3=quantile(points,0.75,1);
miss_points=sum(ismissing(points));
%% 数据可视化
%% points
figure;
histogram(points);
title('points-直方图');
xlabel('point');
ylabel('频数');
figure;
qqplot(points);
title('points-QQ图');
figure;
boxplot(points);
title('points-盒图');
set(gca,'XTickLabel',{' '});
%% price
figure;
histogram(price);
title('price-直方图');
xlabel('price');
ylabel('频数');
figure;
qqplot(price);
title('price-QQ图');
figure;
boxplot(price);
title('price-盒图');
set(gca,'XTickLabel',{' '});
%% 剔除缺失部分,可视化
rmprice=rmmissing(price);
figure;
histogram(rmprice);
title('price-直方图');
xlabel('price');
ylabel('频数');
figure;
qqplot(rmprice);
title('price-QQ图');
figure;
boxplot(rmprice);
title('price-盒图');
set(gca,'XTickLabel',{' '});
%% 用最高频率值来填补缺失值
most_fill_price=price;
most_fill_price(ismissing(price))=mode(price);
figure;
histogram(most_fill_price);
title('price-直方图');
xlabel('price');
ylabel('频数');
figure;
qqplot(most_fill_price);
title('price-QQ图');
figure;
boxplot(most_fill_price);
title('price-盒图');
set(gca,'XTickLabel',{' '});
%% 通过属性的相关关系来填补缺失值
linear_fill_price=price;
a=polyfit(points,price,1);
linear_fill_price(ismissing(price))=polyval(a,points(ismissing(price)));
figure;
histogram(linear_fill_price);
title('price-直方图');
xlabel('price');
ylabel('频数');
figure;
qqplot(linear_fill_price);
title('price-QQ图');
figure;
boxplot(linear_fill_price);
title('price-盒图');
set(gca,'XTickLabel',{' '});
%% 通过数据相似性填补缺失值
knnprice=price;
test_data=points(ismissing(price));
train_data=points(rmmissing(price));
train_label=rmmissing(price);
knnprice(ismissing(price))=knnclassify(test_data,train_data,train_label);
figure;
histogram(knnprice);
title('price-直方图');
xlabel('price');
ylabel('频数');
figure;
qqplot(knnprice);
title('price-QQ图');
figure;
boxplot(knnprice);
title('price-盒图');
set(gca,'XTickLabel',{' '});

