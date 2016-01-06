--[[
print(b)
b=10
print(b)
b=nil
print(b)
--]]
--单行注释
--[[多行注释
--]]
b="string"
print(type("Hello World"))
--C中的int float double在Lua中都是number类型
print(type(13))
print(type(23.5))
print(type(24.356789))
print(type(true))
print(type(print))
print(type(type))
--变量没有预定义类型，可以任意类型赋值
a=10
print(a)
a="Hello World"
print(a)
a=true
print(a)
--lua中只有false和nil为假，其他都为真
--lua中字符串是不可以修改的
a="one String"
b=string.gsub(a,"one","two")--把a中的one改成two
print(b)--two String
print("\"Hello\"")
--lua字符串遇到运算符，自动把字符转换成number
print("10"+1)--11
print("2"*4)--8
print("10+1")--10+1
--..:连接
print("Hello " .. "World")--Hello World
print(34 .. 45)--3445
--tonumber()和tostring
a=10
print(type(tostring(a)))
--逻辑运算符 and
--a and b 如果a为false返回a，否则返回b
print(4 and 5)--5
print(nil and 5)--nil
print(false and 5)--false
--逻辑运算符 or
--a or b 如果a为true返回a，否则返回b
print(4 or 5)--4
print(false or 40)--40

--语句
--多个赋值
--多个变量直接赋值用逗号分隔
b,c=1,2
print(b)--1
print(c)--2

--lua中先进行等号右边的计算，在进行=赋值
--两个值进行交换
a,b=10,20
a,b=b,a
print(a)--20
print(b)--10

--当赋值个数不一致时(不够用nil来补，多了忽略)
a,b,c=1,2
print(a)--1
print(b)--2
print(c)--nil

a,b,c=1,2,3,4,5
print(a)--1
print(b)--2
print(c)--3

--声明局部变量local
m=10
if m>5 then
	local k = 1
	print(k)--1
end
print(k)--nil

--if
m=1
if m>2 then
	print(m)--不执行
end

if m<2 then
	print("mmmmm")--mmmmm
end
--elseif
m=10
if m==5 then
	print(5)
elseif m==8 then
	print(8)
elseif m==10 then
	print(10)--10
else
	print("...")
end

--for
for m=6,1,-2 do--相当于for（m=6,m>=1,m=m-2）
	print(m)--6,4,2
end

--while
m=5  
while m>1 do
print(m)--5,4,3,2
m=m-1
end 

--Function
function funcName()
	print("Hello World")
end
--调用函数
funcName();

--定义函数（返回大）
function maxNumber(a,b)	
	if a>b then
		return a
	else
		return b
	end
end

print(maxNumber(100,200))--200
max=maxNumber(100,200)
print(max)--200

--计算和
function  AddFunc(m,k)
	return m+k;
end

local  add= AddFunc(10,20)
print(add)--30

--实参个数大于形参个数，默认被忽略，实参个数小于形参个数，默认用nil补
function  f1(a,b,c)
	print(a)--12
	print(b)--13
	print(c)--nil
end
f1(12,13)

--lua中一个函数可以返回多个值
function f2()
	return 1,2,3
end

a,b,c=f2()
print(a)--1
print(b)--2
print(c)--3


--函数返回后位于最后一个，那么返回全部值。否则，只会返回一个值
a,b,c,d=100,f2()
print(a,b,c,d)--100,1,2,3
a,b,c,d=f2(),100
print(a,b,c,d)--1,100,nil,nil 函数f2只返回了一个值


--table
b={}  --创建一个空表
print(b.name)

days={"Mon","Tue","Wed","Ths"}  --创建一个非空表
print(days[0])--nil
print(days[1])--Mon  下标从一开始
days[4]="周四"--修改
print(days[4])--周四
days[10]="aaa"
print(days[10])--aaa

--table
person={name="张巧",age=21,gender="女"}
print(person.name)--张巧（第一种访问形式）
print(person["name"])--张巧（第二种访问形式）

print(person.age)
print(person["age"])

person.gender="男"
print(person.gender)

--pairs：遍历表中所有元素
for k,v in pairs(person) do
	print(k,v)
end

--ipairs：寻找key为1的字段，依次增加
person1={[2]="b",[4]="d",name="realy",[1]="a"}
for i,v in ipairs(person1) do
	print(i,v)
end

--用来计算表中长度
print(table.maxn(person))
print(#person)



--class的内部实现
function class( classname,super )
	local superType = type(super)
	local cls
	if superType~="function" and superType~="table" then
		superType=nil
		super=nil
	end
	--用lua语言初始化
	if super then
		cls={}
		setmetatable(cls, {__index=super})
		cls.super=super
	else
		cls={ctor=function (  )
		end}
	end

	cls.__cname=classname
	cls.__ctype=2--lua
	cls.__index=cls

	function cls.new( ... )
		local instance = setmetatable({}, cls)
		instance.class=cls
		instance:ctor(...)
		return instance
	end
end





























