FROM rust:bullseye AS build
RUN cargo install mdbook@0.4.43 mdbook-pagetoc mdbook-alerts

FROM ubuntu:24.04 
COPY --from=build /usr/local/cargo/bin/mdbook /bin
COPY --from=build /usr/local/cargo/bin/mdbook-alerts /bin
COPY --from=build /usr/local/cargo/bin/mdbook-pagetoc /bin

RUN mkdir /running
WORKDIR /running

CMD [ "build" ]
ENTRYPOINT [ "mdbook" ]