## JDV - JDG Integrations

This repository contains the following quick starts for the various JDG integrations:
-  jdv-ext-mat-jdg : JDV External Materialization into JDG Cache
-  jdv-datasource-jdg  : JDV Access Remote JDG Cache as a Data Source (TBD)

This repo is put together to help automate/speed up bulk of the setup effort in configuring JDG and JDV to demonstrate these use cases.

### Prerequisites

* [Java JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html), preferably 1.8 
* **JAVA_HOME** environment variable set
* **JAVA_HOME\bin** is on the PATH
* All of the necessary binaries downloaded. Refer to [binaries] (binaries/README.md) for download locations and filename/versions.
* Familiarity with Apache Ant

### Running the setup

#### Setup JBoss Data Grid

Use the following two commands to setup and start the JDG server. Going forward we will refer to the folder `target/{usecase}/jdg/jboss-datagrid-6.6.0-server/` as **$JDG_HOME**

The setup of JDG will install JDG server and then configure the following caches: 1) datasource_cache, 2) primary_cache, 3) staging_cache, and 4) alias_cache.

```sh
# Kick off JDG setup and wait for it to complete
./install-ext-mat-jdg setup-jdg

# Once complete, start the JDG server
./install-ext-mat-jdg start-jdg-server
```
#### Setup JBoss Data Virtualization

Use the following command to setup the JDV server. Going forward we will refer to the folder `target/{usecase}/jdv/jboss-eap-6.4/` as **$JDV_HOME**

There are two options for setting up JDV; 1) ready to add your own use case or 2) configured with an example of the usecase, ready to test

To setup JDV, that has the hot rod client installed, run:
```sh
./install-ext-mat-jdg setup-jdv 
```

To setup JDV, that does everthing setup-jdv does, but also configures a resource-adapter to connect to JDG, deploys the pojo, updates the infinispan-dsl resource-adapter module pojo dependency and deploys the Portfolio and PeopleMat VDB's., run the following:
```sh
./install-ext-mat-jdg setup-usecase 
```

#### Important Note
> The password for all accounts on the JDV runtime is `redhat1!`. Refer to **build.properties**.

