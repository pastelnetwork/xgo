wget https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-2.4.0.tar.gz
tar -C /usr/local -xzf ./libtensorflow-cpu-linux-x86_64-2.4.0.tar.gz
/sbin/ldconfig -v

wget --secure-protocol=TLSv1_2 https://download.libsodium.org/libsodium/releases/libsodium-1.0.18.tar.gz
tar -C . -xzf ./libsodium-1.0.18.tar.gz
cd libsodium-1.0.18
./configure
make
make check
make install
/sbin/ldconfig -v
cd ..