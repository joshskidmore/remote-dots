get_fzf_arch() {
  case $(uname -m) in
    armv5l)       echo 'arm5'               ;;
    armv6l)       echo 'arm6'               ;;
    armv7l)       echo 'arm7'               ;;
    armv8l)       echo 'arm8'               ;;
    *)            echo '*'                  ;;
  esac
}