GIT_COMMIT=$(get rev-parse master)
aws_account='679573946489.dkr.ecr.ap-south-1.amazonaws.com'
ecrImageName=$aws_account"/veros-intergrated-foresight"

docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
docker system prune -af  && docker volume rm $(docker volume ls --filter dangling=true -q)

docker build -t $ecrImageName:latest $ecrImageName:$GIT_COMMIT

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 679573946489.dkr.ecr.ap-south-1.amazonaws.com

docker push $ecrImageName:latest  && docker push $ecrImageName:$GIT_COMMIT
