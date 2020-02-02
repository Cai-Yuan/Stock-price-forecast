%在运行之前一定要检查 判定日期， 不知道这个是干嘛用的
clc;
clear;
judgement_date='2018-12-28';


%第一行：日期
%第二行：开盘价
%第三行：最高价
%第四行：最低价
%第五行：收盘价
%第六行：成交量


xlsx_file_list=scan_xlsx_file();%读取腾讯每天股价的文件
file_number=length(xlsx_file_list);
%All_Stock_Code=import_stock_code();%读入那个完整的股票代码
Number_of_Days='800';%读取数据的个数

%History_data_Raw=6;

Default_Saving_Path='C:\Users\Qiuyinz\Desktop\stock\XL_historial_stock_data\';%默认的储存路径

%[row,col]=size(All_Stock_Code);


for i=10:10%file_number
    xiaoshi=i
    data={};
    file_name=xlsx_file_list{i}(end-12:end-5);
    File_Full_Path=[Default_Saving_Path,file_name,'.xlsx'];  
    
    
    
%     if  exist(File_Full_Path,'file')
%         xlswrite(File_Full_Path,data,'sheet1');  %将Excel中旧数据删除
%     end


      % %新浪历史数据接口:   
     XL_WebSite=['http://money.finance.sina.com.cn/quotes_service/api/json_v2.php/CN_MarketData.getKLineData?symbol=',file_name,'&scale=240&ma=no&datalen=',Number_of_Days];
     %XL_WebSite='http://money.finance.sina.com.cn/quotes_service/api/json_v2.php/CN_MarketData.getKLineData?symbol=sh000001&scale=240&ma=no&datalen=500';

     [sourcefile,status]=urlread(XL_WebSite);

     if strcmp(sourcefile,'null') || status == 0
        diaplay=[ file_name,':was skiped']
         continue;
     end
     
     
     weizhi = strfind(sourcefile,'"');
     weizhi_day = strfind(sourcefile,'day');
     [real_days_row,real_days_col]=size(weizhi_day'); %实际读入了多少个数据





data{1,1}='Date';data{2,1}='Open';data{3,1}='High';data{4,1}='Low';data{5,1}='Close';data{6,1}='Volume';


% data{7,1}='Outer disk';data{8,1}='Inner disk';data{9,1}='Ups and downs';
% data{10,1}='Turnover rate';data{11,1}='P/E ratio';data{12,1}='Circulation market value';data{13,1}='The total market capitalization';data{14,1}='P/B ratio';
% data{15,1}='Main inflow';data{16,1}='Main outflow';data{17,1}='Main net inflow';data{18,1}='Retail inflow';data{19,1}='Retail outflow';data{20,1}='Retail net inflow';



    for j=1:real_days_row 
    data{1,j+1}=sourcefile(weizhi(j*12-12+1)+1:weizhi(j*12-12+2)-1);  
    data{2,j+1}=sourcefile(weizhi(j*12-12+3)+1:weizhi(j*12-12+4)-1);
    data{3,j+1}=sourcefile(weizhi(j*12-12+5)+1:weizhi(j*12-12+6)-1);
    data{4,j+1}=sourcefile(weizhi(j*12-12+7)+1:weizhi(j*12-12+8)-1);
    data{5,j+1}=sourcefile(weizhi(j*12-12+9)+1:weizhi(j*12-12+10)-1);
    data{6,j+1}=sourcefile(weizhi(j*12-12+11)+1:weizhi(j*12-12+12)-1);   
    end

    
%        % if strcmp(data(1,real_days_row+1),judgement_date)
%           xlswrite(File_Full_Path,data);
%        % end
%         
%         pause(0.005);

end












