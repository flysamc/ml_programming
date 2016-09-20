function  plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%


X ; y;
figure; hold on;
%find indices of positive and negative examples
pos = find(y==1);
neg = find(y==0);
%plot Examples

plot(X(pos, 1), X(pos, 2), 'k+', 'LineWidth',2,'MarkerSize',7);
plot(X(neg, 1), X(neg, 2), 'ro', 'LineWidth',2,'MarkerSize',7);








% =======================================================================

end
