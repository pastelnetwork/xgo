ARG GOVERSION=1.16.x
FROM techknowlogick/xgo:go-${GOVERSION}
# https://github.com/techknowlogick/xgo/issues/104
RUN go env -w GO111MODULE=auto

ADD docker/base/build.sh /build.sh
RUN chmod +x $BUILD

# Patch CGO pthreads stack size to be increased to 2MB (To avoid crashes on CGO calls of LegRoast native library)
ADD pthread-stack-size-gcc_darwin_amd64.patch /pthread-stack-size-gcc_darwin_amd64.patch
RUN patch -p1 /usr/local/go/src/runtime/cgo/gcc_darwin_amd64.c /pthread-stack-size-gcc_darwin_amd64.patch
