# web-server-configurations

Now that you have a basic understanding of how web servers work it's time to put that knowledge into practice. We have implemented our resume file to be served in multiple places, locally, ssh.sandbox.csun.edu and in a container on cit384-<UID> VM's.  

If you are curious about available [apache modules](https://httpd.apache.org/docs/2.4/mod/)


# Submission
The following files should be commited to your repository:
 - Dockerfile
 - index.html

# Assignment Steps
For the previous containerized-website lab you used the `httpd` base image. Using the `httpd` image as the base meant that you did not have to worry about installing or configuring the apache server, it just worked out of the box.  
This time around you will be `installing apache` and not relying on a pre-built image. 

You may use any base OS and your Dockerfile should contain the following: 
 - Installation of packages/modules
   - Apache
   - Enable [UserDir](https://httpd.apache.org/docs/2.4/howto/public_html.html) Module
   - Enable [DirectoryIndex](https://httpd.apache.org/docs/2.4/mod/mod_dir.html) Module
   - Any additional packages you might need to complete the assignment
 - Configuration of apache to use the modules
 - Add yourself as a user
 - Copy your resume site to the correct location
 - Use a CMD statement to start apache when a container is created
   - `CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]`


# Testing
Once you have finished your dockerfile you should build and test your image locally.   
```
docker build -t my_new_resume git@github.com:smf-steve/<blah>.git 
docker run -dit --name new_resume.site -p 8080:80 my_new_resume 

Then open a browser and test:  
http://localhost:8080/~<$UID>/   
```

An example:
![localhost example](assets/Apache-Example.png)
Once everything works as expected you will log into your cit384-UID VM's and deploy your updated image. 

All the commands needed to build images, create, start and exec into containers are listed on previous labs (as well as Google). 