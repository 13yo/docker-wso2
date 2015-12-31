### docker-wso2esb

Docker image to install and run WSO2 DemoApp. 

(Docker base image thanks to ihcsim/docker-wso2esb)

### Description

The dockerfile will:

* Use `wget` to pull the ESB 4.9.0 ZIP, the DSS 3.5.0 ZIP and the IS 5.1.0 ZIP from the WS02 site into the container `/opt` folder.
* Install `zip`, `mysql-server`, `nginx`, `git` and .
* Unzip the ZIPs.
* Remove the ZIPs.
* Expose the container ports `9443`, `9763`, `8243`, `8280`.
* Set the `wso2server.sh` start-up script as the container start-up entrypoint.

### Usage
* To pull: `docker pull 13yo/wso2demo`
* To build: `docker build --rm -t your_image_name github.com/13yo/docker-wso2`
* To run: `docker run --rm --name your_container_name -p 9443:9443 -p 9763:9763 -p 8243:8243 -p 8280:8280 your_image_name`
* To access web admin console, navigate to `https://localhost:9443`

Follow me on [![alt text][1.1]][1]
[1.1]: http://i.imgur.com/tXSoThF.png (twitter icon with padding)
[1]: http://www.twitter.com/tobiaskaatzeu
