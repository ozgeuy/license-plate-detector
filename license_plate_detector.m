% Load the image and convert it to gray scale
I = imread('C:\Users\user\Desktop\plaka18.jpeg');
Igray = rgb2gray(I);

%imwrite(Igray, 'C:\Users\user\Desktop\plaka23_Igray.jpeg')
 sat = size(I) *[1;0;0];
sut=size(I)*[0;1;0];
% Detect black line
BW = Igray < 240;
%imwrite(BW, 'C:\Users\user\Desktop\plaka23_BW1.jpeg')

% Detect rectangle region (inside the line)
BW = imclearborder(~BW);
%imwrite(BW, 'C:\Users\user\Desktop\plaka23_BW2.jpeg') 

BW = bwareafilt(BW,1);
%imwrite(BW, 'C:\Users\user\Desktop\plaka23_BW3.jpeg')

s = regionprops(BW,'BoundingBox');
yMin = ceil(s.BoundingBox(1));
yMax = yMin + s.BoundingBox(3);
xMin = ceil(s.BoundingBox(2));
xMax = xMin + s.BoundingBox(4) - 1;

%flippedImage = flipud(I);

for i=1:sat
  for j=1:sut
  
		if(j<yMin || j>yMax || i > xMax || i < xMin)
			I(i,j,:)=0;
      endif

  end
end
% Show the result
figure
imshow(I);
imwrite(I, 'C:\Users\user\Desktop\plaka18_end.jpeg') 