clc()
clear()

# 定义一个绘制阶跃响应的函数
function plot_step_response(num, den, figure_num, x_label, y_label, plot_title)
    figure(figure_num)
    sys = tf(num,den)
    step(sys)
    grid("on")
    hold("on")
    xlabel(x_label)
    ylabel(y_label)
    title(plot_title)
end

# 任务1: H(s) = 36 / (s^2 + 12ns + 36) 的单位阶跃响应
num1 = [0 0 36]
figure_num = 1
x_label = "t/s"
y_label = "Amplitude"
plot_title = "H(s) = 36 / (s^2 + 12ns + 36) 的单位阶跃响应"

for n = 0.1:0.1:1.0
    local den = [1 12*n 36]
    plot_step_response(num1, den, figure_num, x_label, y_label, plot_title)
end

# 额外添加 n=2 的情况
den = [1 24 36]; 
plot_step_response(num1, den, figure_num, x_label, y_label, plot_title);

# 任务2: H(s) = w^2 / (s^2 + 1.4wns + wn^2) 的单位阶跃响应
figure_num = 2
plot_title = "H(s) = w^2 / (s^2 + 1.4wns + wn^2) 的单位阶跃响应"

for n = 2:2:12
    local num2 = [0 0 n^2]
    local den = [1 1.4*n n^2] 
    plot_step_response(num2, den, figure_num, x_label, y_label, plot_title)
end
