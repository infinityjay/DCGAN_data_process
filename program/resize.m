Path = 'D:\python_projects\data_2018_64\';     % �������ݴ�ŵ��ļ���·��
File = dir(fullfile(Path,'*.jpg'));  % ��ʾ�ļ��������з��Ϻ�׺��Ϊ.cdf�ļ���������Ϣ
FileNames = {File.name}';            % ��ȡ���Ϻ�׺��Ϊ.txt�������ļ����ļ�����ת��Ϊn��1��
Length_Names = size(FileNames,1); 
for k = 1 : Length_Names
    dir2 = strcat(Path, FileNames{k});
    img1 = imread(dir2);
    img2 = imresize(img1,[64,64]);
    imwrite(img2,dir2,'jpg');
end