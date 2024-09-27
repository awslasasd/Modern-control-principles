clear()
clc()

# 创建传递函数模型sys1
num1 = [10 80 200]
den1 = [1 4 0]
sys1 = tf(num1,den1)

# 创建传递函数模型sys2
num2 = [0.2]
den2 = [1 2]
sys2 = tf(num2,den2)

# 绘制系统sys的根轨迹图
sys = sys1 * sys2
rlocus(sys)
sgrid("on")

# 在根轨迹图上绘制指定阻尼比的直线
zeta = 0.450:0.01:0.577
wn = [ ]
sgrid(zeta,wn)

# 计算A的值
a = -1.67424 + 2.4463im
k = abs( a*(a + 2)*(a + 4)/(a^2 + 8*a + 20)/2)
println("A的值: ",k)

# 闭环传递函数的零极点模型
sys3 = feedback(sys1,sys2)
println("闭环传递函数零极点模型: ")
zp = zpk(sys3)
println(zp)