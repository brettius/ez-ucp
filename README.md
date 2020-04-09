# ez-ucp
Deploys Docker UCP, DTR and a worker node for a test env

Issues

Manual join of Worker and DTR node needed. Manual upload of license needed. Type thisisunsafe if unable to access DTR through GUI. Use docker run -it --rm docker/dtr install  --ucp-node dtr  --ucp-username admin  —ucp-password adminadmin ucp-url https://ucp.local --ucp-insecure-tls to join DTR node
