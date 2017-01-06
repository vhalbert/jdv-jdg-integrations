export PATH=binaries/apache-ant-1.9.7/bin:$PATH
export ANT_HOME=binaries/apache-ant-1.9.7

if [ "x$1" = "x" ]; then
    echo "options to run  ./run_usecase.sh {usecase} {command}"
    echo "where "
    echo "   -  usecase is name of the use case to run.  The use case should correspond to a name of a folder."
    echo "   -  command is:"
    echo "   setup-jdg"
    echo "   start-jdg-server"
    echo "   stop-jdg-server"
    echo "   setup-jdv or setup-usecase"
    echo "   start-jdv-server"
    echo "   stop-jdv-server"
    exit
fi

if [ "x$2" = "x" ]; then
    echo "options to run  ./run_usecase.sh {usecase} {command}"
    echo "where "
    echo "   -  usecase is name of the use case to run.  The use case should correspond to a name of a folder."
    echo "   -  command is:"
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

ant $2 -Dqs-example=$1 -Dinstall-id=$1

