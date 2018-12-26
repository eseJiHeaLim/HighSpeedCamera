
a=imread('ii3.jpg');
b=imread('ii7.jpg');

imim1=rgb2gray(a);
imim2=rgb2gray(b);

point1=detectSURFFeatures(imim1);
point2=detectSURFFeatures(imim2);

[f1,vpts1]=extractFeatures(imim1,point1);
[f2,vpts2]=extractFeatures(imim2,point2);

indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));

figure; showMatchedFeatures(imim1,imim2,matchedPoints1,matchedPoints2);
legend('matched points 1','matched points 2');

hold on;
x1=matchedPoints1.Location(:,1);
y1=matchedPoints1.Location(:,2);
x2=matchedPoints2.Location(:,1);
y2=matchedPoints2.Location(:,2);

trans_x=mean(x1-x2);
trans_y=mean(y1-y2);

%% 
trans_x=20;
trans_y=-160;
% 이동한 이미지와 기준인 두개의 이미지를 겹쳐서 보여줌 
test=imtranslate(b,[trans_x trans_y]);
figure;
C = imfuse(a,test,'falsecolor','Scaling','joint','ColorChannels',[1 2 0]);
imshow(C)
                                 