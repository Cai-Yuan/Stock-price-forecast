function stock_code_list = import_stock_code(varargin)

if ~isempty(varargin)
    if ~ischar(varargin{1}) || exist(varargin{1},'file')
        error('Invalid argument provided to. Please input Effective path');
    end
   Stock_Code=importdata(varargin{1});
else

   [Stock_Code]=importdata('C:\Users\Qiuyinz\Desktop\stock\Stock_Code.xlsx');
end



Stock_Code(cellfun(@isempty,Stock_Code))=[];%������ܸ߶�,�ж����cell���ǲ����пյģ�����о�ɾ��
stock_code_list=Stock_Code;

end
















