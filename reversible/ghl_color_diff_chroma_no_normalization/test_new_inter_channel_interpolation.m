% 该数据取自peppers图的左上角部分
c1=191;
c2=96;
C1=[101 151 126 185];
C2=[0 0 0 93];
C3=[0 146 0 48];
N=100;
M=[	
 0.4124564  0.3575761  0.1804375
 0.2126729  0.7151522  0.0721750
 0.0193339  0.1191920  0.9503041];
[c3]=inter_channel_local_estimation(c1,c2,C1,C2,C3,M,N);
c3 
% 都归一化 结果为50
% 都不归一化 结果为47
% 正确结果为46