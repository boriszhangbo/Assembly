; 2 - 类goto语句跳转指令
; 假设 我们要向 2000H：1000H这里开始填写 0123456789ABCDEF 这些字节型数据，应该怎么做？

;要执行相同的指令执行16次

;如何让CPU不断的执行这3条指令？
;	可以使用jmp
;	这里使用一个类似于C语言中的goto语句, 通过两者的结合完成任务

assume cs:codesg		; 让cs寄存器与codesg产生关联

codesg segment
		mov ax, 2000H
		mov ds, ax

		mov bx, 1000H
		mov dl, 0

setNumber:	mov ds:[bx], dl
		inc dl		; inc是自增运算符类似于 ++
		inc bx
	
		jmp setNumber	; 标号（内存地址）标识jmp

		mov ax, 4C00H
		int 21H
codesg ends

end
	
	
