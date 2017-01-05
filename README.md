## JDV - JDG Integration

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

./{use case} {command}

where:

```sh
# Execute for jdv-ext-mat-jdg use case
./install-ext-mat-jdg.sh {command}

# Execute for jdg-datasource-jdg use case
./install-jdg-datasource.sh {command}
```

```sh
# For help (see all available commands), run the script with no arguments.
```

**Commands for JDG** 

* setup-jdg
* start-jdg-server
* stop-jdg-server

**Commands for JDV**

* setup-usecase (use setup-jdv to install JDV without use case, usefull if you want to start from scratch and use Teiid Designer)
* start-jdv-server
* stop-jdv-server


### Running the setup

#### Setup JBoss Data Grid

Going forward we will refer to the folder `target/{usecase}/jdg/jboss-datagrid-6.6.0-server/` as **$JDG_HOME**

The setup of JDG will install JDG server and then configure the following caches:

- jdv-datasource-jdg usecase
  * datasourceCache 
- jdv-ext-mat-jdg usecase
  * primaryCache
  * stagingCache
  * aliasCache

```sh
# Kick off JDG setup and wait for it to complete
./install-ext-mat-jdg setup-jdg
or
./install-jdg-datasource.sh setup-jdg
```

#### Setup JBoss Data Virtualization

There are 2 options for how JDV can be setup; 
1) configured with an example usecase, ready to test.
2) ready to perform your own use case 

Use one of the following commands to setup the JDV server. Going forward we will refer to the folder `target/{usecase}/jdv/jboss-eap-6.4/` as **$JDV_HOME**

To setup JDV, that does everthing setup-jdv does, but also configures a resource-adapter to connect to JDG, deploys the pojo, updates the infinispan-dsl resource-adapter module pojo dependency and deploys the Portfolio and PeopleMat VDB's., run the following:

```sh
# Setup JDV usecase 
./install-ext-mat-jdg setup-usecase 
or 
./install-jdg-datasource setup-usecase
```
or

To setup JDV and to also install the hot rod client, run:

```sh
# Setup JDV, with no usecase.
./install-ext-mat-jdg setup-jdv 
or
./install-jdg-datasource.sh setup-jdv
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

If you chose to use the 'setup-usecase' option when running the installation, the following describes accessing those vdb'.s and example queris that can be used.

### JDV-EXT-MAT-JDG Use Case

If the jdv-ext-mat-jdg use case was installed, then the following VDB's can be connected to:

-  jdbc:teiid:Portolio@mm://localhost:31000
-  jdbc:teiid:PeopleMat@mm://localhost:31000

The Portfolio is the data that's used for materialization.  The PeopleMat is where the materialization models are configured.

To see the data that's been materializated, use:

[source,sql]
----
Select * from PersonMatView
----

To PersonMatCache is the model of the caches used for materialization.

* To test the materialization process, do the following:

perform the following delete to the Account table:

[source,sql]
----
Delete from ACCOUNTS.Account where Account_ID = '19980002'
commit;
----

(needed the commit when using SQuirrel).

wait 20 seconds.

reissue query:

[source,sql]
----
Select * from PersonMatView where id = '19980002'
----

to confirm row is no longer included.


## JDV-DATASOURCE-JDG Use Case

If the jdv-datasource-jdg use case was installed, then the following VDB's can be connected to:

-  jdbc:teiid:People@mm://localhost:31000

There should be 3 tables; 1) Person, 2) Address and 3) PhoneNumber

The relationships are:
- People  ---  1-to-1 -- Address
- People  ---  1-to-m -- PhoneNumber

The following are example queries that can be run to demonstrate SELECT and INSERT of the JDG Cache:

[source,sql]
----
select name, email, id from Person 
Insert into Person (id, name, email) Values (100, 'TestPerson', 'test@person.com');
Insert into Person (id, name, email) Values (200, 'TestPerson2', 'test2@person.com');

select name, email, id from Person where id = 100

Insert into Address (id, Address, City, State) Values (200, '1212 Stratford', 'Davisburg', 'OH');
Insert into Address (id, Address, City, State) Values (100, '854 Motely', 'Dallas', 'TX');

select a.id, a.name, b.Address, b.City, b.State from Person as a, Address as b WHERE a.id = b.id


Insert into PhoneNumber (id, number) Values (200, '603-351-3022');
Insert into PhoneNumber (id, number) Values (100, '214-951-7651');

select a.id, a.name, b.number from Person as a, PhoneNumber as b WHERE a.id = b.id
----


Select All the infomation for a person:

[source,sql]
----
select a.id, a.name, b.Address, b.City, b.State, c.number from Person as a, Address as b, PhoneNumber as c WHERE a.id = b.id and a.id = c.id
----


