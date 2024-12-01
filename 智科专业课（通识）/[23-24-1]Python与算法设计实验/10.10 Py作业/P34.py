s=input("输入一串字符：")
eng,num,space,other=0,0,0,0
for i in s:
    if 'a'<=i<='z' or 'A'<=i<='Z':
        eng+=1
    elif '0'<=i<='9':
        num+=1
    elif i==' ':
        space+=1
    else:
        other+=1
print("英文%d 数字%d 空格%d 其他%d"%(eng,num,space,other))