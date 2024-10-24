clc()
clear()

# 定义分子分母的多项式系数
num = [0.632]
den = [1 -1.368 0.568]

# 定义采样时间
Ts = 0.001

# 创建离散传递函数
sys = tf(num,den,Ts) 

# 方波参数定义
 tau = 2 #方波周期
 Tf = 6 #总时间
 Ts = 0.001 #采样时间

 # 生成方波信号
 u0,t = gensig(:square,tau,Tf=Tf,Ts=Ts)

# 调整方波范围到[-1,1] 
u = 2*u0 .- 1 
lsim(sys,u,t)    
println(sys)

