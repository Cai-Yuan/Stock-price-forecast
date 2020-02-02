
 function output_results=individual_stock_characteristics(data1,data2) 

% clc;
% clear;
% 
% data1=[1,1,44,44,-1,146,146,1,167,167,-1,342,342,1,365,365,-1,400];
% 
% data2=[239669,154414,186127,241307,184262,158087,157156,157049,68327;107792,73904,77929,143837,106417,93928,67608,68977,18637;131876,80507,108194,97460,77845,64156,89541,88065,49690;-2.13000000000000,-1.63000000000000,-3.05000000000000,4.86000000000000,1.09000000000000,1.35000000000000,-0.800000000000000,0,-0.800000000000000;1.07000000000000,0.690000000000000,0.830000000000000,1.07000000000000,0.820000000000000,0.700000000000000,0.700000000000000,0.700000000000000,0.300000000000000;0.830000000000000,0.810000000000000,0.790000000000000,0.830000000000000,0.830000000000000,0.850000000000000,0.840000000000000,0.840000000000000,0.830000000000000;82.4800000000000,81.1300000000000,78.6600000000000,82.4800000000000,83.3800000000000,84.5000000000000,83.8300000000000,83.8300000000000,83.1500000000000;82.4800000000000,81.1300000000000,78.6600000000000,82.4800000000000,83.3800000000000,84.5000000000000,83.8300000000000,83.8300000000000,83.1500000000000;7.74000000000000,7.62000000000000,7.39000000000000,7.74000000000000,7.83000000000000,7.93000000000000,7.87000000000000,7.87000000000000,7.81000000000000;642.090000000000,377.460000000000,265.680000000000,1816.96000000000,579.090000000000,948.340000000000,196.810000000000,633.300000000000,0;1184.75000000000,76.0400000000000,716.870000000000,533.610000000000,330.740000000000,231.210000000000,420.160000000000,274.530000000000,394.820000000000;-542.660000000000,301.420000000000,-451.190000000000,1283.35000000000,248.350000000000,717.130000000000,-223.360000000000,358.780000000000,-394.820000000000;3364.89000000000,2340.08000000000,2509.78000000000,3378.30000000000,3380.40000000000,2575.80000000000,2351,1946.05000000000,690.560000000000;3590.25000000000,2659.09000000000,3026.25000000000,2787.79000000000,2295.80000000000,2087.62000000000,2872.28000000000,2912.02000000000,1419.02000000000;-225.360000000000,-319.010000000000,-516.480000000000,590.510000000000,1084.59000000000,488.180000000000,-521.280000000000,-965.970000000000,-728.460000000000];

%data1:极值点
% Volume
% Outer disk
% Inner disk
% Ups and downs
% Turnover rate
% P/E ratio
% Circulation market value
% The total market capitalization
% P/B ratio
% Main inflow
% Main outflow
% Main net inflow
% Retail inflow
% Retail outflow
% Retail net inflow
%%

  [data2_r,data2_c]=size(data2);

  if data2_r ~=15 || mod(length(data1),3) ~=0
     error('Invalid argument provided. The length of the data shoulb be 15 ');
  end
 
    if data2_c>= data1(end)   %% 把数据弄成和分析数据一样，不管有没有那么长
               data2=data2(:,data2_c-data1(end)+1:data2_c);
    else
               data2=[zeros(15,data1(end)-data2_c),data2];
    end

%     for k=1:data2_r
%         
%     data2(k,1:400)=1:400;
%     
%     end
    
