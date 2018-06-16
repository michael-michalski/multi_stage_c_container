FROM alpine:3.7
RUN apk add --no-cache gcc musl-dev
COPY . /src
WORKDIR /src
RUN gcc -o mytest src/test.c

FROM alpine:latest
COPY --from=0 /src /src
WORKDIR /src
RUN ./mytest