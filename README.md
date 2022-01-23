# lemp
lemp Server 

1) Download Filles

git clone https://github.com/carausden/lemp.git 

2) build repo local

docker build -t crashacid/lemp . 

3) Run images witch port local if hi's not build local it's download for official repo 

docker run --rm -d --network host --rm --name lemp crashacid/lemp:latest
