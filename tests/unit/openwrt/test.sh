#OUTPUT="golden"
OUTPUT="tmp"

gomplate -d openwrt=../../../facts/secrets/openwrt.yaml --input-dir=../../../openwrt/files --output-dir="./${OUTPUT}"

find -s ./${OUTPUT} -type f -exec md5 {} \; > ./${OUTPUT}/SUM

while read cat file
do
    matches=$( grep ./${OUTPUT}/SUM )
    echo "hi"
    [[ $matches != '' ]] && echo "$file:"$'\n'"$matches"
done < ./golden/SUM
#diff ./${OUTPUT}/SUM ./golden/SUM
