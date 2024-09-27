clc()
clear()

# 定义传递函数
num = [0 0 1]
den = [1 1 1]
G1 = tf(num,den)

# 绘制阶跃响应
figure(1)
step(G1)
grid("on")
title("G(s)= 1/(s^2+s+1)的单位阶跃响应")

# 计算响应信息
global Mp = stepinfo(G1; RiseTimeLims = [0 1.0], SettlingTimeThreshold = 0.03)

# 系统参数
omega_n = 1;
zeta = 0.5;

# 计算与响应时间相关的公式
beta = atan(sqrt(1-zeta^2)/zeta)
Tr = (pi-beta)/omega_n/sqrt(1-zeta^2) # 理论上升时间
sigma = exp(-zeta*pi/sqrt(1-zeta^2))  # 超调百分比
Tp = pi/omega_n/sqrt(1-zeta^2)        # 峰值时间
Ts = 3/omega_n/zeta                   # 稳态时间

# 输出结果
println("函数计算结果： ")
println("上升时间: ")
println(Mp.RiseTime[1])
println("超调量: ")
println(Mp.Overshoot[1]/100)
println("峰值时间：")
println(Mp.PeakTime[1])
println("稳态时间: ")
println(Mp.SettlingTime[1])
println(" ")
println("公式计算结果： ")
println("上升时间: ")
println(Tr)
println("超调量: ")
println(sigma)
println("峰值时间：")
println(Tp)
println("稳态时间: ")
println(Ts)