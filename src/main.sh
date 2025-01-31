
embed manifest ../manifest.toml

module build

main() {
  local list
  local build

  while [ $# -gt 0 ]; do
    case "$1" in
      -*)
        case "$1" in
          -l|--list)
            list=true
            shift
            ;;
          -b|--build)
            echo "Handling $1 with value: $2"
            build=$2
            shift
            ;;
          *)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
      esac
        ;;
      *)
        break
        ;;
    esac
    shift
  done || true

  if [ -n "$UNIPIPE_FILE" ]; then
    unipipe_file=$UNIPIPE_FILE
  else
    unipipe_file=unipipe.sh
  fi

  if [ -n "$list" ]; then
    my_print_list "$unipipe_file"
    exit
  fi

  if [ -n "$build" ]; then
    manifest
    unipipe_build "$unipipe_file"
    exit
  fi

  if [ "$#" -eq 0 ]; then
    echo "No arguments supplied"
  fi

  if [ "$#" -eq 1 ]; then
    my_print_host "$hosts" "$1"
    exit
  fi
}
