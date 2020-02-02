clc;
%clear;

clear;
addpath(genpath(pwd));
xlsx_file_list=scan_xlsx_file();% read in all the stock path
file_number=length(xlsx_file_list);

%第一行：日期 %第二行：开盘价 %第三行：最高价 %第四行：最低价 %第五行：收盘价 %第六行：成交量
%7行：外盘 %8行：内盘 %9行：涨跌 %10行：换手率 %11行：市净率 %12行：流通市值 %13行：总市值
%14行：市盈率 %15行：主力流入 %16行：主力流出 %17行：主力净流入 %18行：散户流入 %19行：散户流出 %20行：散户净流入

analysis_sheet={};%用于记录分析结果
analysis_sheet{1,1}='股票'; analysis_sheet{1,2}='当日波动'; analysis_sheet{1,3}='是否反弹';analysis_sheet{1,4}='是否暴跌';analysis_sheet{1,5}='出息除权'; analysis_sheet{1,6}='K30>K5_100'; analysis_sheet{1,7}='K30>K5_300';analysis_sheet{1,8}='K30>K5_400';analysis_sheet{1,9}='最大跌幅'; analysis_sheet{1,10}='双W底'; analysis_sheet{1,11}='主力活跃度';analysis_sheet{1,12}='主力流入100天';analysis_sheet{1,13}='主力流入200天';analysis_sheet{1,14}='主力流入300天'; analysis_sheet{1,15}='主力平均买入价'; analysis_sheet{1,16}='主力平均卖出价';analysis_sheet{1,17}='交易量放大';analysis_sheet{1,18}='外盘大于内盘时，股价上涨的概率'; analysis_sheet{1,19}='当外盘小于内盘时，股价下跌的概率'; analysis_sheet{1,20}='当前价格';

m=1;%用于记录有效的数据
% rise_stock_selected=zeros(10,1);
% down_stock_selected=zeros(10,1);

for i=520:520 %file_number
    i
    DATA_TX =xlsread(xlsx_file_list{i});  %腾讯的数据
    [data_TX_row, data_TX_col]=size(DATA_TX);

    %% 跳过两个大盘
    if  data_TX_col<7 || strcmp(xlsx_file_list{i} , 'C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sz399001.xlsx') || strcmp(xlsx_file_list{i} , 'C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sh000001.xlsx')
        continue;   %跳过两个大盘
    end 
    %%跳过两个大盘
        %% 得到新浪的数据
         historial_data = get_historal_data_function(xlsx_file_list{i}(end-12:end-5)); %新浪的数据
         [historial_data_row, historial_data_col] = size( historial_data );
         historial_data=cell2mat( historial_data(2:end,2:end));
          %%得到新浪的数据
%% 第一个判断依据 最近七天跌幅最大
     para=sum(DATA_TX(9,end-6:end));      %长期下跌 并且 最近七天是不是暴跌  
     if para < -12 

          data2=historial_data(4,1:end);%历史股价
          results2=stock_price_trend(data2); %1:判断过去200天中是不是除权出息，---------------
                                             %2:在过去100天中，K30大于K5的天数--------------
                                             %3:过去300天中K30大于K5的天数,----------------
                                             %4:过去400天中K30大于K5的天数 -------------
                                             %5:过去400天，股价最大跌幅 【0,1】 为0，创新高
       
         different_stages=stage_division(data2);
         
        if results2(2)>70 || results2(3)>220 || results2(4)>310
           rise_stock_selected{m,1}= xlsx_file_list{i}(end-12:end-5);%股票名字
           rise_stock_selected{m,2}=DATA_TX(5,data_TX_col); %当前价格
           day30_day20=plot_day20_and_day30(data2);   %画出曲线
           m=m+1;
           pause;
        end
              
        
     end
%%  第二一个判断依据
              
     
         % if different_stages(end-1) == -1 && different_stages(end)-different_stages(end-2)>60
     
         % different_stages=stage_division(data2);
 %%  主力资金大量流出，确没有大跌
         

   %  day30_day20=plot_day20_and_day30(data2);












end