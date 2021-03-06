function DCM = q2DCM(scalar, q)
% -------------------------------------------------------------------
%   calculate directional cosine matrix from quaternions
%   input: scalar, specify the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%          q, quaternions, 4x1 vector
%   outut: DCM, rotation matrix, 3x3 matrix
%   DCM = q2DCM(scalar, q)
%   (c) 2015  yasuhiro yoshimura
% -------------------------------------------------------------------

normQ = sqrt(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2);
tempQ = q ./ normQ;

if (scalar == 0)
    
    q0 = tempQ(1);
    q1 = tempQ(2);
    q2 = tempQ(3);
    q3 = tempQ(4);
    
    normQ = sqrt(q0^2+q1^2+q2^2+q3^2);
    q0 = q0./normQ;
    q1 = q1./normQ;
    q2 = q2./normQ;
    q3 = q3./normQ;
    
    DCM = [q0^2 + q1^2 - q2^2 - q3^2, 2.0 * (q1 * q2 + q0 * q3), 2.0 * (q1 * q3 - q0 * q2)
        2.0 * (q1 * q2 - q0 * q3), q0^2 - q1^2 + q2^2 - q3^2, 2.0 * (q2 * q3 + q0 * q1)
        2.0 * (q1 * q3 + q0 * q2), 2.0 * (q2 * q3 - q0 * q1), q0^2 - q1^2 - q2^2 + q3^2];
    
elseif (scalar == 4)
    q1 = tempQ(1);
    q2 = tempQ(2);
    q3 = tempQ(3);
    q4 = tempQ(4);
    
    DCM = [q1^2 - q2^2 - q3^2 + q4^2, 2.0 * (q1 * q2 + q4 * q3), 2.0 * (q1 * q3 - q4 * q2)
        2.0 * (q1 * q2 - q4 * q3), - q1^2 + q2^2 - q3^2 + q4^2, 2.0 * (q2 * q3 + q4 * q1)
        2.0 * (q1 * q3 + q4 * q2), 2.0 * (q2 * q3 - q4 * q1), - q1^2 - q2^2 + q3^2 + q4^2 ];
    
else
    error('definition of quaternions is unclear');
    
end

end