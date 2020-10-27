clear;

lat = [];
lon = [];
tecIGS = [];
x = [];
y = [];
z = [];

Path = 'D:\DCGAN\IGS_TEC\20140101_0601\';     % 设置数据存放的文件夹路径
File = dir(fullfile(Path,'*.cdf'));  % 显示文件夹下所有符合后缀名为.cdf文件的完整信息
FileNames = {File.name}';            % 提取符合后缀名为.txt的所有文件的文件名，转换为n行1列
Length_Names = size(FileNames,1);    % 获取所提取数据文件的个数
for k = 1 : Length_Names
% for k = 54 : 90
    dir = strcat(Path, FileNames{k});
%     dir = 'D:\DCGAN\IGS_TEC\2003\gps_tec2hr_igs_20031024_v01.cdf'
%     info = cdfinfo(dir);
%     vars = info.Variables;
    lat = cdfread(dir,'Variable','lat');
    lon = cdfread(dir,'Variable','lon');
    tecIGS = cdfread(dir,'Variable','tecIGS');
    y=cell2mat(lat);
    x=cell2mat(lon);
    for i = 1:12 %两小时平均，一天12张图
%      figure(i);
         fig(i) = figure('Visible', 'off'); %不显示图片
         z= tecIGS{i,1};
         img = pcolor(x,y,z);
         set(img, 'LineStyle','none');
         colormap jet;
         set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w');

        %保存图片
         dir2 = ['D:\python_projects\data_2014\',num2str(k),'_',num2str(2*i),'.jpg'];
         saveas(gcf,dir2);
         

%         %修改图片大小
%          img1 = imread(dir2);
%          img2 = imresize(img1,[64,64]);
%          imwrite(img2,dir2,'jpg');
%         clear z;
%         clear fig;
%         clear img;
%         clear dir2;

    end
%         clear lat;
%         clear lon;
%         clear tecIGS;
%         clear x;
%         clear y;
%         memory
end
