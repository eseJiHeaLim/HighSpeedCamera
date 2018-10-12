clear;clc;


% vidObj_1=VideoReader('2_ball.mp4');
% vidObj_2=VideoReader('5_ball.mp4');
% 
% 
% im1=readFrame(vidObj_1);
% im2=readFrame(vidObj_2);
% 
% imwrite(im1,'i1.jpg');
% imwrite(im2,'i2.jpg');

a=imread('frame.jpg');
b=imread('frame2.jpg');

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
x2=[623.81427;985.96057;571.83759;623.81427;607.23584;639.97809;986.58057;135.76508;1277.5658;807.87408;608.06689;107.08793;107.67747;136.05936;78.409782;78.409782;78.409782;986.39294;82.188553;107.08793;1286.6986;551.57910;553.91425;119.89240;1279.0800;582.09058;1583.5110;1035.4811;991.78363;1365.9392;118.39659;550.20276;113.81475;96.846893;1001.3662;1279.0800;1365.9392;1306.4626;102.09193;1293.2460;105.33515;105.33515;961.30463;1383.7587;1321.8789;1279.4744;1341.8940;1374.9055;1330.5919;105.33515;1374.7323;97.831039;1539.2545;1700.8384;104.04176;1293.4023;1330.5919;575.80420;102.09193;1338.3734;1287.0270;1279.0800;590.99036]';
y2=[151.17996;823.88074;442.64258;151.17996;151.18732;150.32539;853.23975;383.94516;144.48116;829.68921;278.78635;238.34711;234.25510;333.02048;999.49603;999.49603;999.49603;815.25079;1010.5727;238.34711;322.24710;472.49411;487.74878;494.54648;284.86243;459.66412;143.75639;566.96985;640.27417;714.24103;334.31973;455.83521;576.32574;941.45697;648.61090;284.86243;714.24103;319.89584;655.04297;337.99905;766.68964;766.68964;567.83002;828.78723;459.89911;316.35748;630.70752;630.16785;442.01691;766.68964;822.00018;918.78015;126.47906;140.05206;656.89227;391.67709;442.01691;488.88818;655.04297;538.11298;301.55777;284.86243;428.01923]';
x1=[834.91357;1238.1702;817.67084;849.63000;838.19965;861.52307;1239.1272;422.22565;1564.2605;1049.9677;1050.3107;400.78799;401.69937;421.52985;378.99658;377.28073;373.70963;1239.0044;380.57516;398.56723;1580.0070;798.34656;799.28040;413.31940;1604.7268;826.75031;1906.0074;1292.3887;1246.9001;1656.6902;412.25421;796.31085;409.09189;394.64630;1256.8832;1582.4541;1666.7654;1598.5824;393.03891;1585.5077;401.52686;401.34659;1217.3317;1682.0226;1685.4304;1575.4364;1635.8644;1666.4824;1694.4783;401.05103;1671.6141;395.04123;1701.7007;1265.5077;390.12473;1587.6797;1622.4897;821.25696;388.16245;1640.8749;1610.9995;1631.0385;836.31628]';
y1=[219.19214;711.30243;301.00327;144.69592;145.55843;144.28909;740.56372;281.40222;54.075741;694.54944;701.63208;159.87248;155.90334;225.63899;896.34741;890.36011;881.89880;703.28101;902.34949;165.59285;248.21677;328.56259;344.37677;412.80466;385.83624;317.48795;50.245445;453.19940;525.71704;653.32813;253.16350;313.57663;493.87134;841.62823;534.74408;263.48517;710.48901;238.07362;627.06207;262.32089;666.52966;668.11298;453.02466;804.45087;768.66553;244.86627;571.18835;569.93719;750.54840;672.11328;777.79651;816.75360;37.144066;386.23825;781.53680;317.46390;371.73663;345.64603;802.97876;534.00195;398.34552;531.39032;286.93695]';

trans_x=mean(x1-x2);
trans_y=mean(y1-y2);
