# ================================
# Build image
# ================================
FROM swift:6.0-noble AS build

# Install OS updates and jemalloc
RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && apt-get -q update \
    && apt-get -q dist-upgrade -y \
    && apt-get install -y libjemalloc-dev

# Set up a build area
WORKDIR /build

# 1. Resolve dependencies first (cached layer)
COPY ./Package.* ./
RUN swift package resolve

# 2. Copy source code and tests (avoiding overlapping sources)
COPY ./Sources ./Sources
COPY ./Tests ./Tests

# 3. Build the application
RUN --mount=type=cache,target=/build/.build \
    swift build -c release \
        --product backend \
        --static-swift-stdlib \
        -Xlinker -ljemalloc

# 4. Prepare staging area
RUN mkdir /staging \
    && cp "$(swift build -c release --show-bin-path)/backend" /staging \
    && cp "/usr/libexec/swift/linux/swift-backtrace-static" /staging

# Copy resources if they exist
COPY ./Public* /staging/Public/

# ================================
# Run image
# ================================
FROM ubuntu:noble-20241015

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && apt-get -q update \
    && apt-get -q install -y \
      libjemalloc2 \
      ca-certificates \
      tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --user-group --create-home --system --skel /dev/null --home-dir /app vapor

WORKDIR /app

COPY --from=build --chown=vapor:vapor /staging /app

ENV SWIFT_BACKTRACE=enable=yes,sanitize=yes,threads=all,images=all,interactive=no,swift-backtrace=./swift-backtrace-static

USER vapor:vapor

EXPOSE 8080

ENTRYPOINT ["./backend"]
CMD ["serve", "--env", "production", "--hostname", "0.0.0.0", "--port", "8080"]
