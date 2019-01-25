#OUTPUT="golden"
OUTPUT="tmp"

gomplate -d openwrt=../../../facts/secrets/openwrt.yaml --input-dir=../../../openwrt/files --output-dir="./${OUTPUT}"

cd ./${OUTPUT}
#find -s . -type f -exec md5 {} \; > ./SUM
find . -type f -exec md5 {} \; > ./SUM
cd ..

diff -u ./${OUTPUT}/SUM ./golden/SUM
