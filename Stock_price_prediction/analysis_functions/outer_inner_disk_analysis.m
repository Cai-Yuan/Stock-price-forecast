function output_results = outer_inner_disk_analysis(data)  % ���������Ӧ����4*n��
%1���ɼ�
%2: �ǵ�
%3������
%4������


% clc;
% clear;

%data=[10.05	9.9	9.77	9.9;1.82	-1.49	-1.31	1.33;43263	25135	28990	48645;32663	39171	54172	43680;];
%%  
         [data_r,data_c]=size(data);
         
         if data_r ~=4
             error('Invalid argument provided. The length of the data shoulb be 4 ');
         end
         

          if data_c>=400   %% ������Ū��400�У�������û��400�У�����ֻ����400��������
               data=data(:,data_c-399:data_c);
           else
               data=[zeros(4,400-data_c),data];
          end
          
          output_results=zeros(1,3);
 %%   �͹�ȥ��20��ȣ�����ĳɽ����ǲ���ͻȻ�Ŵ�
      total_volume=data(3,:)+data(4,:);
      
      if data_c>20
          para=(total_volume(400)*20)/sum(total_volume(380:399));
      else 
          para=( total_volume(400)*(data_c-1) )/sum(total_volume(380:399));
      end
       
          output_results(1)=para;   %�������ǲ���ͻȻ�Ŵ�,����Ľ������͹�ȥ20�콻������ƽ��ֵ�ı�
             
 %%
        
        outer_inner_difference=data(3,400-data_c+1:400)-data(4,400-data_c+1:400);
        
         D=find( outer_inner_difference>0);  %����Щ���������̴�������
         G=find( outer_inner_difference<0); %����Щ����������С������
         
         T=length(D);
         H=length(G);

         U=   data(2,400-data_c+1:400); %ȡ����Ч����������
         
         t=length(  find(U(D)>0)  );
         h=length(  find(U(G)<0)  );
         
         
         output_results(2)=t/T;    %��400���ڣ������̴�������ʱ���ɼ����ǵĸ���
         output_results(3)=h/H;    %��400���ڣ�������С������ʱ���ɼ��µ��ĸ��ʣ�ֵԽ����0 ����1ʱ��Խ˵���й��ɡ��Ǹ���ֱ��ׯ��
         
         
    
        
end