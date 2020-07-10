; 3 - LOOP指令
; 假设 我们要向 2000H：1000H这里开始填写 0123456789ABCDEF 这些字节型数据，应该怎么做？

;要执行相同的指令执行16次

;如何让CPU不断的执行这3条指令？
;	可以使用jmp
;	这里使用一个类似于C语言中的goto语句, 通过两者的结合完成任务

; LOOP指令：
;	LOOP指令 - 循环指令(jmp到)，按照次数来跳转
;	跳转的次数保存在CS寄存器中

;LOOP指令的 2 个步骤
;	1. CX = CX - 1
;	2. 判断CX中的值，不为0则跳转到(jmp)到标号（内存地址）位置继续执行，不等于0则执行下面的命令

assume cs:codesg

codesg segment
		mov ax, 2000H
		mov ds, ax
		mov cx, 16	; LOOP 中的值储存在 CX 中
		mov dl, 0
		mov bx, 1000H
	
setNumber:	mov ds:[bx], dl
		inc dl
		inc bx
		
		LOOP setNumber	;标号 - 内存地址
		
codesg ends

end

; 使用 -p指令执行可以直接执行完loop指令
; 使用 -g + 内存地址，指令可以执行到内存地址那里的指令，前面的指令会被全被执行
