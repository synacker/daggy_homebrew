class Daggy < Formula
  desc "Daggy - Data Aggregation Utility. Open source, free, cross-platform, server-less and useful utility for data aggregation and streaming"
  homepage "https://daggy.dev"
  url "https://github.com/synacker/daggy/archive/2.0.0.zip"
  sha256 "a0f23c181ca2211fbc1fecab6ee5bfdf391dcd845a02a36dde5c8e5c79d9aaa3"

  depends_on "cmake" => :build
  depends_on "wget" => :build
  depends_on "qt"
  depends_on "yaml-cpp"
  depends_on "libssh2"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "cmake", "src", "-DVERSION=2.0.0"
    system "cmake", "--build", "."
  end

  test do
    assert_match "daggy 2.0.0", shell_output("#{bin}/daggy -v")
  end
end
