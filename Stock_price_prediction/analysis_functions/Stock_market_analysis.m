%function output=Stock_market_analysis()
       %���������Ҫ���ڷ������̣������������֣���һ����ʾ��ָ���ڶ�����ʾ����ָ��
       clc;
       clear;
       
       output=zeros(1,2);

       DATA_shanghai =xlsread('C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sh000001.xlsx');
       DATA_shanghai=DATA_shanghai(1:9,:);
       %DATA_shenzhen =xlsread('C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sz399001.xlsx');
     
       DATA_shenzhen = get_historal_data_function('sz399001');
       %  DATA_shenzhen = DATA_shenzhen(1:9,:);
       
       
       different_stages=stage_division(DATA_shenzhen(5,2:end));
       
       
       
       
       %plot( DATA_shanghai(5,:))
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       




























%end