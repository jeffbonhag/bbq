all:
	docker build -t bbq .

run:
	docker run -i -t bbq /bin/bash
