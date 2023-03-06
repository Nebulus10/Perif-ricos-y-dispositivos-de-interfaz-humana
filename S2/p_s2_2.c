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



int main(){

		selecciona_modo_video(3);
}
