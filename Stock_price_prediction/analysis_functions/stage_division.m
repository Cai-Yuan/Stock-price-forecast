function [output_results,final_zuobiao]=stage_division(data)

%       clc;
%       close all;
%       clear;
        %data=[199.880000000000,199.880000000000,200.170000000000,203.570000000000,204.990000000000,206.120000000000,206.400000000000,206.400000000000,207.250000000000,208.390000000000,208.100000000000,207.540000000000,207.250000000000,209.800000000000,212.920000000000,211.790000000000,208.950000000000,208.390000000000,208.390000000000,208.390000000000,211.790000000000,215.190000000000,217.740000000000,218.880000000000,221.710000000000,222,223.980000000000,229.080000000000,225.400000000000,229.930000000000,229.370000000000,228.800000000000,225.680000000000,228.230000000000,239.860000000000,239.290000000000,240.710000000000,241.280000000000,242.980000000000,245.240000000000,247.230000000000,252.620000000000,257.150000000000,244.110000000000,250.060000000000,248.080000000000,243.540000000000,239.010000000000,242.980000000000,253.180000000000,252.620000000000,250.920000000000,255.450000000000,259.420000000000,249.780000000000,243.540000000000,244.110000000000,237.590000000000,245.530000000000,258.850000000000,263.110000000000,266.790000000000,277.570000000000,273.880000000000,274.450000000000,272.750000000000,267.360000000000,266.790000000000,270.190000000000,272.460000000000,277,274.160000000000,275.580000000000,265.090000000000,287.770000000000,290.890000000000,298.550000000000,294.010000000000,294.010000000000,273.030000000000,258,259.990000000000,256.870000000000,247.800000000000,252.050000000000,248.080000000000,246,240];
