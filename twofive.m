%test combine 2&5
clear;clc;

%% ���� ����� ���� ����

video_file=VideoWriter('25.avi');
open(video_file);


%% �ҽ� ���� ��ü ����
vidObj_2=VideoReader('2_ball.mp4');
vidObj_5=VideoReader('new5.avi');
% myVideo = VideoWriter('new5.avi');
% myVideo.Width=1920
% myVideo.Height=1080;
%vidObj_5.Width=1920
%% ������ ��ġ��

video_file_frame= vidObj_2.Duration * vidObj_2.FrameRate;

for i=1:video_file_frame
  
   writeVideo(video_file , readFrame(vidObj_2));
   writeVideo(video_file , readFrame(vidObj_5));

end

close(video_file);
