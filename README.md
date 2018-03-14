## Dallingerbox 

**contact:** billdthompson@berkeley.edu

A workflow for developing a [Dallinger](http://docs.dallinger.io/en/v3.4.1/) experiment inside a docker a container. 

1. install [Docker](https://www.docker.com/)

2. clone this repo & ```cd dallingerbox```

3. ```docker build -t dallingerbox dallingerbox``` 

Now you have a Docker image called *dallingerbox*. This is an Ubuntu machine with python, postgres, redis, heroku, & dallinger installed. Whenever you want to develop a new experiment (called *my-new-exp*) using this environment:

4. ```cp -r exp-dev my-new-exp-dev```

5. re-write contents of ```my-new-exp-dev/exp``` (see ```exp-dev/README.MD``` for more info) 

6. build a docker image of your new expeirment with```docker build -t my-new-exp-dev my-new-exp-dev```

7. debug the experiment by spinning up an interactive container for this image, taking care to make port 5000 availible and to mount ```exp``` as a volume for incremental debugging: ```cd my-new-exp-dev && docker run -it -p 5000:5000 -v exp:/exp```

8. inside the container, fire the local servers using ```./local-sever.sh``` (you may need to modify the permissions first using ```chmod 777 local-server.sh```), invoke dallinger with ```dallinger debug --verbose```, and open a webbrowser at the participant-recruitment page (by default on localhost:5000) to preview the experiment. Because ```exp``` is mounted as a volume, you can leave the container running, make changes to the epxeirment files on the host machine, then just re-run ```dallinger debug --verbose``` in the container to debug the new version. 