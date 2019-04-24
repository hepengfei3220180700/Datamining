
北京理工大学计算机学院数据挖掘2019作业1
数据集：
1、WineReviews
2、Oakland Crime Statistics 2011 to 2016
文档说明：
PDF文件为分析过程报告
Excel文件为标称属性的统计表，记录了所有标称属性的频数和频率。
m文件为分析程序文件，在matlab中运行。
WineReviewsStatistic_150k.m、WineReviewsStatistic_130k_v2.m、OaklandCrimeStatistic_2011.m分析主程序，可以自动导入数据文件，
获取数据摘要以及实现数据可视化。
OaklandCrimeImport_2011.m、WineReviewsImport_130k_v2.m、WineReviewsImport_150k.m实现数据导入，被主程序调用。

作业2
主程序调用辅助程序，实现数据源的导入、转换，关联规则的挖掘，将结果导出到rules.txt。
数据源：
WineReviews
主程序：
cal_apriori.m
辅助程序：
WineReviewsImport.m
DataTrans.m
trans2matrix.m
findRules.m
转换后的数据：
data.txt
挖掘结果：
rules.txt
