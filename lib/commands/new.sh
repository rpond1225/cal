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

created_year="$(date +%Y)"

  if [[ -d "$project_dir" ]]; then
    echo "Error: project already exists:"
    echo "  $project_dir"
    exit 1
  fi

  mkdir -p \
    "$project_dir/terraform" \
    "$project_dir/diagrams/source" \
    "$project_dir/diagrams/exported" \
    "$project_dir/docs/notes" \
    "$project_dir/docs/adr" \
    "$project_dir/screenshots"

  cp "$TEMPLATE_DIR/README-template.md" \
    "$project_dir/README.md"

cp "$TEMPLATE_DIR/LICENSE-template" \
    "$project_dir/LICENSE"

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

  touch "$project_dir/terraform/.gitkeep"
  touch "$project_dir/diagrams/source/.gitkeep"
  touch "$project_dir/diagrams/exported/.gitkeep"
  touch "$project_dir/docs/notes/.gitkeep"
  touch "$project_dir/docs/adr/.gitkeep"
  touch "$project_dir/screenshots/.gitkeep"

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

cal_replace_placeholder \
    "$project_dir/LICENSE" \
    "YEAR" \
    "$created_year"

cal_replace_placeholder \
    "$project_dir/LICENSE" \
    "AUTHOR" \
    "$author"

  cd "$project_dir" || exit 1

  git init
  git branch -M main
  git add .
  git commit -m "Initialize Cloud Architect Lab case study structure"

  echo
  echo "Created Cloud Architect Lab project:"
  echo "  $project_dir"
}
