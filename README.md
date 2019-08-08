# Project Manager (SPA)
# Developer: Abdul Latheef A (451083)

<h4>projectmanagement-service - contains the REST end-points for application </h4>
<h4>projectmanagement-gui - contains the angular 6 cli code for application</h4>

Repo: https://github.com/aabdullatheef/project-management-fsd.git

<b>Commands for local development: (without jenkins integration i.e., from eclipse)</b>
<ul>
<li>spring boot in projectmanagement-service folder: spring-boot:run</li>
<li>angular ui in web folder of projectmanagement-gui: npm install -> npm start</li>
</ul>

<b>Commands for final build:</b>
<ul>
<li>Maven build: clean install -e	[The UI code is build using "frontend-maven-plugin" and is packed inside the JAR artifacts itself. Refer projectmanagement-gui pom.xml]</li>
<li>Docker build: package docker:build	[spotify "docker-maven-plugin" is used to create image in the remote docker. <dockerHost> configuration : pom.xml of projectmanagement-service]</li>
</ul>

<b>Commands for Docker execution: (Refer to the documentation)</b>
<ul>
<li>dockerx run -p 9081:9081 abdul09/abdul09-projectmanagement-application-image:latest	[to start the image, we generated]</li>
<li>dockerx exec -it <container id> sh	[to check the below URL's are working in the curl]</li>
</ul>	

<ul>
<li>To check whether application loaded correctly use below</li>
<li>Service: curl http://localhost:9081/api/tasks</li>
<li>UI Home page: curl http://localhost:9081/index.html</li>
</ul>	

<b>Jenkins: (Refer to the documentation)</b>

<b>Maven Job</b> is configured in jenkins to do CI even for local development which will build and deploy in apache tomcat server.

<ul>
<li>Maven Job configured for local auto build and deployment for the services. Login to the jenkins URL: http://localhost:8080 with the saved password and start new build. This will compile and build the services and deploy it in apache tomcat server.</li>
  <li>Go to the UI path in CMD: C:\java cognizant\project-management-fsd\projectmanagement-gui\src\main\web and start the server using the command "npm start"</li>
</ul>

<b>Pipeline Job</b> is configured in jenkins to do CI from git repository(https://github.com/aabdullatheef/project-management-fsd.git) /master branch which will build UI, services and create a snapshot and image. Also it will connect to docker and push the image. use above docker commands to login and start the dameon server. Execute the commands to verify the images pushed to docker.

<b>Documentation: </b>
<ul>
<li><b>Refer docker folder, jenkins folder, emma coverage folder & jmeter folder in the repo folder.</b></li>
<li><b>Refer Application Flow document, API Document as smoke tests of the assessment.</b></li>
<li><b>Refer db-scripts for the database DDL and DML's</b></li>
</ul>
