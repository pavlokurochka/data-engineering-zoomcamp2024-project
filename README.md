# data-engineering-zoomcamp2024-project

 https://data.census.gov/table?q=median%20income&g=010XX00US$8600000&y=2022 

## Create Kestra container

If running on Windows  add .env file with `COMPOSE_CONVERT_WINDOWS_PATHS=1`



`docker run --pull=always --rm -it -p 8080:8080 --user=root -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp kestra/kestra:latest-full server local`

`base64 -w 0 /d/data-engineering-zoomcamp2024-project/.secret/terraform-demo-412002-cbcccc3c0b05.json >> gcp_secret`

`docker compose up`


https://lookerstudio.google.com/reporting/28a6e87a-edf2-401d-9ce2-8f20108768c0/page/hewuD

`chmod +x vm_setup/install_docker.sh
./install_docker.sh

git clone https://github.com/pavlokurochka/data-engineering-zoomcamp2024-project.git
cd data-engineering-zoomcamp2024-project/

docker run --pull=always --rm -it -p 8080:8080 --user=root -e SECRET_GCP_CREDS="$(base64 -w 0 secret/gcp_secret.json)" -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp kestra/kestra:latest-full server local`

export SECRET_GCP_CREDS="$(base64 -w 0 secret/gcp_secret.json)"
`docker compose up`