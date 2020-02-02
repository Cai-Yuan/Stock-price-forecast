clc;
clear;
close all;


xlsx_file_list=scan_xlsx_file();% read in all the stock path
file_number=length(xlsx_file_list);
data_dapan=xlsread('C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sh000001.xlsx');

for i=1390:1399   %file_number
        if strcmp(xlsx_file_list{i} , 'C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sz399001.xlsx') || strcmp(xlsx_file_list{i} , 'C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sh000001.xlsx')
        continue;   %跳过两个大盘
        end
    i
    data_TX =xlsread(xlsx_file_list{i});  %腾讯的数据
    [data_TX_row, data_TX_col]=size(data_TX);
    
    
    
      [different_stages,final_peaks]=stage_division(data_TX(13,:));
     
%      
     if different_stages(end-1) <=0
        continue;   
     end
    
    
    
    
    %%
   k=k_5_10_30(data_TX(5,:)); %画出k曲线
   
   subplot(3,3,1)
   set(gcf,'position',[200,100,1600,800]) %设置整个图片的位置和大小
   set(gca, 'Units', 'centimeters', 'Position', [1, 15, 10,6]); %设置当前子图片的位置和大小
 
   kplot = plot(data_TX(5,:));
   %get(kplot ,'xmin')
     hold on
    plot(k(1,:));
     hold on
    plot(k(2,:));
     hold on
    plot(k(3,:));
    legend('K线图','location','northwest');
   %% 画出分段的曲线
    % [different_stages,final_peaks]=stage_division(data_TX(13,:)); 
     day20=data_smoothing(data_TX(13,:));   

         subplot(3,3,2)
         set(gca, 'Units', 'centimeters', 'Position', [12, 15, 10,6]);
         
         plot(data_TX(13,:));
         hold on
         plot(day20,'b');
         hold on
         plot( final_peaks,data_TX(13, final_peaks),'*');
         
         for u=1:length(final_peaks)
         hold on
         plot( linspace(final_peaks(u),final_peaks(u),100),linspace(0.9*min(data_TX(13,:)),data_TX(13, final_peaks(u)),100)  );
         end
         
         legend('数据分段','location','northwest');
    %% 将个股数据和大盘数据对齐
    
         data_aligned = alignment_data(data_dapan,data_TX);
         
         subplot(3,3,3)
         set(gca, 'Units', 'centimeters', 'Position', [23, 15, 18.4,6]);
        
         upanddown=data_aligned(13,:);upanddown(upanddown>11)=11;
         
         b_gegu = bar(upanddown,'g');
         hold on
         b_dapan = bar(data_aligned(4,:),'r');
         
         for u=1:length(final_peaks)
         hold on   
         plot( linspace(final_peaks(u),final_peaks(u),100),linspace(-10,10,100)  );
         end
         legend('个股涨跌和大盘的关系','location','northwest')
         
         for t=1:length(data_aligned(1,:))
             
             if (data_aligned(4,t)<-3 && data_aligned(13,t)>0)
                 plot(t,10.5,'*');
             end
             
         end
         
         
 %%  判断是不是有新解禁的股票    
         subplot(3,3,4)
         set(gca, 'Units', 'centimeters', 'Position', [1, 8.5, 10,6]);  
        
         plot(data_TX(12,:),'b');
         hold on
         plot(data_TX(13,:)*data_TX(12,1)/data_TX(13,1),'r');
         legend('流通市值','总市值','location','northwest');
         

%% CCi是否背离
         subplot(3,3,5)
         set(gca, 'Units', 'centimeters', 'Position', [12, 8.5, 10, 6]);
         cci=cci_caiculation(data_TX(3:5,:));
          plot(cci);
          hold on
          plot(1:data_TX_col,linspace(100,100,data_TX_col));
          hold on
          plot(1:data_TX_col,linspace(-100,-100,data_TX_col));
          
         for u=1:length(final_peaks)
              hold on
              plot( linspace(final_peaks(u),final_peaks(u),100),linspace(-100,100,100)  );
         end
         legend('CCI背离','location','northwest')
         
        
                  
%% 主力的流入与流出
         
         subplot(3,3,6)
         set(gca, 'Units', 'centimeters', 'Position', [23, 8.5, 18.4,6]);
         bar(data_aligned(21,:),'r')
         hold on
         bar(data_aligned(24,:),'b');
         legend('主力净流入','散户净流入','location','northwest')
          
%% 内盘与外盘
         
         subplot(3,3,9)
         set(gca, 'Units', 'centimeters', 'Position', [23, 1.5, 18.4,6]);
        
         bar(10*data_aligned(11,:)/max(data_aligned(11,:)),'r')
         hold on
         bar(10*data_aligned(12,:)/max(data_aligned(12,:)),'b');
         legend('外盘买入','内盘卖出','location','northwest')
         
         for u=1:length(final_peaks)%画出分段的直线
         hold on
         plot( linspace(final_peaks(u),final_peaks(u),100),linspace(0,10,100)  );
         end
         

         
%% 主力活跃度
          
          subplot(3,3,7)
          set(gca, 'Units', 'centimeters', 'Position', [1, 1.5, 10,6]);
          
         ratio=(data_TX(15,:) + data_TX(16,:) ) ./  (  data_TX(18,:)+data_TX(19,:)  );
         ratio_day20=data_day20(ratio);

         plot(  ratio,  'b');
         hold on
         plot(ratio_day20);

         legend('主力活跃度','location','northwest')

%pause;


    
end






















