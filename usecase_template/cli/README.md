## CLI folder for Use case

This folder should contain the CLI script(s) to configure the resource-adapter and anything that is needed.

## Intallation Process

The installation process looks for the following CLI scripts:

- setup-jdg-caches.cli   :  this is called by the primary build.xml ant file when JDG is being configured.  This is used to configure JDG (e.g, caches).
- create-jdg-resource-adapter.cli  :  this is called by the usecase-build.xml ant file to install the usecase specific resource-adapter into the JDV server.

## Setup

Change either of the CLI scripts to what is needed for your use case. 




