# sending installs to target
## install programs on target as tar archive file using docker to find installed dependencies
## install pip modules on target as files with no dependencies on network connection to pip
- create a docker image with python3-pip installed and a user account created
- run a docker (no --rm) with that image, install packages with pip
- create image from container `docker commit $CONTAINER_NAME`
- use dive to inspect the last layer (bottom one) of stuff pip installed
- export image to tar `docker image save $IMAGE_ID_OR_TAG -o output.tar`
- go find layer you added when you installed stuff
  - files for that layer are in a tar file nested within the image tar file we exported
- take nested tar file, extract it. it should just have a `home` directory, stuff it could access to install modules as user with pip
- clean up contents of home folder, i.e. don't include things like `.bash_history` etc.
- compress and send it over
```bash
## we have a docker named flamboyant_wu with crackmapexec installed
docker commit flamboyant_wu # the name of the container
docker tag 5b4c2a109c792b08aafabeaee52156364d0e4155404a4eb97c34354a6a9928cb cmetest # tag the output id with a name
docker image save cmetest -o cme.tar # save image, produces tar file with other tars inside containing layers
## unzip the image tar
mkdir unzip
cp cme.tar unzip
cd unzip
tar -xvf cme.tar
## grab nested tar file and unzip
cp 62fcd27662f943d4e383d5dfdc2f3388f40fb36c043b3905bb047327e317db45/layer.tar cme_min.tar # this layer ID comes from dive output. it's the last layer.
cp cme_min.tar ../
cd ..
mkdir unzip2
cp cme_min.tar unzip2
cd unzip2
tar -xvf cme_min.tar
find home | grep py # it's all here!
```
