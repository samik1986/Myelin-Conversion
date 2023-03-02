%% Function to convert the Myelin images to 
% images corresponding to process detection in red
% input filename for images in myelin 8-bit images
% Usage: trfm2processDet(<filename>)
% Example: trfm2processDet('MD847_My_173_box1.tif')
% Samik Banerjee 02 Mar, 2023
function trfm2processDet(filename)
% Read image
img = imread(filename);
% convert to HSV for getting the values on intensity
hsvImg = rgb2hsv(img);
% convert to red signals
rgbImg = zeros(size(img));
rgbImg(:,:,1) = 1-hsvImg(:,:,3);
% Display Resulting image
figure('NumberTitle', 'off', 'Name', filename); 
imshow(rgbImg); title(filename);
% write back the equivalent image
fileExt = filename(strfind(filename, '.'):end); 
imwrite(rgbImg, strrep(filename, fileExt, ['_conv' fileExt]));
end