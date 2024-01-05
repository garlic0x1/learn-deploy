FROM docker.io/fukamachi/qlot

COPY . .

RUN apt-get update && apt-get install gcc libev-dev -y
RUN qlot install
RUN make build

EXPOSE 9000
ENTRYPOINT ./learn-deploy
