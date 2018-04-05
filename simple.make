# 这是erl的makefile文件

.SUFFIXES: .erl .beam .yrl

.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS = module1 module2 module3
	   

# 如果只输入了"make"，系统就会假定为"make all"。 
# （因为"all"是这个makefile里的第一个目标） 
# 任何makefile里的第一个目标就是默认的目标。 

all : compile ${ERL} -pa '/home/joe/.../this/dir' -s module1 start

compile: ${MODS:%=%.beam}


clean: 
	rm -rf *.beam erl_crash.dump
