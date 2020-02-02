function output_results = recent_price_fluctuations(data)  %输入应该是5*N

%第一行：开盘价 
%第2行 ：最高价 
%第3行 ：最低价 
%第四行：收盘价
%第五航：涨跌

           [data_r,data_c]=size(data);   %5*N

           if data_r ~=5 && ~isempty(find(data(1:4,:)==0,1) )
              error('Invalid argument provided. The length of the data shoulb be 4 and nonzero');
           end
         
           if data_c>5  %把数据弄成5列，不管有没有5列
               data=data(:,data_c-4:data_c);
           else
               data=[zeros(5,5-data_c),data];  %最后数据必须是5*5
           end
         
         
 %%        
         A=(data(4,5)-data(1,5))/data(4,5); %收盘-开盘 越大越好
         B=(data(4,5)-data(3,5))/data(4,5); %收盘-最低 越大越好
         C=(data(2,5)-data(4,5))/data(4,5); %最高-收盘 越大越不好
         
 %%        
         
         
         output_results(1)=100*(data(2,5)-data(3,5))/data(4,5);%股价波动比例
        
         output_results(2)=100*(A+B-C);                          %当天股价是否强势反弹,正直，强势反弹，负值：危险信号
         
         
         if sum(data(5,:)) < -8                            %近5天股价是不是暴跌
               output_results(3)=-1;
         elseif  -8< sum(data(5,:)) && sum(data(5,:)) < -4 
               output_results(3)= -0.5;
         elseif  4< sum(data(5,:)) && sum(data(5,:)) <8
               output_results(3)= 0.5;
        elseif  8< sum(data(5,:))
               output_results(3)= 1;   
         else
               output_results(3)= 0;
         end
 
end