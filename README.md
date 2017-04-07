# utrechtguessr
web-app game - side project

To start up this application a Tomcat server needs to be configured, that deploys the UtrechtGuessr: war exploded.

How to do this:
Install a local Tomcat server.
In Intellij: open menu Run - Edit Configurations..
In the resulting popup, click the Add icon, then click Tomcat and Local Server.

From that dialog, in the Server tab, you will need to click the Configure... button next to Application Server to tell IntelliJ where Tomcat is installed.
And then in the Deployment tab you need to define that it needs to start the 'UtrechtGuessr: war exploded'.

Running this Tomcat server starts the application.
