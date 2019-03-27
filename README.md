# conan-actions

> GitHub Actions for building/publishing with Conan

## Example

```
workflow "Build" {
  on = "push"
  resolves = "build"
}

action "build" {
  uses = "grisumbras/conan-actions/cpt@master"
  env = {
    CONAN_CHANNEL = "testing"
    CONAN_USERNAME = "user"
  }
}
```
