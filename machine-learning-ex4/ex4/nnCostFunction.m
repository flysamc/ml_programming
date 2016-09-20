function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
%adding 1 row for bias unit.
a1 = X;
a1 = [ones(m,1) a1];
z2 = a1*Theta1';
a2 = sigmoid(z2);
a2 = [ones(m, 1) a2];
z3 = a2*Theta2';
a3 = sigmoid(z3);

n = num_labels;
%converting y to 5000x10 matrix
s= zeros(m,n);
for i=1:m
    for j=1:n
        s(i,j) = j;
       
    end
end


for i=1:m
    z = (s(i,:)==y(i,:));
    s(i,:) = z;
end
trueValue = s;
%cost funtion.
J = (sum(sum(-s'.*log(a3') -1*(1-s').*log(1-a3'))))/m;
%for regularization
j2=0;
j3=0;
temp = Theta1;
%temp(1,:) = 0;
[r,c] = size(temp);
for i=1:r
    for j = 2:c
        j2 = j2 + temp(i,j).^2;
    end
end

temp = Theta2;
%temp(1,:) = 0;
[r,c] = size(temp);
for i=1:r
    for j = 2:c
        j3 = j3 + (temp(i,j).^2);
    end
end
j4 = ((lambda)/(2*m))*(j2 + j3);
%final cost
J = J + j4;
        
        


    






% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
%
[m,n] = size(X);
for t=1:m
   %step one-calculate a3.
    a1 = X(t,:);
    a1 = [1 , a1];
    z2 = a1*Theta1';
    z2v= [1,z2];
    a2 = sigmoid(z2);
    a2 = [1,a2];
    z3 = a2*Theta2';
    a3 = sigmoid(z3);
    %step two-calculate delta3.
    delta_3 = a3 - trueValue(t,:);
    %step three-calculate delta2.
    delta_2 = Theta2'*delta_3'.*sigmoidGradient(z2v');
    delta_2 = delta_2(2:end);
    Theta2_grad = Theta2_grad + delta_3'*a2;
    Theta1_grad = Theta1_grad + delta_2*a1;
end


temp1 = Theta1_grad;
temp2 = Theta2_grad;





Theta1_grad = (1/m)*Theta1_grad + (lambda/m)*Theta1;
Theta2_grad = (1/m)*Theta2_grad + (lambda/m)*Theta2;
Theta1_grad(:,1) = temp1(:,1)/m;
Theta2_grad(:,1) = temp2(:,1)/m;






% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%



















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
