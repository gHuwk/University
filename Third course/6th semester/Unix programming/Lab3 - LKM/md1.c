#include <linux/module.h> 
#include <linux/kernel.h> 
#include <linux/init.h> 

MODULE_LICENSE( "GPL" ); 
MODULE_AUTHOR( "Hasanzade M.A" ); 

char* md1_str_data = "Hello world!";
int md1_int_data = 42;

extern char* md1_get_str(int n) { 
	printk( "+ md1: md1_get_str() called!\n" ); 
	switch (n){
	case 1:
		return "Hello world!\n";
		break;
	case 2:
		return "Привет Мир!\n";
		break;
	default:
		return "Передайте 1 для получения английского сообщения или 2 для получения русского.\n";
		break;
	}
} 

extern int md1_factorial(int n) { 
	int i, ans;
	ans = 1;
	printk( "+ md1: md1_factorial() called!\n" ); 
	for (i = 2; i <= n; i++) ans *= i;
	return ans;
}

extern int md1_return_zero(void){
	printk( "+ md1: md1_return_zero() called!\n" );
    	return 0;
}

EXPORT_SYMBOL(md1_str_data); 
EXPORT_SYMBOL(md1_int_data); 

EXPORT_SYMBOL(md1_get_str); 
EXPORT_SYMBOL(md1_factorial); 
EXPORT_SYMBOL(md1_return_zero); 

static int __init md1_init( void ) { 
   	printk( "+ md1: Module md1 is loaded!\n" ); 
   	return 0; 
}

static void __exit md1_exit( void ) { 
   printk( "+ md1: Module md1 is unloaded!\n" ); 
} 

module_init( md1_init ); 
module_exit( md1_exit ); 