% %     data=[7.80000000000000,7.95000000000000,8.05000000000000,8.05000000000000,7.93000000000000,7.75000000000000,7.84000000000000,7.77000000000000,7.59000000000000,7.53000000000000,7.87000000000000,8.24000000000000,8.36000000000000,8.41000000000000,8.30000000000000,8.29000000000000,8.12000000000000,8,8.10000000000000,8.13000000000000,8.36000000000000,8.46000000000000,8.54000000000000,8.43000000000000,8.26000000000000,8.36000000000000,8.26000000000000,7.63000000000000,7.63000000000000,7.81000000000000,8.05000000000000,8.25000000000000,8.06000000000000,8.05000000000000,7.85000000000000,7.85000000000000,7.73000000000000,7.64000000000000,7.85000000000000,7.83000000000000,7.78000000000000,8.08000000000000,7.96000000000000,8.11000000000000,8.16000000000000,8.06000000000000,7.96000000000000,8,7.83000000000000,7.86000000000000,7.95000000000000,7.87000000000000,7.29000000000000,7.36000000000000,7.55000000000000,6.94000000000000,7.10000000000000,6.85000000000000,6.86000000000000,6.76000000000000,6.82000000000000,6.52000000000000,6.47000000000000,6.86000000000000,6.61000000000000,6.34000000000000,6.41000000000000,6.38000000000000,5.74000000000000,5.40000000000000,5.22000000000000,5.42000000000000,5.29000000000000,5.43000000000000,5.39000000000000,5.46000000000000,5.37000000000000,5.29000000000000,5.56000000000000,5.76000000000000,5.75000000000000,5.69000000000000,5.88000000000000,5.81000000000000,5.86000000000000,5.30000000000000,5.37000000000000,5.22000000000000,5.32000000000000,5.62000000000000,5.64000000000000,5.70000000000000,5.76000000000000,5.75000000000000,5.68000000000000,5.59000000000000,5.60000000000000,5.71000000000000,5.75000000000000,5.76000000000000,5.83000000000000,5.88000000000000,6.05000000000000,5.99000000000000,5.99000000000000,5.83000000000000,5.88000000000000,5.88000000000000,5.79000000000000,5.94000000000000,6.02000000000000,6.03000000000000,6.22000000000000,6.28000000000000,6.09000000000000,6.06000000000000,6.24000000000000,6.18000000000000,6.33000000000000,6.35000000000000,6.31000000000000,6.17000000000000,6.23000000000000,6.05000000000000,5.94000000000000,5.95000000000000,5.90000000000000,5.92000000000000,5.94000000000000,5.91000000000000,5.92000000000000,6.09000000000000,6.12000000000000,6.19000000000000,6,5.90000000000000,5.87000000000000,6.04000000000000,6.02000000000000,6.09000000000000,6.12000000000000,6.04000000000000,5.95000000000000,5.91000000000000,5.91000000000000,5.90000000000000,5.79000000000000,5.73000000000000,5.73000000000000,5.71000000000000,5.72000000000000,5.90000000000000,5.92000000000000,5.91000000000000,5.91000000000000,5.94000000000000,5.90000000000000,5.91000000000000,5.71000000000000,5.70000000000000,5.83000000000000,5.73000000000000,5.79000000000000,5.86000000000000,5.84000000000000,5.90000000000000,5.88000000000000,5.81000000000000,5.88000000000000,5.90000000000000,6.05000000000000,5.82000000000000,5.80000000000000,6.03000000000000,6.37000000000000,6.32000000000000,6.30000000000000,6.17000000000000,6.17000000000000,6.35000000000000,6.56000000000000,6.45000000000000,6.47000000000000,6.58000000000000,6.50000000000000,6.54000000000000,6.67000000000000,6.55000000000000,6.45000000000000,6.50000000000000,6.44000000000000,6.56000000000000,6.95000000000000,6.83000000000000,7.11000000000000,7.12000000000000,7.24000000000000,7.05000000000000,7.43000000000000,8.02000000000000,7.97000000000000,7.71000000000000,7.78000000000000,8.30000000000000,8.19000000000000,8.27000000000000,8.19000000000000,8.11000000000000,8.05000000000000,8.09000000000000,8.01000000000000,7.93000000000000,8.21000000000000,8.36000000000000,8.30000000000000,8.30000000000000,8.10000000000000,8.14000000000000,8.27000000000000,8.60000000000000,8.81000000000000,8.94000000000000,8.70000000000000,8.49000000000000,8.21000000000000,8.03000000000000,8.20000000000000,8.12000000000000,8.11000000000000,8.24000000000000,8.47000000000000,8.14000000000000,7.94000000000000,7.81000000000000,7.81000000000000,7.91000000000000,8.23000000000000,8.19000000000000,8.41000000000000,8.48000000000000,8.49000000000000,8.23000000000000,8.66000000000000,8.55000000000000,8.46000000000000,8.65000000000000,9,8.89000000000000,8.74000000000000,8.57000000000000,8.45000000000000,8.60000000000000,8.63000000000000,8.35000000000000,8.62000000000000,8.57000000000000,8.76000000000000,8.74000000000000,8.56000000000000,8.67000000000000,8.96000000000000,8.94000000000000,8.81000000000000,8.74000000000000,8.86000000000000,8.86000000000000,8.90000000000000,8.90000000000000,8.90000000000000,9.64000000000000,9.69000000000000,9.84000000000000,9.99000000000000,9.59000000000000,9.65000000000000,9.80000000000000,9.13000000000000,9.01000000000000,9.23000000000000,9.11000000000000,9.25000000000000,8.82000000000000,8.69000000000000,8.53000000000000,8.43000000000000,8.51000000000000,8.47000000000000,8.45000000000000,8.62000000000000,8.67000000000000,8.65000000000000,8.87000000000000,9.10000000000000,9.08000000000000,9.19000000000000,9.19000000000000,9.25000000000000,9.24000000000000,9.12000000000000,9.28000000000000,9.59000000000000,9.50000000000000,9.18000000000000,9.09000000000000,9.14000000000000,9.23000000000000,9.23000000000000,9.47000000000000,9.55000000000000,9.59000000000000,9.81000000000000,9.79000000000000,10,9.91000000000000,9.87000000000000,10.2000000000000,9.99000000000000,10.0800000000000,10.2900000000000,10.8600000000000,10.8700000000000,11.5200000000000,11.2500000000000,11.3200000000000,10.9300000000000,11.1200000000000,11.0200000000000,11.2400000000000,10.9000000000000,10.8100000000000,10.8300000000000,11.0800000000000,11.0100000000000,10.7400000000000,10.6800000000000,10.6800000000000,10.5600000000000,10.6400000000000,10.7100000000000,10.5600000000000,10.9800000000000,11,11.1000000000000,11.2300000000000,11.1200000000000,11.2400000000000,11.7400000000000,12.2200000000000,12.1600000000000,12.1700000000000,11.8800000000000,11.8800000000000,12.0700000000000,11.8600000000000,11.7700000000000,12.1400000000000,12.6700000000000,12.6800000000000,12.8300000000000,12.9100000000000,12.7300000000000,12.7200000000000,12.7200000000000,12.8000000000000,13.0500000000000,12.9200000000000,13.3700000000000,13.1500000000000,11.9600000000000,11.6000000000000,11.7300000000000,12.0400000000000,11.9400000000000,12.2000000000000,12.1900000000000,11.9900000000000,11.6700000000000,10.9700000000000,10.7900000000000,10.5200000000000,10.9100000000000,10.8600000000000,10.2600000000000,10.3800000000000,10.6000000000000,10.5600000000000,10.2700000000000,10.0400000000000,9.70000000000000,9.73000000000000,10.0100000000000,10.1900000000000,10.1700000000000,9.93000000000000,10,10.3700000000000,10.2700000000000,10.5000000000000,10.8700000000000,11.1700000000000,11.1000000000000,11.0900000000000,10.8400000000000,10.8000000000000,10.6700000000000,11.0500000000000,10.9800000000000,11.0600000000000,10.9100000000000,10.9900000000000,11.1100000000000,11.0900000000000,11.0800000000000,11.2200000000000,11.2400000000000,11.3200000000000,10.9100000000000,11.0900000000000,11.2400000000000,11.1100000000000,11.3300000000000,11.1700000000000,10.9700000000000,11.3800000000000,11.3700000000000,11.0500000000000,11.2900000000000,11.8200000000000,11.8300000000000,11.9700000000000,11.9400000000000,11.6500000000000,11.5700000000000,11.3900000000000,11.4200000000000,11.3800000000000,11.5600000000000,10.9400000000000,10.4700000000000,10.5200000000000,10.5500000000000,10.5600000000000,10.3800000000000,10.2700000000000,10.0900000000000,10.4900000000000,10.3900000000000,10.3900000000000,10.5700000000000,10.5500000000000,10.5700000000000,10.4500000000000,10.3200000000000,10.2000000000000,10.5500000000000,10.6600000000000,10.6100000000000,10.6600000000000,10.6300000000000,10.5400000000000,10.5000000000000,10.4400000000000,10.5400000000000,10.3400000000000,10.3300000000000,10.3200000000000,10.2400000000000,10.3400000000000,10.4300000000000,10.8700000000000,11.1100000000000,10.9200000000000,10.8000000000000,10.7800000000000,10.6400000000000,10.5800000000000,10.6300000000000,10.4900000000000,10.3700000000000,10.3800000000000,10.5600000000000,10.4600000000000,10.7400000000000,10.6000000000000,10.6600000000000,10.5400000000000,10.4400000000000,10.4600000000000,10.1500000000000,10.1900000000000,10.0800000000000,10.1900000000000,10.1500000000000,10.3400000000000,10.2200000000000,10.0900000000000,9.83000000000000,9.91000000000000,9.61000000000000,9.32000000000000,9.16000000000000,9.23000000000000,9.26000000000000,9.36000000000000,9.15000000000000,9.07000000000000,9.30000000000000,9.22000000000000,9.17000000000000,9.24000000000000,9.22000000000000,9.43000000000000,9.50000000000000,9.20000000000000,9.22000000000000,9.23000000000000,9.10000000000000,9.12000000000000,9.08000000000000,9.09000000000000,9.03000000000000,9.16000000000000,9.08000000000000,9.03000000000000,9.05000000000000,9.05000000000000,8.98000000000000,8.93000000000000,8.73000000000000,8.47000000000000,8.34000000000000,8.35000000000000,8.16000000000000,8.16000000000000,8.33000000000000,8.23000000000000,8.29000000000000,8.22000000000000,8.17000000000000,8.20000000000000,8.47000000000000,8.53000000000000,8.47000000000000,8.81000000000000,8.83000000000000,8.75000000000000,8.73000000000000,8.70000000000000,8.55000000000000,8.29000000000000,8.43000000000000,8.91000000000000,9.16000000000000,9.20000000000000,9.20000000000000,9.18000000000000,9.22000000000000,9.26000000000000,9.74000000000000,9.80000000000000,9.47000000000000,9.51000000000000,9.10000000000000,9.36000000000000,9.49000000000000,9.40000000000000,9.43000000000000,9.17000000000000,8.35000000000000,8.45000000000000,8.46000000000000,8.39000000000000,8.68000000000000,9.21000000000000,9.33000000000000,9.50000000000000,9.47000000000000,9.33000000000000,9.38000000000000,9.30000000000000,9.57000000000000,9.50000000000000,9.58000000000000,9.47000000000000,9.42000000000000,9.30000000000000,9.11000000000000,9.16000000000000,9.12000000000000,8.99000000000000,8.88000000000000,8.84000000000000,8.75000000000000,8.40000000000000,8.51000000000000,8.56000000000000,8.44000000000000,8.66000000000000,8.77000000000000,8.76000000000000,8.56000000000000,8.46000000000000,8.44000000000000,8.71000000000000,8.63000000000000,8.53000000000000,8.52000000000000,8.36000000000000,8.26000000000000,8.34000000000000,8.31000000000000,8.03000000000000,8.14000000000000,8.43000000000000,8.35000000000000,8.18000000000000,8.25000000000000,7.98000000000000,8.02000000000000,7.94000000000000,8.02000000000000,8.05000000000000,7.97000000000000,8.10000000000000,8.02000000000000,7.95000000000000,8.06000000000000,8,8.02000000000000,8.11000000000000,8.16000000000000,8.13000000000000,8,7.97000000000000,7.96000000000000,7.95000000000000,7.84000000000000,7.66000000000000,7.65000000000000,7.29000000000000,7.36000000000000,7.42000000000000,7.40000000000000,7.36000000000000,7.16000000000000,7.08000000000000,7.11000000000000,7.01000000000000,6.93000000000000,7.24000000000000,7.18000000000000,7.69000000000000,7.60000000000000,7.65000000000000,7.17000000000000,7.10000000000000,7.02000000000000,7.09000000000000,7.21000000000000,7.11000000000000,7,6.74000000000000,6.63000000000000,6.64000000000000,6.77000000000000,6.81000000000000,6.68000000000000,6.85000000000000,6.89000000000000,6.85000000000000,6.71000000000000,6.59000000000000,6.94000000000000,7.13000000000000,7.67000000000000,7.96000000000000,7.83000000000000,7.67000000000000,7.73000000000000,7.97000000000000,7.82000000000000,7.77000000000000,7.80000000000000,7.53000000000000,7.57000000000000,8,7.86000000000000,7.92000000000000,7.85000000000000,7.81000000000000,7.76000000000000,7.66000000000000,7.31000000000000,7.20000000000000,7.20000000000000,7.47000000000000,7.33000000000000,7.30000000000000,7.23000000000000,7.39000000000000,7.33000000000000,7.26000000000000,7.12000000000000,7.09000000000000,6.97000000000000,7.02000000000000,6.92000000000000,6.87000000000000,6.98000000000000,6.90000000000000,6.72000000000000,6.73000000000000,6.89000000000000,6.91000000000000,6.77000000000000,7.31000000000000,7.24000000000000,7.20000000000000,7.35000000000000,7.23000000000000,7.23000000000000,7.23000000000000,7.29000000000000,7.05000000000000,7.01000000000000,7.10000000000000,6.84000000000000,6.93000000000000,6.74000000000000,6.37000000000000,6.36000000000000,6.11000000000000,6.19000000000000,6.44000000000000,6.20000000000000,6.23000000000000,6.13000000000000,6.27000000000000,6.21000000000000,6.26000000000000,6.41000000000000,6.48000000000000,6.60000000000000,6.60000000000000,6.53000000000000,6.53000000000000,6.44000000000000,6.33000000000000,6.51000000000000,6.60000000000000,6.67000000000000,6.71000000000000,6.74000000000000,6.79000000000000,6.62000000000000,6.75000000000000,6.58000000000000,6.49000000000000,6.57000000000000,6.43000000000000,6.48000000000000,6.41000000000000,6.41000000000000,6.55000000000000,6.66000000000000,6.68000000000000,6.55000000000000,6.84000000000000,6.85000000000000,6.78000000000000,6.78000000000000,7,6.83000000000000,6.84000000000000,6.55000000000000,6.47000000000000,6.38000000000000,6.34000000000000,6.33000000000000,6.18000000000000,6.29000000000000,6.26000000000000,6.32000000000000,6.30000000000000,6.26000000000000,6.38000000000000,6.47000000000000,6.47000000000000,6.44000000000000,6.38000000000000,6.43000000000000,6.41000000000000,6.47000000000000,6.40000000000000,6.33000000000000,6.43000000000000,6.45000000000000,6.31000000000000,6.27000000000000,6.16000000000000];
  %     data =[72,71.8000000000000,72.6000000000000,73.2000000000000,74.8000000000000,75.8000000000000,76.4000000000000,75.2000000000000,75.6000000000000,74.8000000000000,76,76.8000000000000,75.4000000000000,75.8000000000000,75.6000000000000,74.4000000000000,75.2000000000000,74.8000000000000,75,76.2000000000000,73.8000000000000,72.4000000000000,72.6000000000000,73.8000000000000,76,76.6000000000000,79,78.4000000000000,77.6000000000000,79.4000000000000,78.8000000000000,79,79.8000000000000,80,84.8000000000000,85.6000000000000,85.2000000000000,87.2000000000000,87,87.6000000000000,88.8000000000000,92.6000000000000,92.6000000000000,85.4000000000000,89.2000000000000,90.4000000000000,87.6000000000000,86.6000000000000,87.4000000000000,89.8000000000000,89,89.6000000000000,90.6000000000000,99.6000000000000,95.8000000000000,92.4000000000000,91,91.4000000000000,92.6000000000000,101.800000000000,104,102.400000000000,105.200000000000,104,104.600000000000,113.200000000000,124.600000000000,137,137.600000000000,139.400000000000,153.400000000000,143.200000000000,140.600000000000,133.600000000000,126.600000000000,129.400000000000,122,120.800000000000,112.200000000000,114,102.600000000000,104.200000000000,107.200000000000,105.800000000000];
 %      data=[1158.52000000000,1128.69000000000,1098.87000000000,1114.56000000000,1111.43000000000,1123.98000000000,1098.87000000000,1069.04000000000,1094.16000000000,1076.89000000000,1091.02000000000,1105.15000000000,1100.44000000000,1084.74000000000,1108.29000000000,1084.74000000000,1095.73000000000,1089.45000000000,1048.63000000000,1067.47000000000,1073.75000000000,1015.67000000000,1007.82000000000,1012.53000000000,1045.49000000000,1056.48000000000,1075.32000000000,1050.20000000000,1083.17000000000,1103.58000000000,1092.59000000000,1112.99000000000,1086.31000000000,1067.47000000000,1094.16000000000,1102.01000000000,1083.17000000000,1081.60000000000,1061.19000000000,1112.99000000000,1147.53000000000,1138.11000000000,1123.98000000000,1092.59000000000,1098.87000000000,1112.99000000000,1067.47000000000,1051.77000000000,1045.49000000000,1058.05000000000,1064.33000000000,1028.23000000000,1034.50000000000,1034.50000000000,1018.81000000000,1029.79000000000,1042.35000000000,1025.09000000000,1029.79000000000,1047.06000000000,1042.35000000000,1040.78000000000,1047.06000000000,1037.64000000000,1031.36000000000,1020.38000000000,1020.38000000000,1045.49000000000,1032.93000000000,1040.78000000000,1039.21000000000,1042.35000000000,1053.34000000000,1039.21000000000,1034.50000000000,1039.21000000000,1047.06000000000,1017.24000000000,1023.52000000000,1059.62000000000,1053.34000000000,1078.46000000000,1058.05000000000,1059.62000000000,1067.47000000000];
