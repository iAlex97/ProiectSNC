res = open("B70_rst_1.mat");

figure(1)
hold on;
plot(res.IOdata.time, res.IOdata.signals(1).values)
plot(res.IOdata.time, res.IOdata.signals(2).values)
plot(res.IOdata.time, res.IOdata.signals(3).values)
hold off;
legend('u(t)', 'y(t)', 'r(t)')

res = open("B70_rst_2.mat");

n = 210;

figure(2)
hold on;
plot(res.IOdata.time(1:n), res.IOdata.signals(1).values(1:n))
plot(res.IOdata.time(1:n), res.IOdata.signals(2).values(1:n))
plot(res.IOdata.time(1:n), res.IOdata.signals(3).values(1:n))
hold off;

legend('u(t)', 'y(t)', 'r(t)')