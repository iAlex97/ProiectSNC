Tt = 3.2
Te = 0.33
w_min = 0.7616
w_max = 4.7600
zeta = 0.98

s = tf('s')
z = tf('z',Te)

w = 4 / (zeta * Tt)
Q = w*w / (s^2 + s*2*w*zeta + w^2)
Qd = c2d(Q, Te, 'zoh')
[p_root ~] = pzmap(Qd)

P = poly(p_root)

a = [1 -1.0942 0.2800];
b = [0.0704];

M = [
	1		0 		0 		0
	a(2)	1 		0 		0
	a(3) 	a(2)	b(1) 	0
	0 		a(3) 	0 		b(1)
	]

p = [1 P(2:3) 0]
x = inv(M)*p'

s = [1 x(2)]
r = [x(3:4)']

G = 0.96*(2-0.9996);
t = 1*P


fprintf("==================================\n")
[am_root bm_root] = pzmap(Qd)
am = poly(am_root)
bm = poly(bm_root)
r
s
t

fprintf("==================================\n")

%% ==================================
% A = tf(a,[1],Te,'Variable','z^-1');
% A_prim = (1-z^-1)*A

% ap = tfdata(A_prim,'v')

% Mp = [
% 	1		0 		0 		0		0
% 	ap(2)	1 		0 		0		0
% 	ap(3) 	ap(2)	b(1) 	0		0
% 	ap(4) 	ap(3) 	0 		b(1)	0
% 	0		ap(4)	0		0		b(1)
% 	];

% pp = [1 P(2:3) 0 0];
% xp = inv(Mp)*pp'

% sp = [1 xp(2)];
% rp = [xp(3:5)'];

% r = rp
% S = tf(sp,[1],Te,'Variable','z^-1')*(1-z^-1)
% s = tfdata(S,'v')