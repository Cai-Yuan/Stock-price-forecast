clc;
clear;

k=4;%等待对少小时
hours=k*3600;


for i=1:2
    
  update_daily_stock_information;
  pause(hours);

end


 