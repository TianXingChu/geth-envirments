read -p "purge ALL your data including wallet PRIVATE-KEY, are you sure?(Y/N): " confirmed
if [ $confirmed != "Y" ]
then
  exit 1
fi

BASEDIR=$(dirname "$0")
rm -rf $BASEDIR

geth account new^
 --datadir $BASEDIR/data/ethereum^
 --password $BASEDIR/password^
$BASEDIR/genesis.json

geth --datadir $BASEDIR/data/ethereum^
 --ethash.dagdir $BASEDIR/data/ethash^
 init^
 %0/genesis.json

bootnode -genkey $BASEDIR/data/ethereum/node.key
read -p "DONE, press any key to continue" confirmed
