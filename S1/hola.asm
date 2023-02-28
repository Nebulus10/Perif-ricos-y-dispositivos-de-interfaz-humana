pila segment stack 'stack'
	dw 100h dup (?)
pila ends
datos segment 'data'
	msg db 'hola $'
datos ends
codigo segment 'code'
	assume cs:codigo, ds:datos, ss:pila
	main PROC
		mov ax,datos
		mov ds,ax
		
		mov cx,1 
		;Este es el registro cx que se usa para incrementar la variable contador
		bucle:
			mov dx,OFFSET msg
			mov ah,9
			int 21h 
			;actualizar contador y comprobar condicion
			inc cx
			cmp cx,7 
			;numero de veces que se va a repetir el bucle
			jne bucle
			
		
		mov ah,9
		int 21h

		mov ax,4C00h
		int 21h
	main ENDP
codigo ends

END main
