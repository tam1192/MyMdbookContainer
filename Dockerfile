FROM rust:bullseye AS build
RUN cargo install mdbook@0.4.43 mdbook-pagetoc mdbook-alerts