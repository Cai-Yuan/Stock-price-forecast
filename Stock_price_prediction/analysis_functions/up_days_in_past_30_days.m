function output_results =up_days_in_past_30_days (data)  % 最近30天上涨的天数

          [data_r,data_c]=size(data);
         
         if data_r ~=1  ||  data_c <24
             
             disp('Invalid argument provided.');
             output_results = 0;
             return;
         end
 %%    
     output_results =  sum(data(data_c-23:data_c))/24;
 


end









































