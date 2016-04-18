# Sentinent analysis for polish language using SVM and BoW

Requirements:

* Docker
* docker-compose
* git, git-lfs


## Start
```bash
git clone https://github.com/riomus/polish-sentiment.git
docker-compose up -d
```

## Use

```bash
curl --request POST http://localhost:8091/classifier --data "Nie lubie cię"
# {"sentiment":"NEGATIVE","metadata":{}}% 
```
```