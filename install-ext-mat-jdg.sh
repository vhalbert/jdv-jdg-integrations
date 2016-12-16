export PATH=binaries/apache-ant-1.9.7/bin:$PATH
export ANT_HOME=binaries/apache-ant-1.9.7

if [ "x$1" = "x" ]; then
    echo "options to run  ./install-ext-mat-jdg.sh {option}"
    echo "where option is:"
    echo "   setup-jdg"
    echo "   start-jdg-server"
    echo "   setup-jdv or setup-usecase"
    echo "   start-jdv-server"
    exit
fi

ant $1 -propertyfile ./jdv-ext-mat-jdg/build.properties
