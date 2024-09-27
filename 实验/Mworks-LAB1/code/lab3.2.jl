clear()
clc()

# 计算阻尼比
zeta = sqrt(log(0.0948)^2 / (log(0.0948)^2 + pi^2))
println("ζ： ", zeta)

# 定义系统1和系统2的分子和分母多项式系数
num1 = [1, 6, 13]
den1 = [1, 3, 0]
num2 = [1]
den2 = [1, 1]

# 创建传递函数模型并串联
sys = series(tf(num1, den1), tf(num2, den2))
# 绘制根轨迹图
rlocus(sys)
# 在根轨迹图上绘制指定阻尼比的直线
sgrid([zeta], [])

# 由上根轨迹得到复数a和b
a = -0.535103 + 0.684426im
b = -2.27861 + 3.01986im

# 计算k1和k2
k1 = abs(a * (a + 1) * (a + 3) / (a^2 + 6 * a + 13))
k2 = abs(b * (b + 1) * (b + 3) / (b^2 + 6 * b + 13))
println("k1: ",k1)
println("k2: ",k2)

# 定义调整后的系统3和系统4的分子和分母多项式系数
num3 = k1 * [1, 6, 13]
den3 = [1, 3, 0]
num4 = k2 * [1, 6, 13]
den4 = [1, 3, 0]

# 创建闭环系统模型
sys2 = feedback(tf(num3, den3), tf(num2, den2))
sys3 = feedback(tf(num4, den4), tf(num2, den2))

# 打印闭环传递函数的零极点模型
println("闭环传递函数零极点模型 sys2: ")
println(zpk(sys2))
println("闭环传递函数零极点模型 sys3: ")
println(zpk(sys3))