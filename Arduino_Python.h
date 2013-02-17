//==========================================================//
// Project Name :    Arduino_Python
// File Name :         Arduino_Python.h
// Date :                  2012/09/30
// Version :             0.01
// Programer :         Yuta Kitagami
// Description :
// Revision History :
//        2012/09/30 : New File
//==========================================================//


#include "Arduino.h"


int gRxbuf_cnt;

void Arduini_py_Init(void);
char Arduino_py_Command(char * RxBuf);

void Arduini_py_Init(void)
{
   gRxbuf_cnt = 0;
   //Serial.begin(9600);
   Serial.begin(115200);
}
//==========================================================//

char Arduino_py_Command(char * RxBuf)
{
  char tmp;

  if (Serial.available() > 0)
  {
    tmp = Serial.read();
    if(gRxbuf_cnt > 100)
      gRxbuf_cnt = 0;

    if( (tmp != '\n') && (tmp != '\r') )
    {
      RxBuf[gRxbuf_cnt]  = tmp;
      gRxbuf_cnt++;
      RxBuf[gRxbuf_cnt]  = '\0';
      return 0;
    }
    else
    {
      RxBuf[gRxbuf_cnt]  = '\0';
      gRxbuf_cnt = 0;
      Serial.write(RxBuf);
      if(strlen(RxBuf) >0)
        return strlen(RxBuf);
    }
  }
  return 0;
}
//==========================================================//
