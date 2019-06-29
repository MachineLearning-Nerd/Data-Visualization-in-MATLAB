clc
clear all
close all

% mkdir('images')
% shuttleVideo = VideoReader('shuttle.avi');
% 
% ii = 1;
% 
% while hasFrame(shuttleVideo)
%    img = readFrame(shuttleVideo);
%    filename = [sprintf('%03d',ii) '.jpg'];
%    fullname = fullfile('images',filename);
%    imwrite(img,fullname)    % Write out to a JPEG file (img1.jpg, img2.jpg, etc.)
%    ii = ii+1;
% end

imageNames = dir(fullfile('images','*.png'));
imageNames = {imageNames.name}';


outputVideo = VideoWriter(fullfile('shuttle_out.avi'));
outputVideo.FrameRate = 30;
open(outputVideo)


for ii = 0:length(imageNames)-1
   imagename = ['finalimages1' , num2str(ii), '.png'];
   img = imread(fullfile('images',imagename));
   writeVideo(outputVideo,img)
end

close(outputVideo)

% shuttleAvi = VideoReader(fullfile(workingDir,'shuttle_out.avi'));