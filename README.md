# bs2
lecture "betriebssysteme 2"

A docker container similar to the testsystem in laboritory. Build the docker by executing ```build.sh```

To mount test-script use ```run.sh <test-script>```

e.g. ```run.sh zettel04.sh```

This will execute the docker image and mount the corresponding script into its rootfolder.

Execute script inside dockercontainer by  ```/script.sh```

If you want to connect to the docker session with another shell use ```connect.sh```
