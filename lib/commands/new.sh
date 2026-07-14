#!/bin/zsh

cal_new() {
  local project_name="${1:-}"

  if [[ -z "$project_name" ]]; then
    echo "Error: project name is required."
    echo
    echo "Usage:"
    echo "  cal new <project-name>"
    exit 1
  fi

  cal_load_config

  local project_dir="$BASE_DIR/$project_name"
  local author
  local created_date

  author="$(git config --global user.name)"
  created_date="$(date +%Y-%m-%d)"

  if [[ -d "$project_dir" ]]; then
    echo "Error: project already exists:"
    echo "  $project_dir"
    exit 1
  fi

  mkdir -p "$project_dir/terraform"
  mkdir -p "$project_dir/diagrams/source"
  mkdir -p "$project_dir/diagrams/exported"
  mkdir -p "$project_dir/docs/notes"
  mkdir -p "$project_dir/docs/adr"
  mkdir -p "$project_dir/screenshots"

  cp "$TEMPLATE_DIR/README-template.md" \
    "$project_dir/README.md"

  cp "$TEMPLATE_DIR/docs/architecture-template.md" \
    "$project_dir/docs/architecture.md"

  cp "$TEMPLATE_DIR/docs/deployment-template.md" \
    "$project_dir/docs/deployment.md"

  cp "$TEMPLATE_DIR/docs/validation-template.md" \
    "$project_dir/docs/validation.md"

  cp "$TEMPLATE_DIR/docs/decisions-template.md" \
    "$project_dir/docs/decisions.md"

  cp "$TEMPLATE_DIR/docs/lessons-learned-template.md" \
    "$project_dir/docs/lessons-learned.md"

  cp "$TEMPLATE_DIR/gitignore-template" \
    "$project_dir/.gitignore"

  cal_replace_placeholder \
    "$project_dir/README.md" \
    "PROJECT_NAME" \
    "$project_name"

  cal_replace_placeholder \
    "$project_dir/README.md" \
    "AUTHOR" \
    "$author"

  cal_replace_placeholder \
    "$project_dir/README.md" \
    "DATE" \
    "$created_date"

  cd "$project_dir" || exit 1

  git init
  git add .
  git commit -m "Initialize Cloud Architect Lab case study structure"

  echo
  echo "Created Cloud Architect Lab project:"
  echo "  $project_dir"
}
