% �� ī�޶��� �� ���̸� ���ϴ� �Լ�
I=imread('camera2.jpg');
[imagePoints,boardSize] = detectCheckerboardPoints(I);
figure;
imshow(I);
hold on;
plot(imagePoints(:,1),imagePoints(:,2),'ro');

I2=imread('camera5.jpg');
[imagePoints2,boardSize2] = detectCheckerboardPoints(I2);
figure(2);
imshow(I2);
hold on;
plot(imagePoints2(:,1),imagePoints2(:,2),'ro');

% �̵��ؾ��� ���� �˾Ƴ� by median
x=median(imagePoints2(:,1)-imagePoints(:,1));
y=median(imagePoints2(:,2)-imagePoints(:,2));

% �̵��� �̹����� ������ �ΰ��� �̹����� ���ļ� ������ 
test=imtranslate(I2,[x-10 -y]);
figure;
C = imfuse(I,test,'falsecolor','Scaling','joint','ColorChannels',[1 2 0]);
imshow(C)
                                 