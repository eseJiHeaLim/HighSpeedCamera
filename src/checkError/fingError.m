% 두 카메라의 값 차이를 구하는 함수
I=imread('i3.jpg');
[imagePoints,boardSize] = detectCheckerboardPoints(I);
figure;
imshow(I);
hold on;
plot(imagePoints(:,1),imagePoints(:,2),'ro');

I2=imread('i8.jpg');
[imagePoints2,boardSize2] = detectCheckerboardPoints(I2);
figure(2);
imshow(I2);
hold on;
plot(imagePoints2(:,1),imagePoints2(:,2),'ro');

% 이동해야할 값을 알아냄 by median
x=median(imagePoints2(:,1)-imagePoints(:,1));
y=median(imagePoints2(:,2)-imagePoints(:,2));

% 이동한 이미지와 기준인 두개의 이미지를 겹쳐서 보여줌 
test=imtranslate(I,[x y]);
figure;
C = imfuse(I2,test,'falsecolor','Scaling','joint','ColorChannels',[1 2 0]);
imshow(C)
                                 