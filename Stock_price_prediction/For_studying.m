clear;
clc;
addpath(genpath(pwd));
xlsx_file_list=scan_xlsx_file();% read in all the stock path
file_number=length(xlsx_file_list);
m=1;



for i=500:500  % file_number
    i
      DATA_TX =xlsread(xlsx_file_list{i});  %��Ѷ������
      [data_TX_row, data_TX_col]=size(DATA_TX);

    %% ������������ && ������ӯ��Ϊ�� %% ������ֵ����Ĺ�˾
    if  strcmp(xlsx_file_list{i} , 'C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sz399001.xlsx') || strcmp(xlsx_file_list{i} , 'C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sh000001.xlsx')
        continue;   %������������
    end 
    %%������������
        %% �õ����˵�����
        if DATA_TX(14,end)>0 && DATA_TX(14,end)<60 && DATA_TX(13,end)<150 
           historial_data = get_historal_data_function(xlsx_file_list{i}(end-12:end-5)); %���˵�����
           [historial_data_row, historial_data_col] = size( historial_data );
           historial_data=cell2mat( historial_data(2:end,2:end));
        else
            continue;
        end
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         
          m=0;
          for j = 1:data_TX_col%%�����������ǵ��Ĺ�ϵ
              
              if ( DATA_TX(17,j)>0 && DATA_TX(9,j)>=0 ) || (DATA_TX(17,j)<0 && DATA_TX(9,j)<0)
                  m=m+1;
              end
              
          end
              
              
              


       if m>0.05*data_TX_col
        data2=historial_data(4,1:end);%��ʷ�ɼ�
        different_stages=stage_division(data2);
        
        figure;
        subplot(3,1,1)
        bar( DATA_TX(9,:));
        subplot(3,1,2)
        bar( DATA_TX(17,:));
        subplot(3,1,3)
        bar( DATA_TX(20,:));
        pause;

       end
        
        
        
     %   plot( data2);
        
        
        
        
        
        
        
        
        
        
        
        
end