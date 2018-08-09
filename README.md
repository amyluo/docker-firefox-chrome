# docker-firefox-chrome
Dockerfile for create a Docker image for running Google Chrome &amp; Firefox web browser


## Run Docker Container and auto start Firefox browser
$ docker run -it --rm -e DISPLAY=$DISPLAY --name firefox -v /tmp/.X11-unix:/tmp/.X11-unix web-browser:0.0.1 firefox


## Run Docker Container and auto start Google Chrome browser
$ docker run -it --rm --privileged --net host -e XAUTHORITY=/.Xauthority -e DISPLAY=$DISPLAY -v ~/.Xauthority:/.Xauthority:ro --name chrome --user gre -v /tmp/.X11-unix:/tmp/.X11-unix web-browser:0.0.1 google-chrome
