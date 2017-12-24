#!/bin/bash

if [ "x$1" == "x" ];
then
    {
        echo "Please provide directory of project with pom.xml";
        echo "Or use list to see the project list";
        exit 1;
    }
fi


if [ "$1" == "list" ];
then
    {
        echo "listing projects in mvnprojects directory (docker volume)";
        docker exec -it fzl_maven ls -ilha /container_mvn_projects
        docker exec -it fzl_maven ls -ilha /container_mvn_projects/fzlbpms-artifacts/maven-artifacts
        echo 'fzlbpms-artifacts/maven-artifacts'
    }
else
    {   
        #MVN_PROJECTS_DIR=/run/media/wagner/96fea5f1-d297-4f63-a035-abf6511467be/wagnerdocri@gmail.com2/envs/env-dev/mvnprojects
        PROJECT=$1
        docker exec -it fzl_maven  /scripts/mvn-deploy.sh $PROJECT
    }
fi