docker build -t adidi/multi-client:latest -t adidi/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t adidi/multi-server:latest -t adidi/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t adidi/multi-worker:latest -t adidi/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push adidi/multi-client:latest
docker push adidi/multi-server:latest
docker push adidi/multi-worker:latest

docker push adidi/multi-client:$SHA
docker push adidi/multi-server:$SHA
docker push adidi/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=adidi/multi-server:$SHA
kubectl set image deployments/client-deployment client=adidi/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=adidi/multi-worker:$SHA
