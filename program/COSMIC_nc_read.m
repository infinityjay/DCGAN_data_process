clc;
clear;

% year=[];
% month=[];
% day=[];
% doy=[];
% ut=[];
% lt=[];
% hmf2=[];
% nmf2=[];
lat=[];
lon=[];
% orbalt=[];
num=1;
for k=2011:2011
    kk=strcat('D:\DCGAN\COSMIC\',num2str(k),'\'); 
    cd(kk);
    dat1=struct2cell(dir);
    for i=1:length(dat1)-2
        dat_name1=dat1(1,i+2);
        cell_str=strsplit(char(dat_name1),'.');
        doyy=str2num(cell2mat(cell_str(1,2)));
        s1=strcat(kk,'\',char(dat_name1));
        cd(s1);
        dat2=struct2cell(dir);
        
        for j=1:length(dat2)-2
            
            dat_name2=dat2(1,j+2);
            s2=strcat(s1,'\',char(dat_name2));
            ncid=netcdf.open(s2,'NC_NOWRITE');
%             
%             gattname=netcdf.inqAttName(ncid,netcdf.getConstant('NC_GLOBAL'),4);
%             year1=netcdf.getAtt(ncid,netcdf.getConstant('NC_GLOBAL'),gattname);
%             
%             gattname=netcdf.inqAttName(ncid,netcdf.getConstant('NC_GLOBAL'),5);
%             month1=netcdf.getAtt(ncid,netcdf.getConstant('NC_GLOBAL'),gattname);
%             
%             gattname=netcdf.inqAttName(ncid,netcdf.getConstant('NC_GLOBAL'),6);
%             day1=netcdf.getAtt(ncid,netcdf.getConstant('NC_GLOBAL'),gattname);
%             
%             doy1=doyy;
%             gattname=netcdf.inqAttName(ncid,netcdf.getConstant('NC_GLOBAL'),7);
%             hour1=netcdf.getAtt(ncid,netcdf.getConstant('NC_GLOBAL'),gattname);
%             
%             gattname=netcdf.inqAttName(ncid,netcdf.getConstant('NC_GLOBAL'),8);
%             minute1=netcdf.getAtt(ncid,netcdf.getConstant('NC_GLOBAL'),gattname);
%             
%             gattname=netcdf.inqAttName(ncid,netcdf.getConstant('NC_GLOBAL'),9);
%             second1=netcdf.getAtt(ncid,netcdf.getConstant('NC_GLOBAL'),gattname);
%             
%             ut1=double(hour1)+double(minute1)/60+second1/3600;
%             
%             gattname=netcdf.inqAttName(ncid,netcdf.getConstant('NC_GLOBAL'),29);
%             lt1=netcdf.getAtt(ncid,netcdf.getConstant('NC_GLOBAL'),gattname);
%             
%             gattname=netcdf.inqAttName(ncid,netcdf.getConstant('NC_GLOBAL'),30);
%             hmf21=netcdf.getAtt(ncid,netcdf.getConstant('NC_GLOBAL'),gattname);
            
            gattname=netcdf.inqAttName(ncid,netcdf.getConstant('NC_GLOBAL'),31);
            lat1=netcdf.getAtt(ncid,netcdf.getConstant('NC_GLOBAL'),gattname);
            
            gattname=netcdf.inqAttName(ncid,netcdf.getConstant('NC_GLOBAL'),32);
            lon1=netcdf.getAtt(ncid,netcdf.getConstant('NC_GLOBAL'),gattname);
            
%             gattname=netcdf.inqAttName(ncid,netcdf.getConstant('NC_GLOBAL'),35);
%             nmf21=netcdf.getAtt(ncid,netcdf.getConstant('NC_GLOBAL'),gattname);
            
            gattname=netcdf.inqAttName(ncid,netcdf.getConstant('NC_GLOBAL'),38);
            tec1=netcdf.getAtt(ncid,netcdf.getConstant('NC_GLOBAL'),gattname);
            
%             year(num)=year1;
%             month(num)=month1;
%             day(num)=day1;
%             doy(num)=doy1;
%             ut(num)=ut1;
%             lt(num)=lt1;
%             hmf2(num)=hmf21;
%             nmf2(num)=nmf21;
%             lat(num)=lat1; 
%             lon(num)=lon1;
%             tec(num)=tec1;

            lat(j,i)=lat1; %´æÎª¶þÎ¬¾ØÕó
            lon(j,i)=lon1;
            tec(j,i)=tec1;
            num=num+1;
            netcdf.close(ncid);
            clear dat_name2 s2
        end    
        clear dat_name1 cell_str doyy s1 dat2
    end
    clear kk dat1
end
cd('D:\DCGAN\program');
% save('D:\DCGAN\program\tec2011_2.mat','year','month','day','doy','ut','lt','lat','lon','tec');
save('D:\DCGAN\program\tec2011_2.mat','lat','lon','tec');