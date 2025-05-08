FROM scratch

WORKDIR /usr/src/app

COPY . .

CMD [ "go", "run", "main.go" ]
