# Cloud Architect Lab CLI (cal)

The Cloud Architect Lab CLI (`cal`) is a command-line tool that standardizes the creation, documentation, and publication of Cloud Architect Lab case studies.

Rather than recreating project structures and documentation by hand, `cal` automates repetitive tasks so development effort can remain focused on architecture, implementation, and learning.

---

## Vision

Cloud Architect Lab is built on the philosophy of **Architecture as Code**.

Infrastructure, diagrams, documentation, architecture decisions, and project artifacts should all be version-controlled and treated as first-class engineering assets.

The `cal` CLI exists to automate that workflow.

---

## Current Features

### `cal new`

Creates a new Cloud Architect Lab project with the standard repository structure.

```bash
cal new my-project
```

Generates:

```text
my-project/
├── terraform/
├── diagrams/
│   ├── source/
│   └── exported/
├── docs/
│   ├── notes/
│   └── adr/
├── screenshots/
├── README.md
└── .gitignore
```

The command also:

- Initializes a Git repository
- Creates an initial commit
- Generates starter documentation

---

## Planned Features

- Interactive project creation
- README templates
- Architecture Decision Record generation
- Mermaid diagram templates
- Terraform project scaffolding
- Environment validation (`cal doctor`)
- Case study website scaffolding
- Publishing workflow automation

---

## Roadmap

| Version | Status |
|----------|--------|
| v0.1 | Project scaffolding |
| v0.2 | Enhanced README generation |
| v0.3 | ADR generation |
| v0.4 | Mermaid templates |
| v0.5 | Terraform scaffolding |
| v1.0 | Stable Cloud Architect Lab CLI |

---

## Philosophy

Standardize the process so creativity is spent on architecture—not setup.