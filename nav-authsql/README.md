# Dockefile for MS Dynamics NAV with SQL Authentication
This a simple and experimental Dockerfile for MS Dynamics NAV Server. Microsoft doesn\`t provide an official support for NAV containerization because of several OS dependencies. 
The Dockerfile is trying to avoid them installing just a Service Tier and not the whole package.
You can find more details on the [Tobias Fenster`s blog](http://navblog.infoma.de/index.php/2016/11/18/dynamics-nav-2017-in-a-windows-container-with-docker/).

~~**Not working right now correctly - there are some problems when trying to build NAV object (*.cs to *.dll conversion fails).**~~
It looks like the last changes solved the problem.

## Prerequisites
Before you can start the build process you have to upload unpacked content of NAV installation DVD (could be working with 2016 and 2017) into **DynamicsNavDvd** directory included in **content** directory.
Without this content, you can\`t build the image as it depends on DVD content.

Also, as this is a solution based on SQL authentication, you need a SQL server login and provide those credentials during the *docker run* process.

## Getting started
This simple and maybe not very well made solution has several files that help me to simplify build process and container management process.
You can find two basic configuration files in the main directory:
* **__imagename.txt** - specify name of the image,
* **__privatereponame.txt** - is useful when working with private Docker repository. In here I use a slightly different way I use in the production environment (this information is being distributed using GPOs of AD). Anyway, you can keep whatever there until you will try to push the image to your real private repository.

Next, you can find there are several *bat* files. Those files consume the information from the previously configured files and build, run and clean images/containers. You can see all details in the **_run.detached.bat** file which is supposed to be the best way how to run the container.