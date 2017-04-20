# Bulk rename all files containing pattern $1 by replacing pattern $2 with $3.
bulk-rename() {
  for f in *$1*; do
      mv -vi $f ${f//$2/$3}
  done
}
