import random as r
a=r.randint(1,6)
flag=False
for i in range(3):
    b=int(input("猜猜这个数："))
    if b==a:
        print("正确")
        flag=True
        break
    elif b>a:
        print("偏大")
    elif b<a:
        print("偏小")
if not flag:
    print("机会用完了，正确答案是%d！"%a)