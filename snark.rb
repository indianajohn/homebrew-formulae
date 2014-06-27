require "formula"

class Snark < Formula
  homepage "https://github.com/acfr/snark/wiki"
  url "https://github.com/acfr/snark.git", :revision => "e101d3c6e56f2b43923286db0dcca1d0f3af2ab4"
  sha1 ""
  version "1.0.4"

  depends_on "cmake" => :build
  depends_on "libpcap"
  depends_on "tbb"
  depends_on "libkml"

  def install
#    dir=`pwd`
#    p dir
    system "rm -f ../snark"
    system "ln", "-s", Dir.pwd, "../snark"
    system "mkdir build"
    cd 'build'
    system "cmake", "..", "-DCMAKE_BUILD_TYPE=Release", "-DBUILD_APPLICATIONS=OFF", "-DBUILD_TESTS=OFF", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
    system "make install"
  end
end
