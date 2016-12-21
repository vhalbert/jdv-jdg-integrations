## JDV - JDG Integrations

This repository contains the following quick starts for the various JDG integrations:

*  jdv-ext-mat-jdg : JDV External Materialization into JDG Cache
*  jdv-datasource-jdg  : JDV Access Remote JDG Cache as a Data Source (TBD)

This repo is put together to help automate/speed up bulk of the setup effort in configuring JDG and JDV to demonstrate these use cases.

### Prerequisites

* [Java JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html), preferably 1.8 
* **JAVA_HOME** environment variable set
* **JAVA_HOME\bin** is on the PATH
* For binaries see [binaries] (binaries/README.md) for download locations and filename/versions.
* For patches see [patches] (patches/README.md) for any patches that maybe needed
* Familiarity with Apache Ant

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


# Once complete, start the JDG server
./install-ext-mat-jdg start-jdg-server
```


#### Setup JBoss Data Virtualization

There are 2 options for how JDV can be setup; 1) ready to add your own use case or 2) configured with an example of the usecase, ready to test.

Use one of the following commands to setup the JDV server. Going forward we will refer to the folder `target/{usecase}/jdv/jboss-eap-6.4/` as **$JDV_HOME**

To setup JDV and to also install the hot rod client, run:

```sh
# 1) Kick off JDV setup
./install-ext-mat-jdg setup-jdv 
```

To setup JDV, that does everthing setup-jdv does, but also configures a resource-adapter to connect to JDG, deploys the pojo, updates the infinispan-dsl resource-adapter module pojo dependency and deploys the Portfolio and PeopleMat VDB's., run the following:

```sh
# 2) Kick off JDG and JDG materialization usecase setup
./install-ext-mat-jdg setup-usecase 
```

To see all the possible commands, run ./install-ext-mat-jdg without any parameter.

#### Important Note
> The password for all accounts on the JDV runtime is `redhat1!`. Refer to **build.properties**.


### Connecting to jdv-ext-mat-jdg Use Case

If the jdv-ext-mat-jdg use case was installed, then the following VDB's can be connected to:
*  jdbc:teiid:Portolio@mm://localhost:31000
*  jdbc:teiid:PeopleMat@mm://localhost:31000

The Portfolio is the data that's used for materialization.  The PeopleMat is where the materialization models are configured.

To see the data that's been materializated, use:
*  Select * from PersonMatView

To PersonMatCache is the model of the caches used for materialization.


