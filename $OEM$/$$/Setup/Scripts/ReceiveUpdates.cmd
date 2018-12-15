@echo off

powershell -ExecutionPolicy ByPass -Command "$ms = New-Object -ComObject Microsoft.Update.ServiceManager; $ms.AddService2('7971f918-a847-4430-9279-4a52d1efe18d',7,'')"
timeout 3 > nul
