Path = 'D:\python_projects\data_2018_64\';     % 设置数据存放的文件夹路径
File = dir(fullfile(Path,'*.jpg'));  % 显示文件夹下所有符合后缀名为.cdf文件的完整信息
FileNames = {File.name}';            % 提取符合后缀名为.txt的所有文件的文件名，转换为n行1列
Length_Names = size(FileNames,1); 
for k = 1 : Length_Names
    dir2 = strcat(Path, FileNames{k});
    img1 = imread(dir2);
    img2 = imresize(img1,[64,64]);
    imwrite(img2,dir2,'jpg');
end