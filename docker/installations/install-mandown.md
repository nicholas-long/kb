# install mandown
```dockerfile
RUN apt install -y libncursesw5-dev libxml2-dev libconfig-dev
RUN git clone https://github.com/Titor8115/mandown && cd mandown && make && make install
```

