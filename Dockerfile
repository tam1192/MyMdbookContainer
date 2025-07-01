FROM rust:bullseye AS build
RUN cargo install mdbook@0.4.43 mdbook-pagetoc@0.2.0 mdbook-alerts@0.7.0 mdbook-katex@0.9.4

FROM ubuntu:24.04 
COPY --from=build /usr/local/cargo/bin/mdbook /bin
COPY --from=build /usr/local/cargo/bin/mdbook-alerts /bin
COPY --from=build /usr/local/cargo/bin/mdbook-pagetoc /bin
COPY --from=build /usr/local/cargo/bin/mdbook-katex /bin

RUN mkdir /running
WORKDIR /running

CMD [ "build" ]
ENTRYPOINT [ "mdbook" ]
