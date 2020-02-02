
clear;
clc;
addpath(genpath(pwd));
xlsx_file_list=scan_xlsx_file();% read in all the stock path
file_number=length(xlsx_file_list);


for i=1 :  file_number
      i
      
      File_Full_Path=xlsx_file_list{i};
      
      DATA_TX =xlsread(xlsx_file_list{i});  %腾讯的数据
      [data_TX_row, data_TX_col]=size(DATA_TX);
      
      if  DATA_TX(1,end)== DATA_TX(1,end-1)
         
          flag1=1;
          DATA_TX(:,end)=[];
          delete(File_Full_Path) ;
          pause(0.005);
          xlswrite( File_Full_Path,DATA_TX);
          pause(0.005);
          
      else
          continue;
          
      end


end



