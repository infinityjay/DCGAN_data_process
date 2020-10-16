clc;
clear all;

datadir = 'D:\DCGAN\MIT_TEC\'; %指定批量数据所在的文件夹
filelist = dir([datadir,'*.nc']);       %列出所有满足指定类型的文件
l = length(filelist);

for m = 1:l
    Path = [datadir,filelist(m).name]; %设定NC路径
%     n = filelist(m).name(1:14); %读取数据编号前14位，以便于保存时以此编号储存
%     ncdisp(Path); %获取所读取nc文件的基本信息
%     ncid = netcdf.open(Path,'NOWRITE'); %打开nc文件返回索引ID
    lon=ncread(Path,'glon');%读取经度变量
    lat=ncread(Path,'gdlat');%读取纬度变量
    tec=ncread(Path,'tec');%读取tec变量
    tecnan = tec;% 存储原始tec数据为tecnan
    num = ~isnan(tec);%将nan转化为0，其余为1，计数矩阵
    tec(isnan(tec)) = 0;%将tec 中nan转化为0，其余值不变
        
    for i = 1:24:288 %5分钟一张图，共有288个时次，做两小时平均
        tec_1 = tec(:,:,i);
        num_1 = num(:,:,i);

        tec_3 = tec_1;
        num_3 = num_1;
        
        for j = 1:23
            tec_2 = tec(:,:,i+j);
            num_2 = num(:,:,i+j);

            tec_3 = tec_3 + tec_2;        
            num_3 = num_3 + num_2;

        end
        aver_tec = tec_3 ./ num_3;
        aver_tec = aver_tec';

        %画图
        k = (i+j)/12;
        img = pcolor(lon,lat,aver_tec);
        set(img, 'LineStyle','none');
        colormap jet;
        set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w');

        %保存图片
        dir2 = ['D:\DCGAN\dataset\MITTEC\',num2str(m),'_',num2str(k),'.png'];
        saveas(gcf,dir2);    

%         %修改图片大小
%          img1 = imread(dir2);
%          img2 = imresize(img1,[96,96]);
%          imwrite(img2,dir2,'png');

    end
end