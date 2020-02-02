function output_results = recent_price_fluctuations(data)  %����Ӧ����5*N

%��һ�У����̼� 
%��2�� ����߼� 
%��3�� ����ͼ� 
%�����У����̼�
%���庽���ǵ�

           [data_r,data_c]=size(data);   %5*N

           if data_r ~=5 && ~isempty(find(data(1:4,:)==0,1) )
              error('Invalid argument provided. The length of the data shoulb be 4 and nonzero');
           end
         
           if data_c>5  %������Ū��5�У�������û��5��
               data=data(:,data_c-4:data_c);
           else
               data=[zeros(5,5-data_c),data];  %������ݱ�����5*5
           end
         
         
 %%        
         A=(data(4,5)-data(1,5))/data(4,5); %����-���� Խ��Խ��
         B=(data(4,5)-data(3,5))/data(4,5); %����-��� Խ��Խ��
         C=(data(2,5)-data(4,5))/data(4,5); %���-���� Խ��Խ����
         
 %%        
         
         
         output_results(1)=100*(data(2,5)-data(3,5))/data(4,5);%�ɼ۲�������
        
         output_results(2)=100*(A+B-C);                          %����ɼ��Ƿ�ǿ�Ʒ���,��ֱ��ǿ�Ʒ�������ֵ��Σ���ź�
         
         
         if sum(data(5,:)) < -8                            %��5��ɼ��ǲ��Ǳ���
               output_results(3)=-1;
         elseif  -8< sum(data(5,:)) && sum(data(5,:)) < -4 
               output_results(3)= -0.5;
         elseif  4< sum(data(5,:)) && sum(data(5,:)) <8
               output_results(3)= 0.5;
        elseif  8< sum(data(5,:))
               output_results(3)= 1;   
         else
               output_results(3)= 0;
         end
 
end