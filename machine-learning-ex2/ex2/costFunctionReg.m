function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
k = zeros(size(theta));
k(1) = theta(1).^2;
z = (theta'*X')';
g =  sigmoid(z);
j3 = (sum(-y.*log(g) -1*(1-y).*log(1-g)))/m;
j4 = ((lambda)/(2*m))*(sum(theta.^2 - k ));
J = j3 + j4 ;%cost value

%gradient


grad= sum(((g - y).*X)/m)   ;
grad = grad' + (lambda/m).*theta;
grad(1) = grad(1) - (lambda/m).*theta(1);

%grad = grad1' - K;

%gradient calculation






% =============================================================

end
