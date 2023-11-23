A simple setup to run OpenSTAManager using docker containers.

Just build the images with (replace <version> with the current one or use any tag you want):

`docker build -t openstamanager:<version> .`

Start the containers:

`docker compose up -d`

Stop the containers:

`docker compose down`
