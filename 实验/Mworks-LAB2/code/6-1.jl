#能控标准型法

clear()
clc()
#定义矩阵和向量
a = [-2 -3;4 -9]
b = [3;1]

#计算可控性矩阵 M
M = ctrb(a,b)
println("矩阵的秩：$M")

#判断系统是否完全能控
if rank(M) < size(a,1)
    println("系统不完全能控")
else
    println("系统完全能控")
    #定义极点
    s1 = [1 1-2im]
    s2 = [1 1+2im]
    dest = conv(s1,s2)#目标多项式
    println("dest is : $dest")

    #求多项式系数
    pa = poly(a)
    println("pa is :$pa")

    #矩阵L
    L = [pa[2] 1;1 0]
    println("L is :$L")

    #控制能观性矩阵Qc
    Qc = [b a*b]

    #计算T矩阵
    T = Qc * L

    #计算T向量
    t = dest - pa 
    println("t is:$t")
    t = t'
    println("t' is:$t")

    #从t矩阵提取反馈增益向量Kc
    Kc = t[:,end:-1:2]

    #计算反馈增益矩阵K
    K = Kc*inv(T)

    println("K = ",K)
end

# 利用系统函数
a = [-2 -3;4 -9];
b = [3 1]';
p = [-1+2im;-1-2im];

#计算可控性矩阵 M
M = ctrb(a,b)

#判断系统是否完全能控
if rank(M) < size(a,1)
    println("系统不完全能控")
else
    println("系统完全能控")
    k = acker(a,b,p)
    m = place(a,b,p)
    display(m)
end


      
