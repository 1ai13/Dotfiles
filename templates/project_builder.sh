#Template project generator
set -euo pipefail

name="Project"

while getopts ":n:" opt; do
  case $opt in
    n)
      name="$OPTARG"
      ;;
    \?) 
      echo "Option invalid" >&2; exit 1
      ;;
    :)
      echo "Option -$OPTARG missing data" >&2; exit 1
      ;;
  esac
done

shift $((OPTIND -1))

echo -e "Choose project type:\n1-CPP\n"
read -p "Type (Nº): " type

base_dir=${1:-.}

project_builder() {
  local path="$base_dir/$name"
  if [ -d "$path" ]; then
    echo "Directory already exists" >&2; exit 1;
  fi
  mkdir -p "$path/"{src,build}
  touch "$path/src/main.cpp"
  echo -e "addProject($name)\n\naddExecutable($name src/main.cpp)" > "$path/CMakeLists.txt"
}

case "$type" in
  1)
    project_builder
    ;;
  *)
    echo "Incorrect project type" >&2; exit 1;
    ;;
esac
