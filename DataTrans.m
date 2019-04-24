%% 将points和price划分为5个级别
[n,~]=size(price);
price_level=cell(n,1);
points_level=cell(n,1);
points_level(points>=80&points<85)={'a'};
points_level(points>=85&points<90)={'b'};
points_level(points>=90&points<95)={'c'};
points_level(points>=95&points<100)={'d'};
points_level(points==100)={'e'};
price_level(price<=50)={'A'};
price_level((price>50)&(price<=100))={'B'};
price_level(price>100&price<=500)={'C'};
price_level(price>500&price<=1000)={'D'};
price_level(price>1000)={'E'};
%%将处理后的数据保存到文件data.txt
fulldata=[country,points_level,price_level,province,variety,winery];
data=fulldata(~(ismissing(price)|ismissing(province)),:);
[nrows,ncols]= size(data);
filename = 'data.txt';
fid = fopen(filename, 'w');
for row=1:100000
    for col=1:ncols
        if(col<ncols)
            fprintf(fid,'%s%c',data{row,col},',');
        else if (col==ncols)
                fprintf(fid,'%s\r\n',data{row,col});
            end
        end
    end
end
fclose(fid);

