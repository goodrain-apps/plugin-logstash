all: build test

build:
	docker build -t local/logstash .

test: 
	docker run -it --name test-logstash local/logstash 

rm-test:
	docker rm -f test-logstash