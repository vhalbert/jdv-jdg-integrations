export PATH=binaries/apache-ant-1.9.7/bin:$PATH
export ANT_HOME=binaries/apache-ant-1.9.7

if [ "x$1" = "x" ]; then
    echo "options to run  ./install-jdg-datasource.sh {option}"
    echo "where option is:"
    echo "   setup-jdg"
    echo "   start-jdg-server"
    echo "   stop-jdg-server"
    echo "   setup-jdv or setup-usecase"
    echo "   start-jdv-server"
    echo "   stop-jdv-server"
    exit
fi

# qs-example maps to the use case directory
# install-id controls the target directory to install to, change if you want to keep a prior install

ant $1 -Dqs-example=jdv-ext-mat-jdg -Dinstall-id=jdv-ext-mat-jdg


