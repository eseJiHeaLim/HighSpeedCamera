%test combine 2&5
clear;clc;

%% ���� ����� ���� ����

video_file=VideoWriter('trans.avi');
open(video_file);


%% �ҽ� ���� ��ü ����
vidObj=VideoReader('trans1.avi');
vidObj2=VideoReader('t3.mp4');

%% ������ ��ġ��

video_file_frame= vidObj.Duration * vidObj.FrameRate;

for i=1:video_file_frame
  
   writeVideo(video_file , readFrame(vidObj));
   writeVideo(video_file , readFrame(vidObj2));

end

close(video_file);