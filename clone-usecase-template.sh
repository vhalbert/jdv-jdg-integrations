export PATH=binaries/apache-ant-1.9.7/bin:$PATH
export ANT_HOME=binaries/apache-ant-1.9.7

#  script used to setup a use case by cloning the template usecase 

if [ "x$1" = "x" ]; then
    echo "This script is used to setup a new use case by cloning the template usecase"
    echo "  "
    echo "options to run  ./clone-usecase-template.sh {usecase}"
    echo "where usecase is name of the usecase to create"
    echo "      and will create a corresponding directory"

    exit
fi


ant clone-template -Dnew-usecase=$1  -Dqs-example=usecase_template

