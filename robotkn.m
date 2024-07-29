function [q, qd, qdd] = robotkn(position0, position1, step)
L1 = Link([0 120 150 pi/2 ],'standard');
L2 = Link([0 0 600 0 ],'standard');
L3 = Link([0 0 120 pi/2 ],'standard');
L4 = Link([0 720 0 -pi/2 ],'standard');
L5 = Link([0 0 0 pi/2 ],'standard');
L6 = Link([0 85 0 0 ],'standard');

L1.qlim = [deg2rad(-170) deg2rad(170)];
L2.qlim = [deg2rad(-70) deg2rad(70)];
L3.qlim = [deg2rad(-65) deg2rad(70)];
L4.qlim = [deg2rad(-150) deg2rad(150)];
L5.qlim = [deg2rad(-115) deg2rad(115)];
L6.qlim = [deg2rad(-300) deg2rad(300)];

robot = SerialLink([L1 L2 L3 L4 L5 L6 ]);

theta = robot.ikine(position0);   
theta1 = robot.ikine(position1);   

cchain = robot.trchain;
[q,qd,qdd] = jtraj(theta, theta1, step);  %jtraj已知初始和终止的关节角度，

end

