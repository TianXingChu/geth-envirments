BASEDIR=$(dirname "$0")
for file in `ls $BASEDIR/data/ethereum/keystore`
do
  address=${file##*--}
done

if [ -z "$address" ]
then
  echo "your wallet address is not exists"
  exit 1
fi

echo "your wallet address is 0x$address"

geth --mine^
 --rpc^
 --unlock 0x%address%^
 --password $BASEDIR/password^
 --rpccorsdomain "*"^
 --minerthreads=1^
 --etherbase=0x%address%^
 --networkid 1^
 --bootnodes enode://f3ce7e40bfa87ebb3d740bf9e6f251aeba101f920ed50c30b4f91eaeeff65ba13d9766b7495f08b11e8aa5e2b9795309c13b0cedd7b5bcfbd1a2b47feac09b4e@121.199.5.97:30303^
 --nodekey $BASEDIR/data/ethereum/node.key^
 --datadir $BASEDIR/data/ethereum^
 --ethash.dagdir $BASEDIR/data/ethash^
 console 2>> $BASEDIR/data/ethereum/eth.log
