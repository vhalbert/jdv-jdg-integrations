export PATH=binaries/apache-ant-1.9.7/bin:$PATH
export ANT_HOME=binaries/apache-ant-1.9.7
ant $1 -propertyfile ./jdv-ext-mat-jdg/build.properties
