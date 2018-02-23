## Boundless Katalon Suite

### Information

This is a fork of [katalon-studio/docker-images](https://github.com/katalon-studio/docker-images).

The repo has been modified to allow for easy declaration of browser type and also adding a docker 
proxy alias assigned to docker host ip to be added to the containers `/etc/hosts` file.

### Build

```bash
./build/build.sh
```

### Steps to use

Download Katalon Studio [here](https://www.katalon.com/)

1. Create a project and add Test Cases + Test Suites
2. In a terminal `cd` to the project folder
3. Run the following command below, make any adjustments to the env variables as needed.

```bash
docker run --rm -v $PWD:/katalon/katalon/source:ro \
                -e BROWSER_TYPE="Firefox" \
                -e TEST_SUITE_PATH="Test Suites/General Test Suite" \
                -e DOCKER_PROXY_ALIAS="nginx" \
                b7s-katalon:latest
```

Environment Variables:
+ BROWSER_TYPE - Options: Firefox, Chrome
+ TEST_SUITE_PATH - Specify the test suite file (without extension .ts)
+ DOCKER_PROXY_ALIAS - Proxy alias to add to hosts file associated with docker host entry