%%  
         difference_outer_inner_disk=data2(2,:)-data2(3,:);               %%--外盘与内盘的差
         data2=[data2;difference_outer_inner_disk];
 %%返回分为，上涨初期，上涨末期，下跌初期，下跌末期，
 
 %%1：外盘与内盘的差。2：主力资金的净流入。3：换手率的变化


            numbers_of_stages=length(data1)/3;
            A_rise_1=[];
            A_rise_2=[];
            A_down_1=[];
            A_down_2=[];
            A_draw_1=[];
            A_draw_2=[];

    if      numbers_of_stages ==1   %只分为一个阶段
            
                      if data1(2) == 1
                    
                          C_1= data2(:,data1(1): floor((data1(3)-data1(1))/2)  ) ;
                          C_2= data2(:,round((data1(3) - data1(1))/2):data1(3)    ) ;
                                       
                      elseif data1(2) == -1
                    
                          C_1= data2(:,data1(1):floor((data1(3)-data1(1))/2)  ) ;
                          C_2= data2(:,round((data1(3)-data1(1))/2):data1(3)    ) ;
                    
                      elseif data1(2) == 0
                    
                          C_1= data2(:,data1(1):floor((data1(3)-data1(1))/2)  );
                          C_2= data2(:,round((data1(3*ii)-data1(1))/2):data1(3) );   
                      end
            
            
    elseif     numbers_of_stages >1
            
         for ii=1:numbers_of_stages

              if ii == numbers_of_stages
                       if data1(3*ii-1) ==1
                    
                          C_1= data2(:,data1(3*ii-2):data1(3*ii-2) + floor((data1(3*ii)-data1(3*ii-2))/2)  ) ;
                          C_2= data2(:,data1(3*ii-2)+round((data1(3*ii) - data1(3*ii-2))/2):data1(3*ii)    ) ;
                                       
                       elseif data1(3*ii-1) ==-1
                    
                          C_1= data2(:,data1(3*ii-2):data1(3*ii-2)+floor((data1(3*ii)-data1(3*ii-2))/2)  ) ;
                          C_2= data2(:,data1(3*ii-2)+round((data1(3*ii)-data1(3*ii-2))/2):data1(3*ii)    ) ;
                    
                       elseif data1(3*ii-1) ==0
                    
                          C_1= data2(:,data1(3*ii-2):data1(3*ii-2)+floor((data1(3*ii)-data1(3*ii-2))/2)  );
                          C_2= data2(:,data1(3*ii-2)+round((data1(3*ii)-data1(3*ii-2))/2):data1(3*ii)    );   
                       end
                
              else
                     if data1(3*ii-1) ==1

                           A_rise_1=[A_rise_1, data2(:,data1(3*ii-2):data1(3*ii-2) + floor((data1(3*ii)-data1(3*ii-2))/2)  ) ];
                           A_rise_2=[A_rise_2, data2(:,data1(3*ii-2)+round((data1(3*ii) - data1(3*ii-2))/2):data1(3*ii)    ) ];
                                       
                      elseif data1(3*ii-1) ==-1
                    
                           A_down_1=[A_down_1, data2(:,data1(3*ii-2):data1(3*ii-2)+floor((data1(3*ii)-data1(3*ii-2))/2)  ) ];
                           A_down_2=[A_down_2, data2(:,data1(3*ii-2)+round((data1(3*ii)-data1(3*ii-2))/2):data1(3*ii)    ) ];
                    
                      elseif data1(3*ii-1) ==0
                    
                            A_draw_1=[A_draw_1, data2(:,data1(3*ii-2):data1(3*ii-2)+floor((data1(3*ii)-data1(3*ii-2))/2)  )];
                            A_draw_2=[A_draw_2, data2(:,data1(3*ii-2)+round((data1(3*ii)-data1(3*ii-2))/2):data1(3*ii)    )];   
                      end
              end

         end
             
    end
    
    
    
    
    
             for j=1:data2_r+1

                 if ~isempty(A_rise_1)
                  output_results(j,1)=sum(A_rise_1(j,:))/length(A_rise_1(j,:));
                  output_results(j,2)=sum(A_rise_2(j,:))/length(A_rise_2(j,:));
                 else
                     output_results(j,1)=0;
                     output_results(j,2)=0;
                 end
                 
                 if ~isempty(A_down_1)
                  output_results(j,3)=sum(A_down_1(j,:))/length(A_down_1(j,:));
                  output_results(j,4)=sum(A_down_2(j,:))/length(A_down_2(j,:));
                  else
                     output_results(j,3)=0;
                     output_results(j,4)=0;
                 end
                 
                 if ~isempty(A_draw_1)
                  output_results(j,5)=sum(A_draw_1(j,:))/length(A_draw_1(j,:));
                  output_results(j,6)=sum(A_draw_2(j,:))/length(A_draw_2(j,:));
                  else
                     output_results(j,5)=0;
                     output_results(j,6)=0;
                 end
                  
                  output_results(1,7)=data1(3*ii-1);
                  output_results(j,8)=sum( C_1(j,:))/length( C_1(j,:));
                  output_results(j,9)=sum( C_2(j,:))/length( C_2(j,:));
               
             end

end












