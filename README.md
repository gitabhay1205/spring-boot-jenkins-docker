# spring-boot-jenkins-docker
Simple application to create docker image and push it to docker hub using jenkins and github

------------------------------------------------- Docker Image through CI/CD -----------------
1) Committing code in git -> Jenkins Pipeline create Docker Image and push it into docker hub
2) Create a simple maven project named- spring-boot-jenkins-docker
3) Create a repo in gitHub - with same name - spring-boot-jenkins-docker
4) Now follow commands on github repo page to push
5) Open terminal in spring boot and see location is of current project in terminal only
a) git init
b) git status
c) git add . (dot to add all files)
d) git commit -m "first commit"
e) again check status by git status - it will show nothing to commit
f) git remote add origin https://github.com/gitabhay1205/spring-boot-jenkins-docker.git
g) IT will ask to login gitbuh ,enter your credentials
h) git push -u origin master

Install Jenkins
a) https://www.jenkins.io/download/
b) download Generic Java package (.war) LTS(long term support)
c) Now do to downloads where this .war file is present and open cmd from here, and run command -> java -jar jenkins.war (you have to run this jar to start Jenkins)
d) on terminal one password will also be shown you can copy that and open http://localhost:8080, and give that password there
e) Click on Install Suggested Plugin and create account
f) after that open -> http://localhost:8080 to see Jenkins dashboard

Now Congiuring Jenkins Pipeline
a) Create new Job - jenkins-docker-springboot and click on freestyle project
b) click on Githib project and give url - https://github.com/gitabhay1205/spring-boot-jenkins-docker
c) click on Source Code Management - git and give url - https://github.com/gitabhay1205/spring-boot-jenkins-docker.git
d) Now in Build Trigger click on Poll SCM and give this cron expression (* * * * *) which means I want to run Jenkins in each commit
e) Now in Build Section select-> invoke-top-level maven targets and give maven goal as (install)
f) save, and then do build now to check

In case you get error like - "'mvn' is not recognized as an internal or external command, operable program or batch file. Build step 'Invoke top-level Maven targets' marked build as failure"
Do the below
On the Jenkins server, you need to go to Manage Jenkins > Global Tool Configuration and find "Maven installations". There you can set it up.

Now Integrate Jenkins with Docker
a) Add following plugins -> Docker pipeline, docker build step, cloudbees docker build and publish plugin
b) restart your jenkins by java -jar jenkins.war
c) Now open the pipeline -> configure -> Added Docker Build and Publish from Build
d) Add RepositoryName -> abhay120593/spring-boot-jenkins-docker
e) Add Docker Hub credentials in registry credentials
f) Build and see image in hub.docker.com