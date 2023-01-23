clear all

% specify directories
sqrt_directory = './project/figures/sqrt/'
square_directory = './project/figures/square/'


% create directories if nonexistent
if ~exist(sqrt_directory, 'dir')
       mkdir(sqrt_directory)
end

if ~exist(square_directory, 'dir')
       mkdir(square_directory)
    end


% read the image    
colorImage = imread('./project/sample.jpg');
gray = rgb2gray(colorImage);
[m,n] = size (gray);

% show the image
%imshow(gray);


%define c
%c = 1;
% define transformation
%t_sqrt = c * uint8(sqrt(double(gray)));

%show transformed
%imshow(t_sqrt);

%histogram(t_sqrt, 'normalization', 'probability');
%u = unique(t_sqrt);
%freq = sort([u, histc(t_sqrt(:),u)],'descend');
%x = freq(:,1);
%y = freq(:,2);




%vec = gray(:);
%transform = t_sqrt(:);
%transform = double(t_sqrt);
%log_transform = log(transform);
%transform_int = uint8(log_transform);
%transform = transform_int(:);
%scatter(vec,transform)

for c = 0:15    
   % create a folder with current c value
   c_directory = sprintf('c-%d/', c);
   dir = strcat(sqrt_directory, c_directory);
   mkdir(dir);
   % Apply the transformation
   t_sqrt = c * uint8(sqrt(double(gray)));
   % Write the transformed image
   image_name = strcat(dir, 'image.jpg');
   imwrite(t_sqrt, image_name);
   % Save plot of histogram
   plot_histogram = histogram(t_sqrt, 'normalization', 'probability');
   plot_hist_name = strcat(dir, 'plot-his.jpg');
   saveas(plot_histogram, plot_hist_name);
   % Convert image (both initial and trasnformed) 
   % matrices to vectors
   vec = gray(:);
   transform = t_sqrt(:);
   % Save scatterplot of initial initial image and transformed
   plot_scatter_name = strcat(dir, 'plot-scatter.jpg');
   plot_scatter = scatter(vec,transform);
   saveas(plot_scatter, plot_scatter_name);

end







for c = 0:10:255
   % create a folder with current c value
   c_directory = sprintf('c-%d/', c);
   dir = strcat(square_directory, c_directory);
   mkdir(dir);
   % Apply the transformation
   t_square = c .* gray.^2;
   % Restrict values to intensity values
   t_square(t_square >= 255) = 255;
   t_square(t_square <= 0) = 0;
   % Write the transformed image
   image_name = strcat(dir, 'image.jpg');
   imwrite(t_square, image_name);
   % Save plot of histogram
   plot_histogram = histogram(t_square, 'normalization', 'probability');
   plot_hist_name = strcat(dir, 'plot-his.jpg');
   saveas(plot_histogram, plot_hist_name);
   % Convert image (both initial and trasnformed) 
   % matrices to vectors
   vec = gray(:);
   transform = t_square(:);
   % Save scatterplot of initial initial image and transformed
   plot_scatter_name = strcat(dir, 'plot-scatter.jpg');
   plot_scatter = scatter(vec, transform);
   saveas(plot_scatter, plot_scatter_name);
end



for d = 0:10:255
   c = 1/d
   % create a folder with current c value
   c_directory = sprintf('c-%d/', c);
   dir = strcat(square_directory, c_directory);
   mkdir(dir);
   % Apply the transformation
   t_square = c .* gray.^2;

   % Restrict values to intensity values
   t_square(t_square >= 255) = 255;
   t_square(t_square <= 0) = 0;
   % Write the transformed image
   image_name = strcat(dir, 'image.jpg');
   imwrite(t_square, image_name);
   % Save plot of histogram
   plot_histogram = histogram(t_square, 'normalization', 'probability');
   plot_hist_name = strcat(dir, 'plot-his.jpg');
   saveas(plot_histogram, plot_hist_name);
   % Convert image (both initial and trasnformed) 
   % matrices to vectors
   vec = gray(:);
   transform = t_square(:);
   % Save scatterplot of initial initial image and transformed
   plot_scatter_name = strcat(dir, 'plot-scatter.jpg');
   plot_scatter = scatter(vec, transform);
   saveas(plot_scatter, plot_scatter_name);
end







