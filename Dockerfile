FROM golang:1.24.3-alpine3.21 as go-base
WORKDIR /usr/src/app
COPY . .
RUN go mod init fullcycle && go build -ldflags "-w -s" -o fullcycle fullcycle.go
RUN rm -f go.mod

FROM scratch
COPY --from=go-base /usr/src/app/fullcycle .
CMD [ "./fullcycle" ]