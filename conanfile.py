from conans import (
    ConanFile,
    python_requires,
)


b2 = python_requires("b2-helper/0.2.0@grisumbras/testing")


class MyPackage(b2.B2.Mixin, ConanFile):
    name = "mypackage"
    version = "0.1.0"
    generators = "b2"
    exports_sources = (
        "jamroot.jam",
        "*.hpp",
        "*.cpp",
    )
    build_requires = "boost_build/[>=1.68]@bincrafters/stable"
