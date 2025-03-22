# 🚀 Unipipe: Universal Pipeline Standard

## 🌟 Introduction

Unipipe is a groundbreaking standard for CI/CD and development workflow automation that solves the fundamental challenges of existing pipeline management tools.

## 💡 The Problem Unipipe Solves

Current CI/CD tools suffer from:
- Vendor lock-in
- Complex configuration files
- Limited portability
- Steep learning curves
- Inability to test pipelines locally

## ✨ Core Principles

- **Zero Dependencies**: Run anywhere, anytime
- **Pure Portability**: One script, multiple environments
- **Simplicity**: Human-readable, machine-executable
- **Platform Agnostic**: Works with GitHub, GitLab, Jenkins, and beyond

## 🏗️ Unipipe Docblock Primitives

Unipipe uses declarative docblocks to define task execution context and matrix-based configurations.

### Docblock Primitive Example

```sh
#!/bin/sh

# @task build
# @trigger pull_request:main
# @requires test
# @env production,staging
# @matrix os=[ubuntu-latest,macos-latest]
# @matrix node=[14,16,18]
# @matrix exclude=[
#   {os:macos-latest, node:14}
# ]
build() {
    make
}

# @task test
# @trigger always
# @env development,staging,production
test() {
    ./run-tests.sh
}

# @task deploy
# @trigger push:main
# @requires build,test
# @env production
deploy() {
    ./deploy-production.sh
}
```

### Docblock Primitive Reference

| Primitive      | Description | Example |
|----------------|-------------|---------|
| `@task`        | Define task name | `@task build` |
| `@trigger`     | Specify execution triggers | `@trigger push:main pull_request:opened` |
| `@requires`    | Define task dependencies | `@requires lint test` |
| `@env`         | Limit task to specific environments | `@env production,staging` |
| `@matrix`      | Create combinatorial test/build matrices | `@matrix os=[linux,macos] node=[14,16,18]` |

## 💻 Local Task Execution

Execute tasks directly using standard shell without any additional tooling:

```sh
# Execute a specific task locally
sh -c ". ./unipipe.sh && build"

# Run multiple tasks in sequence
sh -c ". ./unipipe.sh && build && test"

# Source the file and run interactively
sh
. ./unipipe.sh
build
```

Key Benefits:
- Zero dependencies
- Works on any POSIX-compliant system
- No special client required
- Identical execution environment locally and in CI

## 🚀 Key Features

- **Universal Compatibility**: Works with any POSIX-compliant environment
- **Automatic CI/CD Configuration Generation**
- **Local and Remote Execution**
- **No Additional Dependencies**
- **Advanced Matrix Testing**
- **Environment-Aware Execution**

## 🔌 Seamless CI/CD Integration

Generate configuration files for multiple platforms:

```sh
# Generate GitHub Actions workflow
unipipe --build github

# Generate GitLab CI configuration
unipipe --build gitlab
```

Simulate local trigger to debug the pipeline flow

```sh
# Execute the pipeline locally as effect of a pull request
unipipe --trigger pull_request
```

## 🤔 Unipipe vs Existing Tools

### Compared to Dagger
- Full event management
- No additional abstraction layers
- Truly portable across all environments
- Simpler configuration
- Zero runtime dependencies

### Compared to Make/Gulp
- Full CI/CD workflow support
- Cloud platform integrations
- Event-driven pipeline management
- Release process automation

## 💻 Getting Started

1. Create `unipipe.sh` in your project
2. Define your tasks using docblock primitives
3. Use the `unipipe` client to execute or generate configurations

## 🌍 Supported Platforms

- GitHub Actions
- GitLab CI
- Jenkins
- CircleCI
- And more...

## 🤝 Contributing

We welcome contributions! Help us build the universal pipeline standard.

## 📄 License

MIT License

## 🚀 Vision

Unipipe aims to become the universal standard for defining, executing, and managing development workflows across all platforms and environments.

- https://github.com/rosineygp/mkdkr

---

Simplify your CI/CD. Embrace Unipipe.
