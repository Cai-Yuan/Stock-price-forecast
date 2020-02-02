 clc;
 clear;
% [num,txt,raw] = xlsread('C:\Users\Qiuyinz\Desktop\stock\Raw data.xlsx',1,'k2:k2')

All_Stock_Code=import_stock_code();
[aa bb]=size(All_Stock_Code);
























% 
% 
% %网页地址
% WebSite='http://data.gtimg.cn/flashdata/hushen/latest/daily/sz000002.js?maxage=43201&visitDstTime=1';%腾讯历史数据
% %WebSite='http://qt.gtimg.cn/q=sh600519';%腾讯接口
% 
% 
% 
% [sourcefile,status]=urlread(WebSite);
% %正则表达式，不同的网页不同的数据不一样的，所以要查看一下网页源码呀
% expr1='<span class=''ball_5''>(\d)</span>';%expr1= '<span class='ball_5'>0</span>';
% %% 正则表达式匹配，根据help文件知道：
% %'match'：Text of each substring that matches the pattern in expression，
% %翻译过来就是 ：把每一个和正则式匹配上的子字符串都存放下来
% %Text of each captured token in str
% %翻译过来就是 ：把每一个和正则式匹配上的标记(在这里就是数字)都存放下来
% %这个函数其他使用比较多，见help吧
% %在此我们要的数据都是存放在data_tokens cell文件中的，他们是字符形式
% [datafile,data_tokens]=regexp(sourcefile,expr1,'match','tokens');
% a=data_tokens';
% [m,n]=size(a);
% data=zeros(m,n);
% for i=1:m
%     data(i)=str2double(a{i}{1});%字符转化为数字
% end
% %七星彩是七个数字为一组的，需要把数据重新组织一下
% Data=reshape(data,7,m/7);
% Data=Data';
% SourceData=Data;
% 
