ARG GOVERSION=1.16.x
FROM techknowlogick/xgo:go-${GOVERSION}
# https://github.com/techknowlogick/xgo/issues/104
RUN go env -w GO111MODULE=auto

ADD docker/base/build.sh /build.sh
RUN chmod +x $BUILD
