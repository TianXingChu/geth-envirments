@echo off
set /p confirmed= "purge ALL your data including wallet PRIVATE-KEY, are you sure?(Y/N): "
IF "%confirmed%" NEQ "Y" (
  Exit /b
)
@RD /S /Q "%0/../data"

@echo on
geth account new^
 --datadir %0/../data/ethereum^
 --password %0/../password^
 %0/../genesis.json

geth --datadir %0/../data/ethereum^
 --ethash.dagdir %0/../data/ethash^
 init^
 %0/../genesis.json

bootnode -genkey %0/../data/ethereum/node.key
@echo off
set /p confirmed= "DONE, press any key to continue"
