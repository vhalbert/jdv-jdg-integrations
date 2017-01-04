## JDV - JDG Integrations

This repository contains the following quick starts for the various JDG integrations:

*  jdv-ext-mat-jdg : JDV External Materialization into JDG Cache
*  jdv-datasource-jdg  : JDV Access Remote JDG Cache as a Data Source

This repo is put together to help automate/speed up bulk of the setup effort in configuring JDG and JDV to demonstrate these use cases.

### Prerequisites

* [Java JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html), preferably 1.8 
* **JAVA_HOME** environment variable set
* **JAVA_HOME\bin** is on the PATH
* For binaries see [binaries] (binaries/README.md) for download locations and filename/versions.
* For patches see [patches] (patches/README.md) for any patches that maybe needed
* Familiarity with Apache Ant

### Executing a command

The execution of any command will be based on which use case you're looking to install.

```sh
# Execute for jdv-ext-mat-jdg use case
./install-ext-mat-jdg.sh {command}

# Execute for jdg-datasource-jdg use case
./install-jdg-datasource.sh {command}
```

```sh
# To see all the available commands run the script with no arguments.
```

**Commands for JDG** 
setup-jdg
start-jdg-server
stop-jdg-server

**Commands for JDV**
setup-jdg or setup-usecase
start-jdg-server
stop-jdg-server


### Running the setup

#### Setup JBoss Data Grid

Use the following two commands to setup and start the JDG server. Going forward we will refer to the folder `target/{usecase}/jdg/jboss-datagrid-6.6.0-server/` as **$JDG_HOME**

The setup of JDG will install JDG server and then configure the following caches: 
* datasource_cache
* primary_cache
* staging_cache
* alias_cache

```sh
# Kick off JDG setup and wait for it to complete
./install-ext-mat-jdg setup-jdg
or
./install-jdg-datasource.sh setup-jdg


# Once complete, start the JDG server
./install-ext-mat-jdg start-jdg-server
or
./install-jdg-datasource.sh start-jdg-server
```


#### Setup JBoss Data Virtualization

There are 2 options for how JDV can be setup; 
1) ready to perform your own use case 
2) configured with an example usecase, ready to test.

Use one of the following commands to setup the JDV server. Going forward we will refer to the folder `target/{usecase}/jdv/jboss-eap-6.4/` as **$JDV_HOME**

To setup JDV and to also install the hot rod client, run:

```sh
# 1) Kick off JDV setup
./install-ext-mat-jdg setup-jdv 
or
./install-jdg-datasource.sh setup-jdv
```

To setup JDV, that does everthing setup-jdv does, but also configures a resource-adapter to connect to JDG, deploys the pojo, updates the infinispan-dsl resource-adapter module pojo dependency and deploys the Portfolio and PeopleMat VDB's., run the following:

```sh
# 2) Kick off JDG and JDG materialization usecase setup
./install-ext-mat-jdg setup-usecase 
or 
./install-jdg-datasource setup-usecase
```

#### Starting and Stopping JDG and JDV

```sh
# To start and stop JDG
./install-ext-mat-jdg start-jdg-server
./install-ext-mat-jdg stop-jdg-server
or
./install-jdg-datasource.sh start-jdg-server
./install-jdg-datasource.sh stop-jdg-server
```

```sh
# To start and stop JDV
./install-ext-mat-jdg start-jdv-server
./install-ext-mat-jdg stop-jdv-server
or
./install-jdg-datasource.sh start-jdv-server
./install-jdg-datasource.sh stop-jdv-server
```


#### Important Note
> The password for all accounts on the JDV runtime is `redhat1!`. Refer to **dv-6.3.0-installation-config**.

## Use Cases

If you chose to use the 'setup-usecase' option when running the installation, the following describes how to access those vdb'.s

### JDV-EXT-MAT-JDG Use Case

If the jdv-ext-mat-jdg use case was installed, then the following VDB's can be connected to:
*  jdbc:teiid:Portolio@mm://localhost:31000
*  jdbc:teiid:PeopleMat@mm://localhost:31000

The Portfolio is the data that's used for materialization.  The PeopleMat is where the materialization models are configured.

To see the data that's been materializated, use:
*  Select * from PersonMatView

To PersonMatCache is the model of the caches used for materialization.

## JDV-DATASOURCE-JDG Use Case


