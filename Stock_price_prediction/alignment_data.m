function output_result = alignment_data(data_dapan,data_TX)

           [~,data_c]=size(data_dapan);
           output_result=zeros(24,data_c);
           
           output_result(1,:)=data_dapan(1,:);
           output_result(2,:)=data_dapan(5,:);
           output_result(3,:)=data_dapan(6,:);
           output_result(4,:)=data_dapan(9,:);
           
          for i=1:data_c
                
               [~,N]=find( data_TX(1,:) == data_dapan(1,i) );
               
               if ~isempty(N)
                   
                   output_result(5:24,i)=data_TX( 1:20, N(1) );
                   
               else
                   
                   
%                    if i==1
%                        output_result(5:24,i)=0;
%                    else
%                        output_result(5:24,i)=output_result(5:24,i-1);
%                    end  
                   
                   output_result(5:24,i)=0;
                   
                   
                   
               end
                   
    
          end

end