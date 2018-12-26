vidObj_1=VideoReader('nov7.mp4');

for p=1:15
    im1=readFrame(vidObj_1);
end
imwrite(im1,'ii7.jpg');