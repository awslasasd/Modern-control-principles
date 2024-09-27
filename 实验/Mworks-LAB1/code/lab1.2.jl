clc()
clear()

sys1 = tf(1,[1;1])
sys2 = tf(1,[1;2])
sys3 = tf([1],[1;3])
sys4 = tf([1],[1;4])
sys5 = tf([1],[1;5])
sys6 = tf(-1,[1])
sys7 = tf(1,[1])

# 化简方块图法
println("方块图化简法得传递函数： ")
sys8 = series(sys2,sys3)
sys9 = feedback(sys8,sys4)
sys10 = series(sys9,sys1)
sys11 = feedback(sys10,-sys5/sys3)
sys12 = feedback(sys11,1) # 传递函数模型
println(sys12)

# 直接利用connect()函数求解
println("直接求解得传递函数： ")
blksys = append(sys1,sys2,sys3,sys4,sys5,sys6,sys7)
connections = [1 7 5;2 1 -4;3 2 0;4 3 0;5 2 0;6 3 0;7 6 0]
inputv = [7]
outputv = [3]
sys_c = connect(ss(blksys),connections,inputv,outputv)
sys_tf = tf(sys_c)