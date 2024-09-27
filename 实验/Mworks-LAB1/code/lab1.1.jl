clc()
clear()

# 定义状态空间方程
a = [-2.8 -1.4 0 0;
     1.4 0 0 0;
     -1.8 -0.3 -1.4 -0.6;
     0 0 0.6 0]
b = [1.0; 0; 1.0; 0]
c = [0 0 0 1.0]
d = 0

# 利用ss函数
println("传递函数模型： ")
G1 = ss(a,b,c,d)
sys_tf = tf(G1)
println(sys_tf)
println("零极点模型： ")
sys_z = zpk(sys_tf)
println(sys_z)
rlocus(sys_tf)

# 利用sst2f函数(存在缺陷)
# 计算传递函数的分子和分母
num, den = ss2tf(a, b, c, d, 1)

# 指定保留的小数位数
digits=4

# 对分子和分母进行保留小数处理
num = round.(num;digits)
den = round.(den;digits)

# 计算零点、极点和增益
z, p, k = tf2zp(num, den)

# 对零点、极点和增益保留小数
z = round.(z;digits)
p = round.(p;digits)
k_scalar = round(k[1];digits)

# 创建传递函数模型和零极点增益模型
sys_tf = tf(num, den, -1)
sys_zpk = zpk(z, p, k_scalar, -1)

# 判断系统稳定性
stable = true
for pole in p
    if real(pole) >= 0  # 离散系统的极点判断
        stable = false
        break
    end
end

println("传递函数模型： ")
println(sys_tf)
println("零极点模型： ")
println(sys_zpk)

if stable
    println("系统是稳定的")
else
    println("系统是不稳定的")
end
