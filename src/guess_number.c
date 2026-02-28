#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char* argv[]) {
    printf("1 до ?\n");
    int range = 10;
    int c = scanf("%d", &range);
    int guess = 5;

    srand(time(NULL));
    if(c > 0) {
    	guess = rand()%(range+1);
    }
    int a;
    printf("%d\n", guess);
    printf("Угадай число\n");
        
    scanf("%d", &a);
    while(a!=guess) {
	if(a > guess) {
		printf("Число меньше %d\n", a);
	} else {
		printf("Число больше %d\n", a);			
	}
	scanf("%d", &a);
    }
    printf("Угадал!\n");
    
    return 0;
}
