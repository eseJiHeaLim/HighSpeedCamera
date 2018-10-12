%test combine 2&5
clear;clc;

%% 최종 결과물 영상 생성

video_file=VideoWriter('trans.avi');
open(video_file);


%% 소스 영상 객체 생성
vidObj=VideoReader('trans1.avi');
vidObj2=VideoReader('t3.mp4');

%% 프레임 합치기

video_file_frame= vidObj.Duration * vidObj.FrameRate;

for i=1:video_file_frame
  
   writeVideo(video_file , readFrame(vidObj));
   writeVideo(video_file , readFrame(vidObj2));

end

close(video_file);