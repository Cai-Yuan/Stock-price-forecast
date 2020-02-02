clc;
clear;
close all;


xlsx_file_list=scan_xlsx_file();% read in all the stock path
file_number=length(xlsx_file_list);
data_dapan=xlsread('C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sh000001.xlsx');

for i=1390:1399   %file_number
        if strcmp(xlsx_file_list{i} , 'C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sz399001.xlsx') || strcmp(xlsx_file_list{i} , 'C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sh000001.xlsx')
        continue;   %������������
        end
    i
    data_TX =xlsread(xlsx_file_list{i});  %��Ѷ������
    [data_TX_row, data_TX_col]=size(data_TX);
    
    
    
      [different_stages,final_peaks]=stage_division(data_TX(13,:));
     
%      
     if different_stages(end-1) <=0
        continue;   
     end
    
    
    
    
    %%
   k=k_5_10_30(data_TX(5,:)); %����k����
   
   subplot(3,3,1)
   set(gcf,'position',[200,100,1600,800]) %��������ͼƬ��λ�úʹ�С
   set(gca, 'Units', 'centimeters', 'Position', [1, 15, 10,6]); %���õ�ǰ��ͼƬ��λ�úʹ�С
 
   kplot = plot(data_TX(5,:));
   %get(kplot ,'xmin')
     hold on
    plot(k(1,:));
     hold on
    plot(k(2,:));
     hold on
    plot(k(3,:));
    legend('K��ͼ','location','northwest');
   %% �����ֶε�����
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
         
         legend('���ݷֶ�','location','northwest');
    %% ���������ݺʹ������ݶ���
    
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
         legend('�����ǵ��ʹ��̵Ĺ�ϵ','location','northwest')
         
         for t=1:length(data_aligned(1,:))
             
             if (data_aligned(4,t)<-3 && data_aligned(13,t)>0)
                 plot(t,10.5,'*');
             end
             
         end
         
         
 %%  �ж��ǲ������½���Ĺ�Ʊ    
         subplot(3,3,4)
         set(gca, 'Units', 'centimeters', 'Position', [1, 8.5, 10,6]);  
        
         plot(data_TX(12,:),'b');
         hold on
         plot(data_TX(13,:)*data_TX(12,1)/data_TX(13,1),'r');
         legend('��ͨ��ֵ','����ֵ','location','northwest');
         

%% CCi�Ƿ���
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
         legend('CCI����','location','northwest')
         
        
                  
%% ����������������
         
         subplot(3,3,6)
         set(gca, 'Units', 'centimeters', 'Position', [23, 8.5, 18.4,6]);
         bar(data_aligned(21,:),'r')
         hold on
         bar(data_aligned(24,:),'b');
         legend('����������','ɢ��������','location','northwest')
          
%% ����������
         
         subplot(3,3,9)
         set(gca, 'Units', 'centimeters', 'Position', [23, 1.5, 18.4,6]);
        
         bar(10*data_aligned(11,:)/max(data_aligned(11,:)),'r')
         hold on
         bar(10*data_aligned(12,:)/max(data_aligned(12,:)),'b');
         legend('��������','��������','location','northwest')
         
         for u=1:length(final_peaks)%�����ֶε�ֱ��
         hold on
         plot( linspace(final_peaks(u),final_peaks(u),100),linspace(0,10,100)  );
         end
         

         
%% ������Ծ��
          
          subplot(3,3,7)
          set(gca, 'Units', 'centimeters', 'Position', [1, 1.5, 10,6]);
          
         ratio=(data_TX(15,:) + data_TX(16,:) ) ./  (  data_TX(18,:)+data_TX(19,:)  );
         ratio_day20=data_day20(ratio);

         plot(  ratio,  'b');
         hold on
         plot(ratio_day20);

         legend('������Ծ��','location','northwest')

%pause;


    
end






















