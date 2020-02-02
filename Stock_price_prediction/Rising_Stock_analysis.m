clear;
clc;
addpath(genpath(pwd));
xlsx_file_list=scan_xlsx_file();% read in all the stock path
file_number=length(xlsx_file_list);
m=1;



for i=1000 :1000  % file_number
      i
      DATA_TX =xlsread(xlsx_file_list{i});  %腾讯的数据
      [data_TX_row, data_TX_col]=size(DATA_TX);

    %% 跳过两个大盘 && 跳过市盈率为负 %% 跳过市值过大的公司
    if  strcmp(xlsx_file_list{i} , 'C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sz399001.xlsx') || strcmp(xlsx_file_list{i} , 'C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sh000001.xlsx')
        continue;   %跳过两个大盘
    end 
    %%跳过两个大盘
        %% 得到新浪的数据
        if DATA_TX(14,end)>0 && DATA_TX(14,end)<60 && DATA_TX(13,end)<150
           historial_data = get_historal_data_function(xlsx_file_list{i}(end-12:end-5)); %新浪的数据
           [historial_data_row, historial_data_col] = size( historial_data );
           historial_data=cell2mat( historial_data(2:end,2:end));
        else
            continue;
        end
          %%得到新浪的数据
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          

            data2=historial_data(4,1:end);%历史股价
%           max_value=max(data2);min_value=min(data2);
%           position_max_value=find(data2==max_value); position_min_value=find(data2==min_value);
          
 %         judgement = position_max_value(end)<100 && position_min_value(end)>310 && max_value/min_value >2.2 && data2(end)/min_value <1.2 && DATA_TX(13,end)<100;
           
           judgement=up_days_in_past_30_days (DATA_TX(9,:));
 
 
             
          if judgement>1 
             %   plot_every_data( DATA_TX );
                rise_stock_selected{m,1}= xlsx_file_list{i}(end-12:end-5); %股票名字
%               [day30_day20,zero_points]=plot_day20_and_day30(data2); 
                different_stages=stage_division(data2);
                m=m+1;
                pause;
               
          end
          
          
%           rise_stock_selected{m,2:length(data2)+1}=data2;


 end








