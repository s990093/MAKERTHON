#include "functions.h"

/// @brief
void setup()
{

    Serial.begin(9600);

    setupFunctions();
}

/// @brief
void loop()
{
    performTask();

    // 其他主程式的程式碼...
}
