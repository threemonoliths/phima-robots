#/bin/bash

docker run --name robotsdb \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_USER=postgres \
-e POSTGRES_DB=robots_dev \
-p 5432:5432 \
-d postgres