%       data=data(1:100);

         [data_r,data_c]=size(data);
         if data_r ~=1 && ~isempty(find(data==0,1) )
             error('Invalid argument provided. The length of the data shoulb be 1 and nonzero');
         end
         
         if data_c < 30
             output_results=[0,0,0]; %������С��30�ǲ�������
             final_zuobiao=1;
             return;
         end
%%         
         peak_value_results=get_peak_locations(data);
         peak_number=length(peak_value_results);
         data_smoothed=data_smoothing(data);             

%% %%  %%%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ���϶˵�����зֶε�

      if peak_number==1 && peak_value_results(1)==0 %û�м���ֵ
       
           min_value=min( data_smoothed );
           zhibiao=find(  data_smoothed  ==  min_value  );
           min_value_location = zhibiao(1);%%�ҵ���Сֵ��λ��
           
           if  min_value_location <10 || min_value_location > data_c-5 %��Сֵ������
               final_zuobiao=[1,data_c];
           else     %��Сֵ���м�                                                    
               final_zuobiao=[1,min_value_location,data_c];
           end

      else    %�ж������ֵ
           final_zuobiao=[1,peak_value_results,data_c];
      end 
  
%%    
      
     %% %%%%    �Ѿ����������еķָ�����꣬ ���������зֶε���ǵ�
     
          length_final_zuobiao=length(final_zuobiao); %����ж��ٸ��ָ��
          for i=1:length_final_zuobiao-1
              
               ratio = (data_smoothed(final_zuobiao(i))-data_smoothed(final_zuobiao(i+1)))/data_smoothed(final_zuobiao(i));
              
               if ratio >= 0.3                     %����
                   output_results(i*3-2:i*3) = [final_zuobiao(i),-3,final_zuobiao(i+1)];
               elseif  ratio >= 0.2 && ratio < 0.3  %�е�    
                   output_results(i*3-2:i*3)  = [final_zuobiao(i),-2,final_zuobiao(i+1)];
               elseif  ratio >= 0.1 && ratio < 0.2   %С��    
                   output_results(i*3-2:i*3)  = [final_zuobiao(i),-1,final_zuobiao(i+1)];
                   
               elseif  ratio > -0.1 && ratio < 0.1  %����   
                   output_results(i*3-2:i*3)  = [final_zuobiao(i),0,final_zuobiao(i+1)];
                   
               elseif  ratio <= -0.1 && ratio >-0.2      %С��    
                   output_results(i*3-2:i*3)  = [final_zuobiao(i),1,final_zuobiao(i+1)];
                   
                elseif  ratio <= -0.2 && ratio >-0.3     %����    
                   output_results(i*3-2:i*3)  = [final_zuobiao(i),2,final_zuobiao(i+1)];
              
               elseif ratio< -0.3 %����
                   output_results(i*3-2:i*3) = [final_zuobiao(i),3,final_zuobiao(i+1)];
              
               end

          end
