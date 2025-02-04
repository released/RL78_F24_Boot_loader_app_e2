::.\srec_cat.exe  ..\RL78_F24_Boot_loader_UART\DefaultBuild\boot0000_4FFF.hex -Intel .\DefaultBuild\flash5000_3FFFF.hex -Intel -o .\boot_flash.hex -Intel -Output_Block_Size=16

:: save app code hex to back hex file
..\srec_cat.exe @..\1backupHex.cmd

:: base on app code hex , generate CRC
..\srec_cat.exe @..\2generateChecksum.cmd

:: base on app code hex (w/ CRC) , generate CRC into hex
..\srec_cat.exe @..\3generateCRCHex.cmd

:: covert app code hex (w/ CRC) to app code bin
..\srec_cat.exe @..\4generateCRCBin.cmd

:: base on app code hex (w/ CRC) , to over lap original hex
..\srec_cat.exe @..\5generateCRCHexOverlap.cmd

:: combine boot code and app code
..\srec_cat.exe @..\6generateBootAppHex.cmd

:: covert boot/app code hex (w/ CRC) to boot/app code bin
..\srec_cat.exe @..\7generateBootAppBin.cmd

