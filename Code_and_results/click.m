function click(I1, I2, F)
% I1, I2 are images
% F is the funamental matrix

[e1 e2] = epipoles(F); % Get epipoles
[sy,sx]= size(I2); % Input size of image 2 (Right image on which we shall be plotting lines)

figure(gcf), clf % Figure
h_axes1 = subplot(121); % Figure for left image
imshow(I1,[]); hold on
xlabel({'(Left image) Select a point in this image', '(When done, right-click to exit)'}) % Set label for left image

subplot 122 % Figure for right image
imshow(I2,[]);
xlabel({'Corresponding epipolar lines','(Right image)'}) % Set label for right image


while 1
  subplot 121 
  legend('show');
  
  % Manage clicking situation
  [x y button] = ginput(1);
  if(gca~=h_axes1) % If you click outside the image, it'll give a reply 
      subplot 121
      title('Please click only in this image')
      continue;
  else
      subplot 121
      title('')
  end
  
  % Exiting the figure on right-click
  if button == 3 % Right - click to exit
    subplot 121
    subplot 122
    break;
  end

  xc = x;
  yc = y;

 
  v(1) = xc;
  v(2) = yc;
  v(3) = 1; % For homogeneous co-ordinates

  l = F * v';

  s = sqrt(l(1)^2+l(2)^2); % length

  if s==0 % Manage condition if there is zero line vector, that is s = 0 (length = 0)
    error('Zero line vector in function click');
  end

  l = l/s;

  if l(1) ~= 0
    ye = sy;
    ys = 1;
    xe = -(l(2) * ye + l(3))/l(1);
    xs = -(l(2) * ys + l(3))/l(1);
  else
    xe = sx;
    xs = 1;
    ye = -(l(1) * xe + l(3))/l(2);
    ys = -(l(1) * xs + l(3))/l(2);
  end
  
  plot(x,y, '*', 'MarkerSize', 6, 'LineWidth', 2);

  subplot 122

  line([xs xe],[ys ye]);
end


subplot 121, hold off