%           
%          figure
%          plot(data);
%          hold on
%          plot( final_zuobiao,data_smoothed( final_zuobiao),'*');
         
          
     %% �ϲ���Ч�ķָ��     
 %     1     0    10    10     0    22    22     1    44    44     0    47    47     3    72    72    -2    84
     results=output_results;
     zuobiao=final_zuobiao;
     length_output=length(output_results)/3;
    
if length_output >1

     for ii=1:length_output-1
         
        if ii == 1
             if (output_results(3*ii-1) ==0 && output_results(3*(ii+1)-1) ==0) || output_results(3*ii-1)*output_results(3*(ii+1)-1) >0
                 results(3*ii-1:3*(ii+1)-2)=nan;
                 results(3*(ii+1)-1)=output_results(3*ii-1) + output_results(3*(ii+1)-1);
                 
                 zuobiao(ii+1)=nan;
             end
         
        else

             if (output_results(3*ii-1) ==0 && output_results(3*(ii+1)-1) ==0) || output_results(3*ii-1)*output_results(3*(ii+1)-1) >0
                  results(3*ii-1:3*(ii+1)-2)=nan;
                  results(3*(ii+1)-1)=output_results(3*ii-1) + output_results(3*(ii+1)-1);
                  
                  zuobiao(ii+1)=nan;
             end
             
             if output_results(3*ii-1) ==0 && (output_results(3*(ii-1)-1)*output_results(3*(ii+1)-1) >0) && (output_results(3*ii)-output_results(3*ii-2))<20
                  
                  results((3*(ii-1)-1):3*(ii+1)-2)=nan;
                  results(3*(ii+1)-1)=output_results(3*(ii-1)-1) + output_results(3*(ii+1)-1);
                  
                  zuobiao(ii:ii+1)=nan;
             end     
             
        end

     end
