% ----------------------------------------------------------------------
%   1-03 1-00で求めた主慣性軸方向を3次元空間に矢印でプロットせよ
%    20210510  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%   
%   (c) 2021 yasuhiro yoshimura
%----------------------------------------------------------------------

clc
clear
close all

%% 慣性テンソル
% 対称行列であることに注意
J = [10 2 -3
    2 14 1
    -3 1 16];

%% 主慣性モーメント
[v, d] = eig(J); % 固有ベクトルv, 固有値dを求めるeig関数．
% 主慣性モーメント = 慣性テンソルの固有値なので，dそのまま．
% 三角不等式を満たさないといけない．
% つまり次式全てを満たさないと物理的におかしい慣性テンソルになっている可能性
% d(1) + d(2) > d(3), d(1) + d(3) > d(2), d(2) + d(3) > d(1)
d

% 慣性テンソルの対角化をテンソルの回転と等価
% なので固有ベクトル方向でok
v^(-1) * J * v % 一応確認

figure
quiver3(0, 0, 0, v(1,1), v(2,1), v(3,1), 'r') % quiver3便利
hold on % 重ねるのでhold on
quiver3(0, 0, 0, v(1,2), v(2,2), v(3,2), 'g')
quiver3(0, 0, 0, v(1,3), v(2,3), v(3,3), 'b')
axis equal % aspect比を1:1:1に