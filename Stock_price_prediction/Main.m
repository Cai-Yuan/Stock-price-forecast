 clc;
 clear;
% [num,txt,raw] = xlsread('C:\Users\Qiuyinz\Desktop\stock\Raw data.xlsx',1,'k2:k2')

All_Stock_Code=import_stock_code();
[aa bb]=size(All_Stock_Code);
























% 
% 
% %��ҳ��ַ
% WebSite='http://data.gtimg.cn/flashdata/hushen/latest/daily/sz000002.js?maxage=43201&visitDstTime=1';%��Ѷ��ʷ����
% %WebSite='http://qt.gtimg.cn/q=sh600519';%��Ѷ�ӿ�
% 
% 
% 
% [sourcefile,status]=urlread(WebSite);
% %������ʽ����ͬ����ҳ��ͬ�����ݲ�һ���ģ�����Ҫ�鿴һ����ҳԴ��ѽ
% expr1='<span class=''ball_5''>(\d)</span>';%expr1= '<span class='ball_5'>0</span>';
% %% ������ʽƥ�䣬����help�ļ�֪����
% %'match'��Text of each substring that matches the pattern in expression��
% %����������� ����ÿһ��������ʽƥ���ϵ����ַ������������
% %Text of each captured token in str
% %����������� ����ÿһ��������ʽƥ���ϵı��(�������������)���������
% %�����������ʹ�ñȽ϶࣬��help��
% %�ڴ�����Ҫ�����ݶ��Ǵ����data_tokens cell�ļ��еģ��������ַ���ʽ
% [datafile,data_tokens]=regexp(sourcefile,expr1,'match','tokens');
% a=data_tokens';
% [m,n]=size(a);
% data=zeros(m,n);
% for i=1:m
%     data(i)=str2double(a{i}{1});%�ַ�ת��Ϊ����
% end
% %���ǲ����߸�����Ϊһ��ģ���Ҫ������������֯һ��
% Data=reshape(data,7,m/7);
% Data=Data';
% SourceData=Data;
% 
