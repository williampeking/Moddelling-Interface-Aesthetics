clear all;
clc;
b_layout=319;
h_layout=221;
% object X Y Width Height
Data=[1 80 53 70 70;
    2 80 128 70 70;
    3 168 53 70 70;
    4 168 128 70 70;
    5 6 5 306 16];

% the following numbers should be calculated

% the number of object in frame
% Number_object
Number_object = size(Data,1);

% the area of object i 
% Area_object
Area_object = zeros(1,Number_object);
for i=1:1:Number_object
    Area_object(i) = Data(i,4)*Data(i,5);
end

% the area of object i on side j following L, R, T, B
Area_side=zeros(Number_object,4);
for i=1:1:Number_object
    if Data(i,2)<=b_layout/2
        if Data(i,2)+Data(i,4)<=b_layout/2
%             only in side L
            Area_side(i,1) = Area_object(i);
        else
%             across side L and R
            Area_side(i,1) = Data(i,5)*(floor(b_layout/2)-Data(i,2));
            Area_side(i,2) = Area_object(i)-Area_side(i,1);
        end
    else
%         only in side R
        Area_side(i,2) = Area_object(i);
    end
    
    if Data(i,3)<=h_layout/2
        if Data(i,3)+Data(i,5)<=h_layout/2
%             only in side T
            Area_side(i,3) = Area_object(i);
        else
%             across side T and B
            Area_side(i,3) = Data(i,4)*(floor(h_layout/2)-Data(i,3));
            Area_side(i,4) = Area_object(i)-Area_side(i,3);
        end
    else
%         only in side B
        Area_side(i,4) = Area_object(i);
    end
end

% the area of object i on quadrant j following UL, UR, LL, LR
% use a coeffcient matrix and Area_side to transfer the problem into a
% non-homogeneous linear  equations
A =[1 0 1 0;
    0 1 0 1;
    1 1 0 0;
    0 0 1 1];
