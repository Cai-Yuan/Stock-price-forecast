function data=get_historal_data_function(stock_name)
% clc; 这个函数是输入股票名，输出这个股票的历史800个数据
% clear;
%第一行：日期
%第二行：开盘价
%第三行：最高价
%第四行：最低价
%第五行：收盘价
%第六行：成交量

%在运行之前一定要检查 判定日期
% stock_name='sz002565';
 data={};
 Number_of_Days  =  '400';%读取数据的个数

 % %新浪历史数据接口:   
         XL_WebSite=['http://money.finance.sina.com.cn/quotes_service/api/json_v2.php/CN_MarketData.getKLineData?symbol=',stock_name,'&scale=240&ma=no&datalen=',Number_of_Days];
     %   XL_WebSite='http://money.finance.sina.com.cn/quotes_service/api/json_v2.php/CN_MarketData.getKLineData?symbol=sh000001&scale=240&ma=no&datalen=500';
      %  HX_WebSite='http://webstock.quote.hermes.hexun.com/a/kline?code=sse601398&start=20170909000000&number=-1000&type=5&callback=callback'

%Default_Saving_Path='C:\Users\Qiuyinz\Desktop\stock\XL_historial_stock_data\';%默认的储存路径
% file_name=xlsx_file_list{i}(end-12:end-5);
% File_Full_Path=[Default_Saving_Path,file_name,'.xlsx']; 


    % web(XL_WebSite);
     sourcefile=urlread(XL_WebSite,'timeout',15);

     if strcmp(sourcefile,'null') 
        disp([ stock_name,':was skiped']);
     end
     
     
     weizhi = strfind(sourcefile,'"');
     weizhi_day = strfind(sourcefile,'day');
     [real_days_row,~]=size(weizhi_day');   %实际读入了多少个数据

     data{1,1}='Date';data{2,1}='Open';data{3,1}='High';data{4,1}='Low';data{5,1}='Close';data{6,1}='Volume';

% data{7,1}='Outer disk';data{8,1}='Inner disk';data{9,1}='Ups and downs';
% data{10,1}='Turnover rate';data{11,1}='P/E ratio';data{12,1}='Circulation market value';data{13,1}='The total market capitalization';data{14,1}='P/B ratio';
% data{15,1}='Main inflow';data{16,1}='Main outflow';data{17,1}='Main net inflow';data{18,1}='Retail inflow';data{19,1}='Retail outflow';data{20,1}='Retail net inflow';

    for j=1:real_days_row
    data{1,j+1}= sourcefile(weizhi(j*12-12+1)+1:weizhi(j*12-12+2)-1) ;  
    data{2,j+1}=str2double( sourcefile(weizhi(j*12-12+3)+1:weizhi(j*12-12+4)-1));
    data{3,j+1}=str2double( sourcefile(weizhi(j*12-12+5)+1:weizhi(j*12-12+6)-1));
    data{4,j+1}=str2double( sourcefile(weizhi(j*12-12+7)+1:weizhi(j*12-12+8)-1));
    data{5,j+1}=str2double( sourcefile(weizhi(j*12-12+9)+1:weizhi(j*12-12+10)-1));
    data{6,j+1}=str2double( sourcefile(weizhi(j*12-12+11)+1:weizhi(j*12-12+12)-1));   
    end

    
         % if strcmp(data(1,real_days_row+1),judgement_date)
         %  xlswrite(File_Full_Path,data);
         % end

end


