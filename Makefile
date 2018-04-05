# 这是erl的makefile文件

.SUFFIXES: .erl .beam .yrl

.erl.beam:
	erlc -W $<

.yrl.erl:
	erlc -W $<

ERL = erl -boot start_clean

# 这里是一个想要编译的Erlang模块列表。 
# 如果这些模块在一行里放不下，
# 就在行尾添加一个 \ 字符然后在下一行继续。 

MODS = module1 module2 module3 \
	   module4 ... special1 ..\
	   ...\
	   moduleN

# 如果只输入了"make"，系统就会假定为"make all"。 
# （因为"all"是这个makefile里的第一个目标） 
# 任何makefile里的第一个目标就是默认的目标。 

all : compile

compile: ${MODS:%=%.beam} subdirs


## 此处添加特殊的编译要求

special1.beam: special1.erl
	${ERL} -Dflag1 -W0 special1.erl

## 从makefile里运行应用程序 
application1: compile
	${ERL} -pa Dir1 -s application1 start Arg1 Arg2

## subdir目标会编译子目录里的代码 
subdirs:
	cd dir1; $(MAKE)
	cd dir2; $(MAKE)
	...

## 移除所有的代码
clean: 
	rm -rf *.beam erl_crash.dump
	cd dir1; $(MAKE) clean
	cd dir2; $(MAKE) clean

