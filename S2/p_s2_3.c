#include <dos.h>
#define BYTE unsigned char
int int86(int intno, union REGS *inregs, union REGS *outregs);
/* Selecciona el modo de video deseado */

void selecciona_modo_video(BYTE modo){
 union REGS inregs, outregs;
 inregs.h.ah = 0x00;
 inregs.h.al = modo;
 int86(0x10,&inregs,&outregs);
 return;
}

int mi_getchar(){

	union REGS inregs, outregs;
	int caracter;
	inregs.h.ah = 1;
	int86(0x21, &inregs, &outregs);
	caracter = outregs.h.al;
	return caracter;
}

int mi_putchar(char c){

	union REGS inregs, outregs;
	inregs.h.ah = 2;
	inregs.h.dl = c;
	
	int86(0x21, &inregs, &outregs);
}

int main(){

	int tmp;
	int i;
	for(i = 0; i < 3; i++){
	
		printf("\nPulsa una tecla: ");
		tmp = mi_getchar();
		printf("\nHas escrito la tecla: ");
		mi_putchar(tmp);
	}
	return 0;

}



