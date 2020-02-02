clc;
%clear;

clear;
addpath(genpath(pwd));
xlsx_file_list=scan_xlsx_file();% read in all the stock path
file_number=length(xlsx_file_list);

%��һ�У����� %�ڶ��У����̼� %�����У���߼� %�����У���ͼ� %�����У����̼� %�����У��ɽ���
%7�У����� %8�У����� %9�У��ǵ� %10�У������� %11�У��о��� %12�У���ͨ��ֵ %13�У�����ֵ
%14�У���ӯ�� %15�У��������� %16�У��������� %17�У����������� %18�У�ɢ������ %19�У�ɢ������ %20�У�ɢ��������

analysis_sheet={};%���ڼ�¼�������
analysis_sheet{1,1}='��Ʊ'; analysis_sheet{1,2}='���ղ���'; analysis_sheet{1,3}='�Ƿ񷴵�';analysis_sheet{1,4}='�Ƿ񱩵�';analysis_sheet{1,5}='��Ϣ��Ȩ'; analysis_sheet{1,6}='K30>K5_100'; analysis_sheet{1,7}='K30>K5_300';analysis_sheet{1,8}='K30>K5_400';analysis_sheet{1,9}='������'; analysis_sheet{1,10}='˫W��'; analysis_sheet{1,11}='������Ծ��';analysis_sheet{1,12}='��������100��';analysis_sheet{1,13}='��������200��';analysis_sheet{1,14}='��������300��'; analysis_sheet{1,15}='����ƽ�������'; analysis_sheet{1,16}='����ƽ��������';analysis_sheet{1,17}='�������Ŵ�';analysis_sheet{1,18}='���̴�������ʱ���ɼ����ǵĸ���'; analysis_sheet{1,19}='������С������ʱ���ɼ��µ��ĸ���'; analysis_sheet{1,20}='��ǰ�۸�';

m=1;%���ڼ�¼��Ч������
% rise_stock_selected=zeros(10,1);
% down_stock_selected=zeros(10,1);

for i=520:520 %file_number
    i
    DATA_TX =xlsread(xlsx_file_list{i});  %��Ѷ������
    [data_TX_row, data_TX_col]=size(DATA_TX);

    %% ������������
    if  data_TX_col<7 || strcmp(xlsx_file_list{i} , 'C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sz399001.xlsx') || strcmp(xlsx_file_list{i} , 'C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\sh000001.xlsx')
        continue;   %������������
    end 
    %%������������
        %% �õ����˵�����
         historial_data = get_historal_data_function(xlsx_file_list{i}(end-12:end-5)); %���˵�����
         [historial_data_row, historial_data_col] = size( historial_data );
         historial_data=cell2mat( historial_data(2:end,2:end));
          %%�õ����˵�����
%% ��һ���ж����� �������������
     para=sum(DATA_TX(9,end-6:end));      %�����µ� ���� ��������ǲ��Ǳ���  
     if para < -12 

          data2=historial_data(4,1:end);%��ʷ�ɼ�
          results2=stock_price_trend(data2); %1:�жϹ�ȥ200�����ǲ��ǳ�Ȩ��Ϣ��---------------
                                             %2:�ڹ�ȥ100���У�K30����K5������--------------
                                             %3:��ȥ300����K30����K5������,----------------
                                             %4:��ȥ400����K30����K5������ -------------
                                             %5:��ȥ400�죬�ɼ������� ��0,1�� Ϊ0�����¸�
       
         different_stages=stage_division(data2);
         
        if results2(2)>70 || results2(3)>220 || results2(4)>310
           rise_stock_selected{m,1}= xlsx_file_list{i}(end-12:end-5);%��Ʊ����
           rise_stock_selected{m,2}=DATA_TX(5,data_TX_col); %��ǰ�۸�
           day30_day20=plot_day20_and_day30(data2);   %��������
           m=m+1;
           pause;
        end
              
        
     end
%%  �ڶ�һ���ж�����
              
     
         % if different_stages(end-1) == -1 && different_stages(end)-different_stages(end-2)>60
     
         % different_stages=stage_division(data2);
 %%  �����ʽ����������ȷû�д��
         

   %  day30_day20=plot_day20_and_day30(data2);












end