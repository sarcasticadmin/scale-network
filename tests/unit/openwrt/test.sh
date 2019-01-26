usage(){
  cat << EOF
usage: $(basename $0) [OPTIONS] ARGS

Simple template of getopts

OPTIONS:
  -h      Show this message
  -e      Echo first arg

EXAMPLES:
  To print out arg1:

      $(basename $0) arg1

EOF
}

while getopts "hu" OPTION
do
  case $OPTION in
    u )
      UPDATE=1
      ;;
    h )
      usage
      exit 0
      ;;
    \? )
      usage
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

UPDATE=${UPDATE:-0}


#OUTPUT="golden"
OUTPUT="tmp"

gen_templates(){
  gomplate -d openwrt=../../../facts/secrets/openwrt.yaml --input-dir=../../../openwrt/files --output-dir="./${1}"
}

if [ "${UPDATE}" == "1" ]; then
  gen_templates golden
fi

gen_templates tmp

# Exclude network for now since maps are in random order
# see: https://github.com/hairyhenderson/gomplate/issues/457
diff -r golden/ tmp/ -x "*network*"

#cd ./${OUTPUT}
#find -s . -type f -exec md5 {} \; > ./SUM
#find . -type f -exec md5 {} \; > ./SUM
#cd ..
#diff -u ./${OUTPUT}/SUM ./golden/SUM
