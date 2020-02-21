/*
 ============================================================================
 Name        : dec2base.c
 Author      : Yujing Yang(260827923)
 Version     : i can not count
 Copyright   : Your copyright notice
 Description : ECSE202 Assignment 5
 ============================================================================
 */
#include <stdio.h>
#include <stdlib.h>
 revStr(char *num_in, int length){
	char* num_out = (char*)(malloc(sizeof(char)*length));
	int i;

	// printf("Backwards number:\n"); //Number from the list of reminder,
	for(i = 0; i < length; i++){   //but it is backwards.
		num_out[length-1-i] = num_in[i];
	}

	for(i = 0; i < length; i++){  //This function reverse the digits of the previous number.
		//printf("")
		printf("%c", num_out[i]);
		//return num_out[i];
	}

	//printf("\nThe final number:");
	//printf("\n");
}

void dec2base(int input, int base, char *num_in){ //this function changes the base of the input number.
	int a = input;
	int b = base;
	int i = 0;
	int length = 0;

	// printf("List of the reminders left by dividing the base:\n");
	while(a > 0){
		int q =a/b;
		int r = a%b;
		length++;

		if(r < 10) //number 1~9
			num_in[i] = r + '0';
		else{
			num_in[i] = 'A' + r - 10; //for number > 9
		}

	//	printf("c = %c\n", num_in[i]);
		i++;
		a = q;
	}
	revStr(num_in, length);
}

int main(){
	int a;
	int b;

	printf( "\nEnter your integer variable :");
	scanf("%d", &a);

//	 if(a==0){
//		        //printf( "Enter your base :");
//		        //scanf("%d", &b); //input value of b
//	//	        if(b>1 && b<37){
//		            printf("The Base-%d form of %d is: 0\n", b, a);
//		            printf("%d", 0);
//	//	            return 0;
//	//	        }else
//	//	            printf("Error: base must be in the range [2,36]");
//	//	     return 0;
//		    }

//	printf( "Enter your base :");
//	scanf("%d", &b);

	if(a<0 || a > 2147483647)
		{
				printf("Error: number must be in the range of [0,2147483647]\n");
				//break;
				return 0;
		}
		printf( "Enter your base :");
		scanf("%d", &b);

	    if(a==0){
	        //printf( "Enter your base :");
	        //scanf("%d", &b); //input value of b
//	        if(b>1 && b<37){
	            printf("The Base-%d form of %d is: 0\n", b, a);
	            printf("%d", 0);
	            return 0;
//	        }else
//	            printf("Error: base must be in the range [2,36]");
//	     return 0;
	    }

		if(b<2 || b > 36)
		{
			printf("Error: base must be in the range [2,36]");
				return 0;
		}

	int n = 0;
	int backup_a = a;
	while(a > 0){
		int q = a/b;
		int r = a%b;
		a = q;
		n++;
	}
	a = backup_a; //backup a for dec2base function

	char* final_result = (char*)(malloc(n*sizeof(char)));
	printf("The Base-%d form of %d is :", b, a);
	dec2base(a,b,final_result);
	//printf("The Base-%d form of %d is :", b, a);
//	int i;
//	for(i = 0; i < n; i++)
	//	printf("%c", final_result[i]);
	printf("\nConversion completed!\n");

	return 0;
}
