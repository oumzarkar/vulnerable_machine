#include<unistd.h>
void main()
{ setuid(0);
  setgid(0);
  system("cat /exam.txt");
 }
