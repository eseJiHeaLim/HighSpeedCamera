%test combine 2&5
clear;clc;

%% 최종 결과물 영상 생성

video_file=VideoWriter('res.avi');
open(video_file);


%% 소스 영상 객체 생성
vidObj_2=VideoReader('nov3.mp4');
vidObj_3=VideoReader('nov3.mp4');
vidObj_4=VideoReader('trans4.avi');
vidObj_5=VideoReader('trans5.avi');
vidObj_6=VideoReader('trans6.avi');
vidObj_7=VideoReader('trans7.avi');
vidObj_8=VideoReader('trans8.avi');
%% 프레임 합치기

video_file_frame= vidObj_6.Duration * vidObj_6.FrameRate;

  test=readFrame(vidObj_6);
  test1=readFrame(vidObj_7);
for i=1:video_file_frame


   writeVideo(video_file , readFrame(vidObj_2));
   
   writeVideo(video_file , readFrame(vidObj_3));
   
   writeVideo(video_file , readFrame(vidObj_4));
   writeVideo(video_file , readFrame(vidObj_5));
     writeVideo(video_file , test);
     writeVideo(video_file , test);
          writeVideo(video_file , test1);
     writeVideo(video_file , test1);
        writeVideo(video_file , readFrame(vidObj_8));
  
end

close(video_file);
