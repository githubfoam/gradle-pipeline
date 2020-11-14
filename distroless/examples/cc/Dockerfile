FROM gcc:6 AS build-env
ADD . /app
WORKDIR /app
RUN cc helloworld.c -o helloworld

FROM gcr.io/distroless/cc
COPY --from=build-env /app /app
WORKDIR /app
CMD ["./helloworld"]