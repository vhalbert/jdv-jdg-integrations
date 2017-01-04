
export JBOSS_HOME=$2
cd ${JBOSS_HOME}

echo "Install JDV Patch $1 into JBOSS_HOME $JBOSS_HOME"


java -jar $1 --server $2  --update jboss-dv

