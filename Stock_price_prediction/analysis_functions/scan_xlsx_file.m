function  files = scan_xlsx_file( varargin )

if ~isempty(varargin)
    if exist(varargin{1},'dir') ~=7
        error('Invalid argument provided to. Please input Effective path');
    end
    root_dir=varargin{1};
else 
    root_dir='C:\Users\Qiuyinz\Desktop\stock\stock_data_tengxun\';   
end

if root_dir(end)~='\'
 root_dir=[root_dir,'\'];
end 

files={};

fileList=dir(root_dir);  %扩展名
n=length(fileList);
cntpic=0;

 for i=1:n
   
     if strcmp(fileList(i).name,'.')==1 || strcmp(fileList(i).name,'..')==1
        continue;
    else
       % fileList(i).name;
        if ~fileList(i).isdir % 如果是地址，则跳过
            
                 full_name=[root_dir,fileList(i).name];
            
                 cntpic=cntpic+1;
                 files(cntpic,1)={full_name};

%         else
%             files=[files,scan_xlsx_file([root_dir,fileList(i).name])];
        end
    end
 end

end















































