FROM rust:1.68-bullseye as runtime
ENV DEBIAN_FRONTEND=noninteractive
ARG target=x86_64-unknown-linux-gnu
RUN apt-get update && apt-get install -qy libssl-dev pkg-config binaryen
RUN cargo install --locked --git https://github.com/chevdor/subwasm --tag v0.19.1
WORKDIR /github/workspace
COPY ./entrypoint.sh /entrypoint.sh
COPY ./versions.sh /usr/local/bin/versions.sh
RUN chmod +x /entrypoint.sh
RUN chmod +x /usr/local/bin/versions.sh
ENTRYPOINT [ "/entrypoint.sh" ]