Area_quadrant = zeros(Number_object,4);
for i=1:1:Number_object
%     Area_quadrant(i,:) = (pinv(A)*(Area_side(i,:).')).';
    Area_quadrant(i,:)= int32((lsqnonneg(A,(Area_side(i,:).'))).');
end

% frame point of the frame
% following as min_x min_y max_x max_y
frame=zeros(1,4);
frame(1) = min(Data(:,2));
frame(2) = min(Data(:,3));
frame(3) = max(Data(:,2)+Data(:,4));
frame(4) = max(Data(:,3)+Data(:,5));

% distance between the central lines of the object and the frame
Distance_object=zeros(Number_object,4);

for i=1:1:Number_object
   Distance_object(i,1) = Data(i,2)+Data(i,4)/2-frame(1);
   Distance_object(i,2) = frame(3)-(Data(i,2)+Data(i,4)/2);
   Distance_object(i,3) = Data(i,3)+Data(i,5)/2-frame(2);
   Distance_object(i,4) = frame(4)-(Data(i,3)+Data(i,5)/2);
end

% the total number of objects on the side j
Number_side = sum(Area_side~=0,1);

% the total number of objects on the quadrant j
Number_quadrant = sum(Area_quadrant~=0,1);

% the width b_frame and height h_frame of the frame
b_frame = frame(3)-frame(1);
h_frame = frame(4)-frame(2);

% b and h are the width and height of the object
b_object = Data(:,4);
h_object = Data(:,5);

%  co-ordinates of the centre of the frame
x_c = floor((frame(1)+frame(3))/2);
y_c = floor((frame(2)+frame(4))/2);

% co-ordinates of the centres of object i on quadrant j
x_quadrant = ones(Number_object,4)*x_c;
y_quadrant = ones(Number_object,4)*y_c;

for i=1:1:Number_object
%     UL quadrant
   if Data(i,2)<=b_layout/2 && Data(i,3)<=h_layout/2
       
       if Data(i,2)+Data(i,4)<=b_layout/2
           x_quadrant(i,1) = floor((Data(i,2)+Data(i,4)/2));
       else
           x_quadrant(i,1) = floor((Data(i,2)+ x_c)/2);
       end
       
       if Data(i,3)+Data(i,5)<=h_layout/2
           y_quadrant(i,1) = floor((Data(i,3)+Data(i,5)/2));
       else
           y_quadrant(i,1) = floor((Data(i,3)+ y_c)/2);
       end
       
   end
%    UR quadrant
   if Data(i,2)>b_layout/2 && Data(i,3)<=h_layout/2
       
       x_quadrant(i,2) = floor((Data(i,2)+ x_c)/2);

       if Data(i,3)+Data(i,5)<=h_layout/2
           y_quadrant(i,2) = floor((Data(i,3)+Data(i,5)/2));
       else
           y_quadrant(i,2) = floor((Data(i,3)+ y_c)/2);
       end
       
   end
%     LL quadrant
   if Data(i,2)<=b_layout/2 && Data(i,3)>h_layout/2
       
       if Data(i,2)+Data(i,4)<=b_layout/2
           x_quadrant(i,3) = floor((Data(i,2)+Data(i,4)/2));
       else
           x_quadrant(i,3) = floor((Data(i,2)+ x_c)/2);
       end
       
       y_quadrant(i,3) = floor((Data(i,3)+Data(i,5)/2));

   end
%    LR quadrant
   if Data(i,2)>b_layout/2 && Data(i,3)>h_layout/2
       
       x_quadrant(i,4) = floor((Data(i,2)+Data(i,4)/2));
       
       y_quadrant(i,4) = floor((Data(i,3)+Data(i,5)/2));

   end
   
end



% numbers of vertical and horizontal alignment points
Temp = [Data(:,2) Data(:,3);Data(:,2)+Data(:,4) Data(:,3)+Data(:,5)];

n_ver = size(unique(Temp(:,1)),1);
n_hor = size(unique(Temp(:,2)),1);

clear Temp;

% the number of sizes
n_size = size(unique(Data(:,[4 5]),'rows'),1);

% the number of distinct distances between column and row starting points
Temp = [Data(:,2)-frame(1);Data(:,3)-frame(2)]; 

n_spacing = sum(unique(Temp(:,1))~=0);

clear Temp;

% x_object and y_object the co-ordinates of the centres of object
x_object = floor(Data(:,2)+Data(:,4)/2);
y_object = floor(Data(:,3)+Data(:,5)/2);


M=zeros(1,13);
M(1) = BalanceMeasure(Number_object,Area_side,Distance_object);
% 
% wT is the weight of top
% wB is the weight of bottom
% wL is the weight of left
% wR is the weight of right
% w is the weight, following wL, wR, wT, wB
% n is the total number of objects
% a(i,j) is the area of object i on the side j
% d(i,j) is the distance between the central lines of the objcet and the frame
M(2) = EquilibriumMeasure( Number_object, x_object,y_object ,x_c ,y_c ,Area_object ,h_frame ,b_frame );
% 
% n is the total number of the object on the frame
% area(i) is the area of the object i
% x(i) is the co-ordinate x of the centres of object i
% x_c is the co-ordinate x of the centres of the frame
% y(i) is the co-ordinate y of the centres of object i
% y_c is the co-ordinate y of the centres of the frame

% h_frame is the height of the frame
% Note that the maximum values of |y(i)-y_c| is h_frame/2
% b_frame is the width of the frame
% Note that the maximum values of |x(i)-x_c| is b_frame/2
M(3) = SymmetryMeasure( Number_object, x_quadrant, y_quadrant, x_c, y_c ,b, h);
% 
% SYM is measure of symmetry
% rank of j following UL,UR,LL,LR
% UL, UR, LL and LR stand for upper-left, upper-right, lower-left and lower-right
% (x(i,j), y(i,j)) and (x_c, y_c) are the co-ordinates of the centres
% of object i on quadrant j and the frame
% b(i,j) and h(i,j) are the width and height of
% the object
% n is the total number of objects
% using a trick here
M(4) = SequenceMeasure( Number_object,Area_quadrant );
% The rank following UL, UR, LL, LR
% aq(i,j) is the area of object i on quadrant j
% Each quadrant is given a weighting in q
M(5) = CohesionMeasure( Number_object, h_layout, b_layout, h_frame, b_frame,h ,b );
% n is the number of objects on the frame.
% bi and hi the width and height of object i
% blayout and hlayout and bframe and hframe are the widths and heights of the layout and the frame
a_layout = h_layout*b_layout;
a_frame = (frame(3)-frame(1))*(frame(4)-frame(2));
M(6) = UnityMeasure(Number_object, n_size, Area_object ,a_layout, a_frame );
% n_size is the number of sizes used
% n is the number of objects on the frame
% a(i), a_layout, and a_frame are the areas of object i, the layout, and the frame
M(7) = ProportionMeasure( Number_object, h, b, h_layout, b_layout);
% ps(j) is the proportion of shape j with Square, Square root of two,
% Golden rectangle, Square root of three, Double square.
% following sq, r2 gr r3 ds
% blayout and hlayout are the width and height of the layout.
M(8) = SimplicityMeasure( n_vap, n_hap, Number_object );
% 
% nvap and nhap are the numbers of vertical and horizontal alignment points
% n is the number of objects on the frame.
M(9) = DensityMeasure( Number_object, a_frame, Area_object );
% 
% ai and aframe are the areas of object i and the frame
% n is the number of objects on the frame
M(10) = RegularityMeasure( Number_object, n_vap, n_hap, n_spacing);
% 
% n_vap and n_hap are the numbers of vertical and horizontal alignment points
% n_spacing is the number of distinct distances between column and row starting points
% n is the number of objects on the frame.
M(11) = EconomyMeasure( n_size );
% nsize is the number of sizes.
M(12) = HomogeneityMeasure( Number_object, Number_quadrant(1), Number_quadrant(2),Number_quadrant(3) ,Number_quadrant(4));
% 
% n is the number of objects on the frame
% n_UL, n_UR, n_LL, and n_LR are the numbers of objects on the 
% upper-left, upper-right, lower-left, and lower-right quadrants
M(13) = RhythmMeasure( x_quadrant, y_quadrant, Number_object, Area_object, x_c, y_c );
% 
% UL, UR, LL, and LR stand for upper-left, upper-right, lower-left, and lower-right
% (x(i,j),y(i,j)) and (x_c,y_c) are the co-ordinates of the centres of object i on quadrant j and the frame
% aij is the area of the object
% nj is the total number of objects on the quadrant

