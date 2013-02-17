#include "Arduino_python.h"
#include "string.h"

// the setup routine runs once when you press reset:
void setup() {
  Arduini_py_Init();

}


#define _Read_MAX_CHAR_ 50
// the loop routine runs over and over again forever:
void loop() {
  int tmp = 0;
  int strlen;
  char Cbuf[_Read_MAX_CHAR_];
  char Cbuf2[_Read_MAX_CHAR_];
  char *fs;
  char *sc;
  char *th;
  strlen = Arduino_py_Command(Cbuf);

  if(strlen >0)
  {
    strcpy(Cbuf2, Cbuf);
    //Serial.print(Cbuf);
    fs = strtok(Cbuf2,",");
    sc = strtok(NULL,",");
    th = strtok(NULL,",");

    tone(atoi(fs),atoi(sc),atoi(th));
    //tone(12,0,atoi(th));
 }

}
