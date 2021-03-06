
%% 최종 결과물 영상 생성

video_file=VideoWriter('trans8.avi');
open(video_file);

%% 소스 영상 객체 생성

vidObj=VideoReader('t8.mp4');

t=1;
%% 프레임 합치기

video_file_frame= ceil(vidObj.Duration * vidObj.FrameRate)-1;

x=91.1928
y= 45.6595

for p=1:video_file_frame
   
    imwrite(readFrame(vidObj),'frame.jpg')
   
    f=imread('frame.jpg');
    % imshow(f);
    [img.Width, img.Height, img.C] = size(f);
    
    scale = 1;
    
    %stransX = 100;
    transX =x;
    
    %stransY = 100;
     transY =y;
 

    rotX =0;
    rotX = rotX* 3.14;

    eye_pos_x =1;
    img.Height;
 
    eye_pos_y =1;
    
    size_x = eye_pos_x; 
    size_y = eye_pos_y; %영상 변환 중심
    
    pixels_pers_2d = zeros(img.Width,img.Height , img.C);% 결과 이미지
    %%%%% 강체 변환 메트릭스 만들기
    a = scale * cos(rotX);
    b = scale * sin(rotX);
    d = -transX;
    c = -transY;
    k= zeros(3);
    k(1,1) = a;
    k(1,2) = -b;
    k(1,3) = c;
    k(2,1) = b;
    k(2,2) = a;
    k(2,3) = d;
    k(3,3) = 1;
    %%%%%%%%%% 강체 변환 메트릭스 만들기
    i =1;
    j =1;
    %결과 이미지의 각 픽셀들이 입력 이미지의 어느 좌표의픽셀에서
    %가져 오는지 좌표를 구하고, 그 좌표 픽셀이 정확히 정수로
    %떨어지지 않기 때문에 인터폴레이션을 수행한다.
    for i = -size_y : (img.Height - size_y)-1
        for j = -size_x : (img.Width - size_x)-1
            tmp = zeros(3,1);
            tmp(1) =j;
            tmp(2) =i;
            tmp(3) =1;
            tmp_result = k * tmp;% 3x3 * 3x1 매트릭스 곱
            
            w = tmp_result(3);
            homo_x = tmp_result(1);
            homo_y = tmp_result(2);
            
            real_x = homo_x / w;
            real_y = homo_y / w;
            %인터폴레이션을 하기 위한 좌표 구하기
            xx = floor(real_x +size_x);
            yy= floor(real_y +size_y);
            xx1 = ceil(real_x +size_x);
            yy1= ceil(real_y +size_y);
            p = real_x +size_x- xx;
            q = real_y +size_y- yy;
            if(xx > 0 && xx <img.Width)
                if(yy > 0 && yy <img.Height)
                    %인터폴레이션을 통해 3채널 값을 구하는 과정
                    S_R = (f( xx, yy , 1) * p*q) + (f( xx1, yy , 1) * (1-p)*q) + (f( xx, yy1 , 1) * p*(1-q)) +(f( xx1, yy1 , 1) * (1-p)*(1-q));
                    S_G = (f( xx, yy , 2) * p*q) + (f( xx1, yy , 2) * (1-p)*q) + (f( xx, yy1 , 2) * p*(1-q)) +(f( xx1, yy1 , 2) * (1-p)*(1-q));

                    S_B = (f( xx, yy , 3) * p*q) + (f( xx1, yy , 3) * (1-p)*q) + (f( xx, yy1 , 3) * p*(1-q)) +(f( xx1, yy1 , 3) * (1-p)*(1-q));
                    pixels_pers_2d(j+size_x+1,i+size_y+1 , 1) = S_R;
                    pixels_pers_2d(j+size_x+1,i+size_y+1, 2) = S_G;
                    pixels_pers_2d(j+size_x+1,i+size_y+1 , 3) = S_B;
                end
            end
        end
    end

   %255로 나누는 이유는 pixels_pers_2d
    imwrite(pixels_pers_2d/255,'test.jpg')                          %pixels_pers_2d의 데이터 형이 double

    writeVideo(video_file ,pixels_pers_2d/255); 
    disp(t);
    t=t+1;
    
end

%imshow(aa);
close(video_file);
