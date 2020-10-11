class Py3cairo < Formula
  desc "Python 3 bindings for the Cairo graphics library"
  homepage "https://cairographics.org/pycairo/"
  url "https://github.com/pygobject/pycairo/releases/download/v1.20.0/pycairo-1.20.0.tar.gz"
  sha256 "5695a10cb7f9ae0d01f665b56602a845b0a8cb17e2123bfece10c2e58552468c"
  license "LGPL-2.1"

  bottle do
    cellar :any
    sha256 "bd80a6817e090c490c828d22359fbd97c38b46cca2b325c7c69e38de9df0e6ea" => :catalina
    sha256 "0b586e4cb4e391fcc263c2892d533dda388c1ca139082a486939b2bbc3953d0a" => :mojave
    sha256 "e440b8405e3fd9c0d964e74ce0cb02b421077e91f84fbb9d10b6c68f51be328b" => :high_sierra
  end

  depends_on "pkg-config" => :build
  depends_on "cairo"
  depends_on "python@3.8"

  def install
    system Formula["python@3.8"].bin/"python3", *Language::Python.setup_install_args(prefix)
  end

  test do
    system Formula["python@3.8"].bin/"python3", "-c", "import cairo; print(cairo.version)"
  end
end
