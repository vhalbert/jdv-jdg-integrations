echo ----------------------------------
echo
echo Applying patch $1 to the JDV server
echo
echo ----------------------------------


export JBOSS_HOME=$2

cd $JBOSS_HOME

java -jar $1 --server $2  --update jboss-dv

cd ../../..

echo ----------------------------------
echo
echo Applied patch
echo
echo ----------------------------------

