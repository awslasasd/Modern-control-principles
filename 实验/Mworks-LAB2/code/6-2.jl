clear()
clc()
# 定义矩阵
A = [1 0 0;0 2 1;0 0 2]
B = [1;0;1]
C = [1 1 0]
D = [0]

M = ctrb(A,B);
if rank(M) < size(A,1)
    println("系统不完全能控")
else
    
    # 计算当前系统的多项式
    pA = poly(A)
    println("pA is : $pA")

# 定义目标多项式
s1 = [1 3]
s2 = [1 4]
s3 = [1 5]
dest = conv(conv(s1,s2),s3)
println("dest is :$dest")
# 构造L矩阵
L = [pA[3] pA[2] 1;pA[2] 1 0; 1 0 0]
println("L is :$L")

#计算可观测性矩阵
Q_o = [C;C*A;C*A^2]

# To_inv = L*Qo,计算矩阵的逆
T_Cinv = L*Q_o
println("T_C is:$T_Cinv")
T_c = inv(T_Cinv)
println("T_cinv is :$T_c")

# 计算Ho矩阵
t = dest - pA
t = t'
println("t is :$t")
Ho = t[end:-1:2]
println("Ho is :$Ho")

# 计算H矩阵
H = T_c*Ho
println("H is :$H")
# 计算新的A_e矩阵
A_e = A - H*C
println("A_e is :$A_e")
end


# 利用系统函数
clear()
clc()
# 定义矩阵
A = [1 0 0;0 2 1;0 0 2]
B = [1;0;1]
C = [1 1 0]
D = [0]
p = [-3,-4,-5]

# 计算极点配置反馈增益矩阵 k 
k = place(A',C',p)

# 使用k'估计系统
G1 = ss(A,B,C,D)
est = estim(G1,k[1]')

println("k = ",k)
println(est)