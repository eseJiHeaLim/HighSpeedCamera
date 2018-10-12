% �� ī�޶��� �� ���̸� ���ϴ� �Լ�
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

% �̵��ؾ��� ���� �˾Ƴ� by median
x=median(imagePoints2(:,1)-imagePoints(:,1));
y=median(imagePoints2(:,2)-imagePoints(:,2));

% �̵��� �̹����� ������ �ΰ��� �̹����� ���ļ� ������ 
test=imtranslate(I,[x y]);
figure;
C = imfuse(I2,test,'falsecolor','Scaling','joint','ColorChannels',[1 2 0]);
imshow(C)
                                 