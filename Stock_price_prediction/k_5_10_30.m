function   output_results = k_5_10_30(data)  %输入应该是一行400列

        [data_r,data_c]=size(data);
         
         if data_r ~=1 
             error('Invalid argument provided.');  
         end
         
         if data_c < 30
             output_results=zeros(3,data_c); %数据量小于30是不分析的
             return;
         end
 %% %%%%%%%%%%%%%%%%%%%%%%%%%%        

        output_results=zeros(3,data_c); %创建20天平均值  
        
        
         for i = 1:data_c  %这个是K20
                  
                     if i<21
                         output_results(1,i) = sum(data(1:i))/i;
                     else
                         output_results(1,i) = sum(data(i-20:i))/21;
                     end  
                     
          end

   %     plot(output_results,'r');
          for i = 1:data_c %这个是K10
                  
                     if i<6
                         output_results(2,i) = sum(data(1:i))/i;
                     else
                         output_results(2,i) = sum(data(i-5:i))/6;
                     end  
          end


          
         for i = 1:data_c %这个是K30
                  
                     if i<31
                         output_results(3,i) = sum(data(1:i))/i;
                     else
                         output_results(3,i) = sum(data(i-30:i))/31;
                     end  
          end



end