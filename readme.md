# Docker Masscan

Uses https://github.com/robertdavidgraham/masscan

## Use
docker build -t masscandocker .

docker run masscandocker -p80 192.168.1.0/24 --rate=1000