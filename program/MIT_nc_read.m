clc;
clear all;

datadir = 'D:\DCGAN\MIT_TEC\'; %ָ�������������ڵ��ļ���
filelist = dir([datadir,'*.nc']);       %�г���������ָ�����͵��ļ�
l = length(filelist);

for m = 1:l
    Path = [datadir,filelist(m).name]; %�趨NC·��
%     n = filelist(m).name(1:14); %��ȡ���ݱ��ǰ14λ���Ա��ڱ���ʱ�Դ˱�Ŵ���
%     ncdisp(Path); %��ȡ����ȡnc�ļ��Ļ�����Ϣ
%     ncid = netcdf.open(Path,'NOWRITE'); %��nc�ļ���������ID
    lon=ncread(Path,'glon');%��ȡ���ȱ���
    lat=ncread(Path,'gdlat');%��ȡγ�ȱ���
    tec=ncread(Path,'tec');%��ȡtec����
    tecnan = tec;% �洢ԭʼtec����Ϊtecnan
    num = ~isnan(tec);%��nanת��Ϊ0������Ϊ1����������
    tec(isnan(tec)) = 0;%��tec ��nanת��Ϊ0������ֵ����
        
    for i = 1:24:288 %5����һ��ͼ������288��ʱ�Σ�����Сʱƽ��
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

        %��ͼ
        k = (i+j)/12;
        img = pcolor(lon,lat,aver_tec);
        set(img, 'LineStyle','none');
        colormap jet;
        set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w');

        %����ͼƬ
        dir2 = ['D:\DCGAN\dataset\MITTEC\',num2str(m),'_',num2str(k),'.png'];
        saveas(gcf,dir2);    

%         %�޸�ͼƬ��С
%          img1 = imread(dir2);
%          img2 = imresize(img1,[96,96]);
%          imwrite(img2,dir2,'png');

    end
end