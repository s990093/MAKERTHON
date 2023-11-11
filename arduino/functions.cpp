#include "functions.h"
#include <Arduino.h>

/// @brief
void setupFunctions()
{
    // 在這裡執行初始化任務
    Serial.begin(9600);
    // 其他初始化...
}

/// @brief
void performTask()
{
    // 在這裡執行您的任務
    Serial.println("Performing task...");
    // 其他執行任務的程式碼...
}
