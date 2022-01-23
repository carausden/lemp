# lemp
lemp Server 

1) Download Filles

git clone https://github.com/carausden/lemp.git 

2) build repo local
cd lemp
docker build -t crashacid/lemp . 

3) Run images witch port local if hi's not build local it's download for official repo 

docker run --rm -d --network host --rm --name lemp crashacid/lemp:latest
or 
docker run -d -p80:80 -p3306:3306 -p9000:9000 --rm --name lemp crashacid/lemp:latest
