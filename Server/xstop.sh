###### stop Server ######
cd /home/tlbb/Server && touch quitserver.cmd
echo " stopping Server ......"

until
[ "$?" = "1" ]
do
  ps aux | grep -i "./Server -loadscriptonce" | grep -v grep >/dev/null 2>&1
done
echo " Server stoped completely !!!!!!"

###### stop Login ######
LOGINPID=`ps aux | grep "./Login" | grep -v grep | awk '{print $2}'`
kill -9 $LOGINPID
echo " Login is stopping ......"

until
[ "$?" = "1" ]
do
  ps aux | grep -i "./Login" | grep -v grep >/dev/null 2>&1
done
echo " Login stoped completely !!!!!!"

###### stop World_fix ######
WORLDPID=`ps aux | grep -i "./World" | grep -v grep | awk '{print $2}'`
kill -9 $WORLDPID
echo " World is stopping ......"

until
[ "$?" = "1" ]
do
  ps aux | grep -i "./World" | grep -v grep >/dev/null 2>&1
done
echo " World stoped completely !!!!!!"

###### stop ShareMemory ######
cd /home/tlbb/Server/ && touch exit.cmd
echo " ShareMemroy is saving data ......"

until
[ "$?" = "1" ]
do
  ps aux | grep -i "./ShareMemory" | grep -v grep >/dev/null 2>&1 
done
echo " ShareMemory stoped completely !!!!!!"

###### transfer logs ######
#DIR=`date +%Y%m%d-%H%M`
#mkdir -p /home/tlbb/logbak/$DIR
#mv /home/tlbb/Server/Log/* /home/tlbb/logbak/$DIR
#echo " log transfer to "/home/tlbb/logbak/" completely !!!!!!"
