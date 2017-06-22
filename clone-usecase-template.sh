export PATH=binaries/apache-ant-1.9.7/bin:$PATH
export ANT_HOME=binaries/apache-ant-1.9.7

#  script used to setup a use case by cloning the template usecase 

if [ "x$1" = "x" ]; then
    echo "This script is used to setup a new use case by cloning an existing usecase"
    echo "  "
    echo "options to run  ./clone-usecase-template.sh {new usecase} [existing usecase]"
    echo "where new usecase is name of the usecase to create"
    echo "                    and will create a corresponding directory"
    echo "      existing usecase is the one to copy, if left blank, usecase_template will be copied"	

    exit
fi

TEMPLATE=usecase_template

if [ ! "x$2" = "x" ]; then
	TEMPLATE=$2    
fi

echo "Cloning usecase: $TEMPLATE to create $1"

ant clone-template -Dnew-usecase=$1  -Dqs-example=$TEMPLATE

