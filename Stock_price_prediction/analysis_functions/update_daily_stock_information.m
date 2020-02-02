function update_daily_stock_information()
clc;
tic
waiting_time=0 ;%�ȴ�����Сʱ
hours=waiting_time*3600;
pause(hours);

%��һ�У����� %�ڶ��У����̼� %�����У���߼� %�����У���ͼ� %�����У����̼� %�����У��ɽ���
%7�У����� %8�У����� %9�У��ǵ� %10�У������� %11�У��о��� %12�У���ͨ��ֵ %13�У�����ֵ
%14�У���ӯ�� %15�У��������� %16�У��������� %17�У����������� %18�У�ɢ������ %19�У�ɢ������ %20�У�ɢ��������

Default_Saving_Path='C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\';%Ĭ�ϵĴ���·��
All_Stock_Code=import_stock_code();
[row,~]=size(All_Stock_Code);


 for i=1:row
     xianshi=i
     realtime_source=[];
     calpital_flow_source=[];
%     

    File_Full_Path=[Default_Saving_Path,All_Stock_Code{i},'.xlsx'];

    TX_Realtime_WebSite=['http://qt.gtimg.cn/q=',All_Stock_Code{i}];           %       Ҫ��ȡÿ���������飬��Ѷ�������ݽӿ�:
    TX_Capital_Flows_WebSite=['http://qt.gtimg.cn/q=ff_',All_Stock_Code{i}];   %       ��ȡÿ���ʽ�������Ѷ�ӿ�:

%����ʱ�õ�
%     File_Full_Path=[Default_Saving_Path,'sz000837','.xlsx'];
%     TX_Realtime_WebSite=['http://qt.gtimg.cn/q=','sz000837'];
%     TX_Capital_Flows_WebSite=['http://qt.gtimg.cn/q=ff_','sz000837'];         
%����ʱ�õ�
    
    
     [realtime_source,realtime_status]=urlread(TX_Realtime_WebSite);
      weizhi = strfind(realtime_source,'~');
      
     if  isempty(weizhi) || ~realtime_status  %�ж������ȡ�Ƿ�ɹ�
         flag1=1
         continue;
     end         
    
    if  exist(File_Full_Path,'file')  %�ж����xlsx�ļ��Ƿ���ڣ����ھͶ�ȡ�������ھ��½�һ��xlsx�ļ�
        [~,~,data]=xlsread(File_Full_Path);
    else
        data{1,1}='Date';data{2,1}='Open';data{3,1}='High';data{4,1}='Low';data{5,1}='Close';data{6,1}='Volume';
        data{7,1}='Outer disk';data{8,1}='Inner disk';data{9,1}='Ups and downs';
        data{10,1}='Turnover rate';data{11,1}='P/E ratio';data{12,1}='Circulation market value';data{13,1}='The total market capitalization';data{14,1}='P/B ratio';
        data{15,1}='Main inflow';data{16,1}='Main outflow';data{17,1}='Main net inflow';data{18,1}='Retail inflow';data{19,1}='Retail outflow';data{20,1}='Retail net inflow';     
    end

        [~,data_col]=size(data);
           
        
         if (  strcmp(realtime_source(weizhi(30)+1:weizhi(30)+8) ,num2str(data{1,data_col})) && strcmp(realtime_source(weizhi(5)+1:weizhi(6)-1) ,num2str(data{2,data_col})) ) ... %�ж����ݵ����һ�������ǲ��ǺͶ��������һ�������̼��ǲ���Ҳһ��
                               || strcmp(realtime_source(weizhi(5)+1:weizhi(6)-1),'0.00')     %�ǲ��Ƕ�������Ч������
                                                                                          
             data={};
             flag2=1;
             continue;
         else

              data{1,data_col+1}  = realtime_source(weizhi(30)+1:weizhi(30)+8);      
              data{2,data_col+1}  = realtime_source(weizhi(5)+1:weizhi(6)-1);
              data{3,data_col+1}  = realtime_source(weizhi(41)+1:weizhi(42)-1);
              data{4,data_col+1}  = realtime_source(weizhi(42)+1:weizhi(43)-1);
              data{5,data_col+1}  = realtime_source(weizhi(3)+1:weizhi(4)-1);
              data{6,data_col+1}  = realtime_source(weizhi(36)+1:weizhi(37)-1);
              data{7,data_col+1}  = realtime_source(weizhi(7)+1:weizhi(8)-1);
              data{8,data_col+1}  = realtime_source(weizhi(8)+1:weizhi(9)-1);
              data{9,data_col+1}  = realtime_source(weizhi(32)+1:weizhi(33)-1);
              data{10,data_col+1} = realtime_source(weizhi(38)+1:weizhi(39)-1);
              data{11,data_col+1} = realtime_source(weizhi(46)+1:weizhi(47)-1);
              data{12,data_col+1} = realtime_source(weizhi(44)+1:weizhi(45)-1);
              data{13,data_col+1} = realtime_source(weizhi(45)+1:weizhi(46)-1);
              data{14,data_col+1} = realtime_source(weizhi(39)+1:weizhi(40)-1);
         end
       
    %---------------calpital flow------------------------------------------
    [calpital_flow_source,~]=urlread(TX_Capital_Flows_WebSite);
    weizhi_calpital = strfind(calpital_flow_source,'~');    
    
    if  ~isempty(weizhi_calpital)
      data{15,data_col+1}=calpital_flow_source(weizhi_calpital(1)+1:weizhi_calpital(2)-1);
      data{16,data_col+1}=calpital_flow_source(weizhi_calpital(2)+1:weizhi_calpital(3)-1);
      data{17,data_col+1}=calpital_flow_source(weizhi_calpital(3)+1:weizhi_calpital(4)-1);
      data{18,data_col+1}=calpital_flow_source(weizhi_calpital(5)+1:weizhi_calpital(6)-1);
      data{19,data_col+1}=calpital_flow_source(weizhi_calpital(6)+1:weizhi_calpital(7)-1);
      data{20,data_col+1}=calpital_flow_source(weizhi_calpital(7)+1:weizhi_calpital(8)-1);
    end


      xlswrite( File_Full_Path,data);
      pause(0.005);
 end
toc
end











