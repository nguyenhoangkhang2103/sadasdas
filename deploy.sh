docker build -t asengame/flask-docker:v1  -t asengame/flask-docker:$SHA .
docker push asengame/flask-docker:v1
docker push asengame/flask-docker:$SHA
kubectl apply -f k8s/db
kubectl apply -f k8s/api
kubectl set image client/client-deployment client=asengame/flask-docker:$SHA