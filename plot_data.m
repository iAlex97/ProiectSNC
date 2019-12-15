res = open("b76_bun_RST.mat");

hold on;
plot(res.IOdata.time, res.IOdata.signals(1).values)
plot(res.IOdata.time, res.IOdata.signals(2).values)
plot(res.IOdata.time, res.IOdata.signals(3).values)
hold off;