end


  results( isnan( results) )=[];
  output_results=  results;
  zuobiao( isnan( zuobiao) )=[];
  final_zuobiao=zuobiao;
 %% �ҵ�data�ϵ�����λ��
 
 length_final_zuobiao=length(final_zuobiao);
 
 if length_final_zuobiao>2
     
     for kk=2:length_final_zuobiao-1
         
         
         if output_results(3*(kk-1)-1)>0
            
             xz=find(  data(final_zuobiao(kk)-5:final_zuobiao(kk)+5) == max(data(final_zuobiao(kk)-5:final_zuobiao(kk)+5))   );
             final_zuobiao(kk)=   final_zuobiao(kk)-6+ xz(1);  
             
         elseif output_results(3*(kk-1)-1)<0
            xz=find(  data(final_zuobiao(kk)-5:final_zuobiao(kk)+5) == min(data(final_zuobiao(kk)-5:final_zuobiao(kk)+5))    );
             final_zuobiao(kk)=   final_zuobiao(kk)-6+ xz(1);  
             
             
         elseif output_results(3*(kk-1)-1)==0
             
             if output_results(3*(kk)-1)>0
                 
                 xz=  find(data(final_zuobiao(kk)-5:final_zuobiao(kk)+5) == min(data(final_zuobiao(kk)-5:final_zuobiao(kk)+5)));
                final_zuobiao(kk)= final_zuobiao(kk)-6+   xz(1);    
                  
             elseif output_results(3*(kk)-1)<0
                 xz=   find(     data(final_zuobiao(kk)-5:final_zuobiao(kk)+5) == max(data(final_zuobiao(kk)-5:final_zuobiao(kk)+5))   );
                 final_zuobiao(kk)=final_zuobiao(kk)-6+ xz(1);     
             end
         end
     end
 end
             


%%
         
%          figure
%          plot(data);
% 
%          hold on
%          plot( final_zuobiao,data( final_zuobiao),'*');
%          
%          for u=1:length(final_zuobiao)
%          hold on
%          plot( linspace(final_zuobiao(u),final_zuobiao(u),100),linspace(0,data( final_zuobiao(u)),100)  );
%          end





end












%end