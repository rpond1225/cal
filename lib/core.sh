#!/bin/zsh

CONFIG_FILE="$HOME/.cal/config"
TEMPLATE_DIR="$PROJECT_ROOT/assets/templates"

cal_show_help() {
  cat <<'HELP'
Cloud Architect Lab CLI

Usage:
  cal new <project-name>
  cal help

Commands:
  new     Create a new Cloud Architect Lab project
  help    Display this help message
HELP
}

cal_load_config() {
  if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Error: CAL configuration file not found."
    echo
    echo "Expected:"
    echo "  $CONFIG_FILE"
    echo
    echo "Please create it with:"
    echo "  WORKSPACE=/path/to/Development"
    exit 1
  fi

  source "$CONFIG_FILE"

  if [[ -z "${WORKSPACE:-}" ]]; then
    echo "Error: WORKSPACE is not defined in:"
    echo "  $CONFIG_FILE"
    exit 1
  fi

  BASE_DIR="$WORKSPACE"
}

cal_replace_placeholder() {
  local file="$1"
  local placeholder="$2"
  local value="$3"

  sed -i '' "s|{{$placeholder}}|$value|g" "$file"
}
