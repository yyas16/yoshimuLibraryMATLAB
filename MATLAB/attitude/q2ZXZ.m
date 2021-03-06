function Euler = q2ZXZ(def, q_input)
%   calculate ZXZ Euler angles from quaternions
%    20170628  y.yoshimura
%    Inputs:scalar, specify the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           q_input: quaternions nx4 matrix
%   Outputs: ZXZ euler angles(nx3 vector), [phi, theta, psi] [rad]
%          phi: 1st rotation   @z-axis
%          theta: 2nd rotation @x-axis
%          psi:   3rd rotation @z-axis
%   related function files:
%   note:
%   cf:
%   revisions;
%   function Euler = q2ZXZ(def, q)
%   (c) 2017 yasuhiro yoshimura
%----------------------------------------------------------------------

% DCM denotes a rotation from inertial frame to body frame
% i.e. b = R*i
% R = [q(1)^2 + q(2)^2 - q(3)^2 - q(4)^2, 2*(q(2)*q(3) + q(1)*q(4)), 2*(q(2)*q(4) - q(1)*q(3))
%     2*(q(2) * q(3) - q(1) * q(4)), q(1)^2 - q(2)^2 + q(3)^2 - q(4)^2, 2*(q(3)*q(4) + q(1)*q(2))
%     2*(q(2)*q(4) + q(1)*q(3)), 2*(q(3)*q(4) - q(1)*q(2)), q(1)^2 - q(2)^2 - q(3)^2 + q(4)^2];

% calculate DCM using the definition that q0 = cos(theta/2)
q = (def == 0 ) .* q_input...
     + (def == 4) .* [q_input(:,4), q_input(:,1), q_input(:,2), q_input(:,3)];

R31 = 2.0 .* (q(:,2) .* q(:,4) + q(:,1) .* q(:,3));
R32 = 2.0 .* (q(:,3) .* q(:,4) - q(:,1) .* q(:,2));
R13 = 2.0 .* (q(:,2) .* q(:,4) - q(:,1) .* q(:,3));
R23 = 2.0 .* (q(:,3) .* q(:,4) + q(:,1) .* q(:,2));
R33 = q(:,1).^2 - q(:,2).^2 - q(:,3).^2 + q(:,4).^2;

phi = atan2(R31, -R32);
psi = atan2(R13, R23);
theta = atan2(sqrt(R31.^2 + R32.^2), R33);

Euler = [phi theta psi]; % [rad]

end