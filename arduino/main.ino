#include "functions.h"

void setup()
{

    Serial.begin(9600);

    setupFunctions();
}

void loop()
{
    performTask();

    // 其他主程式的程式碼...
}
