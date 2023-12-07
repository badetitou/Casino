# TUI test resource

This part of the repository contains the sources used to create tests in Casino.

Use the following script when adding test cases

````sh
sudo service docker start

docker run --rm -v "/mnt/d/Users/benoit.verhaeghe/Documents/Pharo/images/Omaje02/pharo-local/iceberg/badetitou/Casino/tests-resources/tUI/hello:/src" -v "/mnt/d/Users/benoit.verhaeghe/Documents/Pharo/images/Omaje02/pharo-local/iceberg/badetitou/Casino/tests-resources/tUI/lib:/dependency" ghcr.io/evref-bl/verveinej:v3.0.13 -format json -alllocals -anchor assoc -o tests.json
``

> You must use java files with the LF end of files convention.
> This is important to use the CI
