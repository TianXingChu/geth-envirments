@echo off
setlocal
set yourDir=%0/../data/ethereum/keystore
pushd %yourDir%
for %%a in (*) do set fileName=%%a
popd

set address=%fileName:~37,40%
echo your wallet address is 0x%address%

@echo on
geth --mine^
 --rpc^
 --unlock 0x%address%^
 --password %0/../password^
 --rpccorsdomain "*"^
 --minerthreads=1^
 --etherbase=0x%address%^
 --networkid 1^
 --bootnodes enode://f3ce7e40bfa87ebb3d740bf9e6f251aeba101f920ed50c30b4f91eaeeff65ba13d9766b7495f08b11e8aa5e2b9795309c13b0cedd7b5bcfbd1a2b47feac09b4e@121.199.5.97:30303^
 --nodekey %0/../data/ethereum/node.key^
 --datadir %0/../data/ethereum^
 --ethash.dagdir %0/../data/ethash^
 console 2>> %0/../data/ethereum/eth.log
