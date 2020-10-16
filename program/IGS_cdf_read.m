clear;

lat = [];
lon = [];
tecIGS = [];
x = [];
y = [];
z = [];

Path = 'D:\DCGAN\IGS_TEC\20140101_0601\';     % �������ݴ�ŵ��ļ���·��
File = dir(fullfile(Path,'*.cdf'));  % ��ʾ�ļ��������з��Ϻ�׺��Ϊ.cdf�ļ���������Ϣ
FileNames = {File.name}';            % ��ȡ���Ϻ�׺��Ϊ.txt�������ļ����ļ�����ת��Ϊn��1��
Length_Names = size(FileNames,1);    % ��ȡ����ȡ�����ļ��ĸ���
% for k = 1 : Length_Names
for k = 54 : 90
    dir = strcat(Path, FileNames{k});
%     dir = 'D:\DCGAN\IGS_TEC\2003\gps_tec2hr_igs_20031024_v01.cdf'
%     info = cdfinfo(dir);
%     vars = info.Variables;
    lat = cdfread(dir,'Variable','lat');
    lon = cdfread(dir,'Variable','lon');
    tecIGS = cdfread(dir,'Variable','tecIGS');
    y=cell2mat(lat);
    x=cell2mat(lon);
    for i = 1:12 %��Сʱƽ����һ��12��ͼ
%      figure(i);
         fig(i) = figure('Visible', 'off'); %����ʾͼƬ
         z= tecIGS{i,1};
         img = pcolor(x,y,z);
         set(img, 'LineStyle','none');
         colormap jet;
         set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w');

        %����ͼƬ
         dir2 = ['D:\python_projects\data_2014\',num2str(k),'_',num2str(2*i),'.jpg'];
         saveas(gcf,dir2);
         

%         %�޸�ͼƬ��С
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