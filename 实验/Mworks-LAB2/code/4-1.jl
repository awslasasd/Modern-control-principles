clc()
clear()

# 定义极点和增益
z = []
p = [-1 -5 2]
k = 50

# 创建零极点增益模型
sys = zpk(z,p,k)

# 绘制系统的奈奎斯特图
nyquist(sys)

# 创建负反馈系统
sys1 = feedback(sys,-1)
flag = isstable(sys1) 
println(flag)

# 绘制系统脉冲响应
impulse(sys1)
