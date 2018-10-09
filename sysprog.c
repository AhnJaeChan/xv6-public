#include "types.h"
#include "user.h"

int main(){
	char* argv[3];
	argv[0] = "echo";
	argv[1] = "hello!";
	argv[2] = 0;

	printf(1,"hello world!\n");
	exec("echo",argv);
	exit();
}

