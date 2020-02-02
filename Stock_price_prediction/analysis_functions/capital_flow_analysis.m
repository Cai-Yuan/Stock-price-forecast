function output_results = capital_flow_analysis(data)  %输入应该是8行多列，等待测试
% clc;
% clear;

%股价
%Main inflow
%Main outflow
%4：Main net inflow
%Retail inflow
%Retail outflow
%Retail net inflow
%Circulation market value

%         data(1,:)   =  xlsread('C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sh600018.xlsx', 'sheet1', 'b5:c5');
%        
%         data(2:7,:) =  xlsread('C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sh600018.xlsx', 'sheet1', 'b15:c22');
%        
%         data(8,:) =  xlsread('C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sh600018.xlsx', 'sheet1', 'b12:c12');
 



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [data_r,data_c]=size(data);
         
         if data_r ~=8
             error('Invalid argument provided. The row of the data shoulb be 7');
         end      

           if data_c>300  %把数据弄成300列，不管有没有300列，我们只考虑300个交易日
               data=data(:,data_c-300:data_c);
           else
               data=[zeros(8,300-data_c),data];
           end
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%近100天，主力是否活跃,值越大说明主力近期更活跃

            output_results(1)= (  sum(abs(data(2,200:300)))+sum(abs(data(3,200:300)))  )/ ( sum(abs(data(5,200:300)))+sum(abs(data(6,200:300)))   ) ;

%% 近100,200,300天，主力净流入市值百分比
              inflow_100=data(4,200:300) ./(data(8,200:300)*10000);
              inflow_200=data(4,100:300) ./(data(8,100:300)*10000);
              inflow_300=data(4,1:300)   ./(data(8,1:300)*10000);    %每天主力净流入的百分比
              
              inflow_100(isnan(inflow_100(1,:))==1)=0; %去掉 NaN的值
              inflow_200(isnan(inflow_200(1,:))==1)=0; %去掉 NaN的值
              inflow_300(isnan(inflow_300(1,:))==1)=0; %去掉 NaN的值
         
            output_results(2)= sum(     inflow_100  );%    data(4,200:300) ./data(8,200:300)                 );
            output_results(3)= sum(     inflow_200  );%    data(4,100:300) ./data(8,100:300)                 );
            output_results(4)= sum(     inflow_300  );%    data(4,1:300)   ./  data(8,1:300)                 ); 主力净流入

%% 近300天主力平均买入价,平均卖出价
            positive_index=find(inflow_300>0); %所有净流入的位置
            positive_inflow_300=inflow_300(positive_index); %净流入的值

            nagetive_index=find(inflow_300<0);
            nagetive_inflow_300=inflow_300(nagetive_index);
            
            output_results(5)=sum(   positive_inflow_300 .*data(1,positive_index) )/sum(positive_inflow_300); %最近300天，主力平均买入价
            output_results(6)=sum(    nagetive_inflow_300 .*data(1,nagetive_index) )/sum(nagetive_inflow_300);%最近300天，主力平均卖出价
            



end