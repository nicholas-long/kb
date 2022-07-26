# extract command for file type

## deb
```bash
ar x file.deb
```

## tar.gz
```bash
tar -xzvf file.tar.gz
```

## tar.xz
tar will call xz to decompress on its own
```bash
tar -xvf data.tar.xz
```

## xz
```bash
xz -d file.xz
```

## asar
```bash
mkdir extracted
sudo apt update && sudo apt install -y npm
sudo npm install -g asar
npx asar extract app.asar extracted
```

## apk
```bash
apktool d file.apk
```

### rebuild apk
```bash
apktool b app -o output.apk
```
apk files directory is `./app`
