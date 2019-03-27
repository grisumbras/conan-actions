workflow "Test" {
  on = "push"
  resolves = "run-cpt"
}


action "run-cpt" {
  uses = "./cpt/"
  env = {
    CONAN_USERNAME = "grisumbras"
    CONAN_REMOTES = "https://api.bintray.com/conan/bincrafters/public-conan, https://api.bintray.com/conan/grisumbras/conan"
  }
}
