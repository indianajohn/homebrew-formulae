require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb

class Comma < Formula
  homepage "https://github.com/acfr/comma/wiki"
  url "https://github.com/acfr/comma.git", :revision => "16526682a3b5a56996754c1d912872a4023356a3"
  sha1 ""
  version "1.0.5"

  depends_on "cmake" => :build
  depends_on "boost" => :build

  def install
    system "mkdir build"
    cd 'build'
    system "cmake", "..", "-DCMAKE_BUILD_TYPE=Release", "-DBUILD_APPLICATIONS=OFF", "-DBUILD_TESTS=OFF", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
    system "make install"
  end
end
