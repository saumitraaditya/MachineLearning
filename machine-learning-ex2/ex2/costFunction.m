function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

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
%
% Note: grad should have the same dimensions as theta
%
hypothesis_vector = X*theta;
sigmoid_hypothesis_vector = sigmoid(hypothesis_vector);
log_sigmoid_hypothesis_vector = sigmoid_hypothesis_vector;
for i=1:size(log_sigmoid_hypothesis_vector)
    log_sigmoid_hypothesis_vector(i,1)=log(sigmoid_hypothesis_vector(i,1));
end
first_summation_part = -(y' * log_sigmoid_hypothesis_vector); %sum of products

% now calculate second summation part.

[rows,cols]=size(sigmoid_hypothesis_vector);
residue_sigmoid_hypothesis_vector = ones(rows,cols)-sigmoid_hypothesis_vector;
log_residue_sigmoid_hypothesis_vector = residue_sigmoid_hypothesis_vector;
for i=1:size(log_residue_sigmoid_hypothesis_vector)
    log_residue_sigmoid_hypothesis_vector(i,1)=log(residue_sigmoid_hypothesis_vector(i,1));
end
[rows,cols]=size(y);
residue_y = ones(rows,cols)-y;
second_summation_part = residue_y' * log_residue_sigmoid_hypothesis_vector;

J = (first_summation_part-second_summation_part)/m;

grad = grad - (X'*(hypothesis_vector-y))/m;




% =============================================================

end
