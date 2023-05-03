clc; clear; close all;
VidObj = VideoReader('Controversial_goal.mp4');
str = '.bmp';
for i = 1:400
    filename = strcat(num2str(i),str);
    VidFrame = read(VidObj,i);
    imwrite(VidFrame,filename);
end
