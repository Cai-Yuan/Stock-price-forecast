function output_results = outer_inner_disk_analysis(data)  % 输入的数据应该是4*n的
%1：股价
%2: 涨跌
%3：外盘
%4：内盘


% clc;
% clear;

%data=[10.05	9.9	9.77	9.9;1.82	-1.49	-1.31	1.33;43263	25135	28990	48645;32663	39171	54172	43680;];
%%  
         [data_r,data_c]=size(data);
         
         if data_r ~=4
             error('Invalid argument provided. The length of the data shoulb be 4 ');
         end
         

          if data_c>=400   %% 把数据弄成400列，不管有没有400列，我们只考虑400个交易日
               data=data(:,data_c-399:data_c);
           else
               data=[zeros(4,400-data_c),data];
          end
          
          output_results=zeros(1,3);
 %%   和过去的20天比，今天的成交量是不是突然放大
      total_volume=data(3,:)+data(4,:);
      
      if data_c>20
          para=(total_volume(400)*20)/sum(total_volume(380:399));
      else 
          para=( total_volume(400)*(data_c-1) )/sum(total_volume(380:399));
      end
       
          output_results(1)=para;   %交易量是不是突然放大,今天的交易量和过去20天交易量的平均值的比
             
 %%
        
        outer_inner_difference=data(3,400-data_c+1:400)-data(4,400-data_c+1:400);
        
         D=find( outer_inner_difference>0);  %有哪些天数是外盘大于内盘
         G=find( outer_inner_difference<0); %有哪些天数是外盘小于内盘
         
         T=length(D);
         H=length(G);

         U=   data(2,400-data_c+1:400); %取出有效的涨落数据
         
         t=length(  find(U(D)>0)  );
         h=length(  find(U(G)<0)  );
         
         
         output_results(2)=t/T;    %近400天内，当外盘大于内盘时，股价上涨的概率
         output_results(3)=h/H;    %近400天内，当外盘小于内盘时，股价下跌的概率，值越靠近0 或者1时，越说明有规律。是个耿直的庄稼
         
         
    
        
end