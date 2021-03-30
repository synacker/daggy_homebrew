class Daggy < Formula
  desc "Daggy - Data Aggregation Utility. Open source, free, cross-platform, server-less and useful utility for data aggregation and streaming"
  homepage "https://daggy.dev"
  url "https://github.com/synacker/daggy/archive/2.0.2.zip"
  sha256 "ac29f20ea11ce561ed1bc8c46ae15fca1628ee3032872b7eb5274e40931d36d5"

  depends_on "cmake" => :build
  depends_on "wget" => :build
  depends_on "qt5"
  depends_on "yaml-cpp"
  depends_on "libssh2"

  patch do
    url "https://raw.githubusercontent.com/synacker/daggy_homebrew/master/mustache.patch"
    sha256 "8ccee97c0e38c385b934e079371da42de8d2997488186f82969e1965b8b86ddc"
  end

  def install
    system "wget", "https://raw.githubusercontent.com/kainjow/Mustache/master/mustache.hpp", "-O", "src/Daggy/mustache.hpp"
    system "mkdir", "build"
    Dir.chdir('build')
    system "cmake", "-D", "VERSION=2.0.2", "-D", "CMAKE_INSTALL_PREFIX:PATH=#{prefix}", "-D", "CMAKE_BUILD_TYPE=Release", "../src"
    system "make", "all"
    system "make", "install"
  end

  test do
    assert_match "daggy 2.0.2", shell_output("#{bin}/daggy -v")
  end
end
