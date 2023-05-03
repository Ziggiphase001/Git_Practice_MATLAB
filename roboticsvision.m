clc; clear; close all;
faceDetector = vision.CascadeObjectDetector;
eyeDetector = vision.CascadeObjectDetector('EyePairBig');
noseDetector = vision.CascadeObjectDetector('Nose');
b = imread('Ziggy.jpg');
bbox = step(faceDetector,b);
BoundingBoxEye = step(eyeDetector,b);
BoundingBoxNose = step(noseDetector,b);
for i = 1:size(bbox,1)
    x = bbox(i,1);
    y = bbox(i,2);
    w = bbox(i,3);
    h = bbox(i,4);
croppedimage = imcrop(b,[x y w h]);
figure, imshow(croppedimage);
end
imwrite(croppedimage,'basit.bmp');
a = imcrop(b,BoundingBoxFace);
imwrite(a,'created.bmp');
Ifaces = insertObjectAnnotation(b, 'rectangle', BoundingBoxFace, 'Face');
Ifaces = insertObjectAnnotation(Ifaces, 'rectangle', BoundingBoxEye, 'Eye');
Ifaces = insertObjectAnnotation(Ifaces, 'rectangle', BoundingBoxNose, 'Nose');

figure;

imshow(Ifaces);
