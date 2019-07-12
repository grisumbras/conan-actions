workflow "Test" {
  on = "push"
  resolves = ["run-cpt", "run-conan-remote-add"]
}


action "run-cpt" {
  uses = "./cpt/"
  env = {
    CONAN_USERNAME = "grisumbras"
    CONAN_REMOTES = "https://api.bintray.com/conan/bincrafters/public-conan, https://api.bintray.com/conan/grisumbras/conan"
  }
}


action "run-conan-remote-add" {
  uses = "./remote-add/"
  env = {
    remotes = "binc@@https://api.bintray.com/conan/bincrafters/public-conan, gris@@https://api.bintray.com/conan/grisumbras/conan"
  }
}
