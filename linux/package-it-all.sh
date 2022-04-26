#!/bin/bash

pkg=$1
arch=$2

success=0

if [ $arch == "amd64" ]; then
	ignore="i386"
else
	ignore="amd64"
fi
echo $arch "Ignoring packages for" $ignore

mkdir packages
cd packages
allpackages=$(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances $pkg:$arch | grep "^\w" | grep -v $ignore | sort -u)
#| xargs apt-get download

for p in $allpackages
do
	if apt-get download $p ; then
		sleep 0
	else
		echo "$p" >> ../missing_packages.log
		echo "Problem packaging" $p
		success=1
	fi
done

cd ..
if [ $success == 0 ]; then
	tar -czvf $pkg.tar packages/*.deb
	rm -rf packages
else
	echo "Need to install missing packages."
	cat missing_packages.log
fi
