clc()
clear()

# 循环遍历k的值，从0到100
for k = 0.00:0.01:100.00

    # 定义分子和分母多项式系数
    global num = [1 1]
    global den = conv([1 2],[1 4 5])

    # 创建传递函数模型
    global sys = tf(num,den)

    # 计算增益为k倍的系统增益裕度和相位裕度
    global Gm,Pm,Wcg,Wcp = margin(k*sys,fig = false);
    if Pm[1] <= 45.0
        println("km的值为:$k")
        break;
    end
end