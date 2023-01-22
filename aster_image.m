%{
    Following the example of processing NASA TERRA-ASTER satellite image of Kathmandu, Nepal.
    (https://asterweb.jpl.nasa.gov/gallerymap.asp) 
    (Chapter 8.3: Importing, Processing, and Exporting Images)
    
    revised by Brendan Casey
%} 

I1 = imread('kathmandu.jpeg');

whos

I1(50:55,50:55,1);

I2 = rgb2gray(I1);



subplot(2,2,1)
imshow(I1)
title('ASTER Image of Kathmandu (RGB)')

subplot(2,2,3)
imhist(I1)

subplot(2,2,2)
imshow(I2)
title('ASTER Image of Kathmandu (Gray-value)')

subplot(2,2,4)
imhist(I2)

I3 = histeq(I2)

imwrite(I3,'equHistGray_Kat.jpg');
iminfo(I3,'equHistGray_Kat.jpg')

%Transform from 256^3 colors to 16 colors
[I4, map] = rgb2ind(I1,16);
imshow(I1), figure, imshow(I4,map)

imwrite(I4,map,'equHistGray_Kat_index.jpg')
imshow(I4,map)
cmap = colormap
colormap(hot)