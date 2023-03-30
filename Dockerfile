ARG GOVERSION=1.20.x
FROM techknowlogick/xgo:go-${GOVERSION}
RUN go env -w GO111MODULE=auto

ADD docker/base/build.sh /build.sh
RUN chmod +x $BUILD

# Patch CGO pthreads stack size to be increased to 2MB (To avoid crashes on CGO calls of LegRoast native library)
ADD docker/pastelnetwork/pthread-stack-size-gcc_darwin_amd64.patch /pthread-stack-size-gcc_darwin_amd64.patch
RUN patch -p1 /usr/local/go/src/runtime/cgo/gcc_darwin_amd64.c /pthread-stack-size-gcc_darwin_amd64.patch

ADD docker/pastelnetwork/install_deps.sh /install_deps.sh
RUN chmod +x /install_deps.sh
RUN /install_deps.sh

ENV LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH}"