## How to use
### build the image
```bash
docker build -t jekyll-docker .
```
### run a container
```bash
docker run -d --name je -p 4000:4000 jekyll-docker
```
### open in browser
> http://127.0.0.1:4000
