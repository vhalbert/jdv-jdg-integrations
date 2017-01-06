## Pojo folder for Use case

This folder should contain the pojo zip that can be installed into the server by unzipping.

This zip should consist of the following:

-  should be able to be unzipped and deployed as a module into the DV server
-  the folder structure should be of this form:  module/{your/pojo}

If "module" folder is not in your folder, then you will need to update the "unzip-pojo" target in the usecase-build.xml to add "module" to the destination location.

-  should contain the pojo jar and the module.

## Configuration

The usecase.properties file should have the property:  pojo.zip  updated to point to the name of your pojo zip.

## Intallation Process

The installation process will use the "pojo.zip" property to determine the what to be installed into the DV server.






