% ����ʶ��

% ��������������Ŀ������
clear all;
'LOADING......'
filename =dir('nums\*.bmp');
for kk = 0:99
    p1=zeros(16,16);  %����ȫΪ1����������   
    m=strcat('nums\',filename(kk+1).name);
    x=imread(m,'bmp');  %ѭ������0-99�����������ļ� 
    if(length(size(x))==3)
        x = rgb2gray(x); %��ͼ��ת�Ҷ�
    end
%     figure,imshow(x);title('ԭʼ�ڰ�ͼ��');
     bw=im2bw(x,0.5);
%      grd=edge(x,'canny');%��canny����ʶ��ǿ��ͼ���еı߽�
%      figure,imshow(grd);
[l,r]=size(bw);
bw1=bw;
    for i=1:l
        for j=1:r
            if bw1(i,j)==0
                bw1(i,j)=1;
            else
                bw1(i,j)=0;
            end
        end
    end
    %figure,imshow(bw1);
    [i,j]=find(bw1==1);
    imin=min(i);
    imax=max(i);
    jmin=min(j);
    jmax=max(j);
    bw2=bw1(imin:imax,jmin:jmax);  %��ȡ����ͼ���е����ֲ���
    %figure,imshow(bw2);
    rate=16/max(size(bw2));
    bw2=imresize(bw2,rate);  %�������ļ���ߴ紦��
    [i,j]=size(bw2);
    i1=round((16-i)/2);
    j1=round((16-j)/2);
    p1(i1+1:i1+i,j1+1:j1+j)=bw2;  %������16*16�ľ���
    %figure,imshow(p1);
   
    
    p1 = bwmorph(p1,'thin',inf);%ͼ��ϸ��
%     figure,imshow(p1);
           
             for m=0:15
                if(0<=m&&m<=3)
                    mm=(m+1)*4;
                    p(m+1,kk+1)=length(find(p1(1:4,mm-3:mm)==1));%��һ�����Ŀ鷽��������ֵΪ1������
                end
                if(4<=m&&m<=7)
                    mm=(m-3)*4;
                    p(m+1,kk+1)=length(find(p1(5:8,mm-3:mm)==1));%���嵽�ڰ˿鷽��������ֵΪ1������
                end
                 if(8<=m&&m<=11)
                    mm=(m-7)*4;
                    p(m+1,kk+1)=length(find(p1(9:12,mm-3:mm)==1));%�ھŵ���ʮ���鷽��������ֵΪ1������
                 end
                 if(12<=m&&m<=15)
                    mm=(m-11)*4;
                    p(m+1,kk+1)=length(find(p1(13:16,mm-3:mm)==1));%��ʮ����ʮ���鷽��������ֵΪ1������
                 end
             end
        p(17,kk+1)=length(find(p1(4 ,1:16)==1));%��������������ֵΪ1������
        p(18,kk+1)=length(find(p1(8 ,1:16)==1));%�ڰ�����������ֵΪ1������
        p(19,kk+1)=length(find(p1(12,1:16)==1));%��ʮ������������ֵΪ1������
        p(20,kk+1)=length(find(p1(1:16, 4)==1));%��������������ֵΪ1������
        p(21,kk+1)=length(find(p1(1:16, 8)==1));%�ڰ�����������ֵΪ1������
        p(22,kk+1)=length(find(p1(1:16,12)==1));%��ʮ������������ֵΪ1������
        s1=0;
        for zz=1:16
            xx=17-zz;
            s1=p1(zz,xx)+s1;
            p(23,kk+1)=s1;%y=x��������ֵΪ1������
        end
        s2=0;
        for zz=1:16
            s2=p1(zz,zz)+s2;
            p(24,kk+1)=s2;%y=-x��������ֵΪ1������
        end
       
        
    
   %�������Դ�������빩������ѵ��������   pcolum��������ѭ������ 
 

    switch kk
        case{0,1,2,3,4,5,6,7,8,9}
            t(1:4,kk+1)=[0.01,0.01,0.01,0.01];   %����0 
        case{10,11,12,13,14,15,16,17,18,19}
            t(1:4,kk+1)=[0.01,0.01,0.01,0.99];   %����1    
        case{20,21,22,23,24,25,26,27,28,29}
            t(1:4,kk+1)=[0.01,0.01,0.99,0.01];   %����2 
        case{30,31,32,33,34,35,36,37,38,39}
            t(1:4,kk+1)=[0.01,0.01,0.99,0.99];   %����3 
        case{40,41,42,43,44,45,46,47,48,49}
            t(1:4,kk+1)=[0.01,0.99,0.01,0.01];   %����4 
        case{50,51,52,53,54,55,56,57,58,59}
            t(1:4,kk+1)=[0.01,0.99,0.01,0.99];   %����5 
        case{60,61,62,63,64,65,66,67,68,69}
            t(1:4,kk+1)=[0.01,0.99,0.99,0.01];   %����6 
        case{70,71,72,73,74,75,76,77,78,79}
            t(1:4,kk+1)=[0.01,0.99,0.99,0.99];   %����7 
        case{80,81,82,83,84,85,86,87,88,89}
            t(1:4,kk+1)=[0.99,0.01,0.01,0.01];   %����8 
        case{90,91,92,93,94,95,96,97,98,99}
            t(1:4,kk+1)=[0.99,0.01,0.01,0.99];   %����9 
    end
end     %������ѵ��������Ӧ�����ֵt 

'LOAD OK.'

save numberPT p t;
% ������ѵ��BP����

clear all;
load numberPT p t;   %�������� 


%����BP���� 
net=newff(minmax(p),[14 4],{'logsig' 'purelin'}, 'traingdx', 'learngdm'); 
%  ��ǰ�����Ȩֵ����ֵ 
inputWeights=net.IW{1,1} 
inputbias=net.b{1} 
%  ��ǰ�����Ȩֵ����ֵ 
layerWeights=net.LW{2,1}   
layerbias=net.b{2} 
net.trainParam.epochs=25000;  %����ѵ������ 
net.trainParam.goal=0.001;   %����ѵ��Ŀ�� 
net.trainParam.show=10;      %����ѵ����ʾ���� 
net.trainParam.lr=0.05;      %����ѵ��ѧϰ�� w
[net,tr]=train(net,p,t);          %ѵ��BP����   

'TRAIN OK.'

save numbernet net;

% ʶ��
for times=0:99
    clear all;
    p1=ones(16,16);
    load numbernet net;
    test=input('FileName:', 's');
    x=imread(test,'bmp');
    bw=im2bw(x,0.5);
    [i,j]=find(bw==0);
    imin=min(i);
    imax=max(i);
    jmin=min(j);
    jmax=max(j);
    bw1=bw(imin:imax,jmin:jmax);  %��ȡ����ͼ���е����ֲ���
    rate=16/max(size(bw1));
    bw1=imresize(bw1,rate);  %�������ļ���ߴ紦��
    [i,j]=size(bw1);
    i1=round((16-i)/2);
    j1=round((16-j)/2);
    p1(i1+1:i1+i,j1+1:j1+j)=bw1;  %������16*16�ľ���
    p1=-1.*p1+ones(16,16);%��ɫ����
    p1 = bwmorph(p1,'thin',inf);
          
         for m=0:15
            if(0<=m&&m<=3)
                mm=(m+1)*4;
                p(m+1,1)=length(find(p1(1:4,mm-3:mm)==1));
            end
            if(4<=m&&m<=7)
                mm=(m-3)*4;
                p(m+1,1)=length(find(p1(5:8,mm-3:mm)==1));
            end
             if(8<=m&&m<=11)
                mm=(m-7)*4;
                p(m+1,1)=length(find(p1(9:12,mm-3:mm)==1));
             end
             if(12<=m&&m<=15)
                mm=(m-11)*4;
                p(m+1,1)=length(find(p1(13:16,mm-3:mm)==1));
             end
         end
        p(17,1)=length(find(p1(4 ,1:16)==1));
        p(18,1)=length(find(p1(8 ,1:16)==1));
        p(19,1)=length(find(p1(12,1:16)==1));
        p(20,1)=length(find(p1(1:16, 4)==1));
        p(21,1)=length(find(p1(1:16, 8)==1));
        p(22,1)=length(find(p1(1:16,12)==1));
        s1=0;
        for zz=1:16
            xx=17-zz;
            s1=p1(zz,xx)+s1;
            p(23,1)=s1;
        end
        s2=0;
        for zz=1:16
            s2=p1(zz,zz)+s2;
            p(24,1)=s2;
        end
       
        
  
    [a,Pf,Af]=sim(net,p);   %�������� 
    imshow(p1);
    a=round(a);
    a=a(1,1)*8+a(2,1)*4+a(3,1)*2+a(4,1)%�������ʶ���� 
end
