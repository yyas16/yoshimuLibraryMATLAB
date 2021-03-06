% ----------------------------------------------------------------------
%    座標を(phi,theta,psi)[deg]回転(ZYX Euler angle) mは機器番号 kは面数
%    20190627  y.yoshimura
%    Inputs: phi: angle around z-axis, deg
%            theta: angle around y-axis, deg
%            psi: angle around x-axis, deg
%            m: number of equipments
%            k: the number of face of the equipment
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%   function vert = rotation(vert, phi, theta, psi, m, k)
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

function vert = rotation(vert, phi, theta, psi, m, k)

phi     = deg2rad(phi); %// radへ変換
theta   = deg2rad(theta);
psi     = deg2rad(psi);

R = ZYX2DCM(phi, theta, psi)'; % note: DCM for vector rotation

for i = 1:k
    vert(m,i).coord = (R * vert(m,i).coord')';
end

end