function [area, pos] = calcArea_obj(sat)
% -------------------------------------------------------------------
%   calculate area and position for .obj format
%
%   20200903  yasuhiro yoshimura
%        input: sat: structure that includes vertices and face indices
%       output: are: facet area, m^2, Nx1
%               pos: facet pos, m, Nx3
% function [area, pos] = calcArea_obj(sat)
% -------------------------------------------------------------------

% vector from index 1 to index 2, nx3 matrix
vA = sat.vertices(sat.faces(:,2),:) - sat.vertices(sat.faces(:,1),:);

% vector from index 1 to index 3, nx3 matrix
vB = sat.vertices(sat.faces(:,3),:) - sat.vertices(sat.faces(:,1),:);

crossA = cross(vA, vB); % cross product between vA and vB
area(:,1) = vecnorm(crossA, 2, 2) ./ 2; % (norm of cross product) ./ 2

posSum = sat.vertices(sat.faces(:,1),:) + ...
    sat.vertices(sat.faces(:,2),:) + ...
    sat.vertices(sat.faces(:,3),:); % nx3 matrix

pos = posSum ./ 3.0;


end