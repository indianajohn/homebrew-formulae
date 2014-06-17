require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Gpstk < Formula
  homepage ""
  url "https://downloads.sourceforge.net/project/gpstk/gpstk/2.4/gpstk-2.4.src.tar.gz"
  sha1 "14d32e93f5f1e82eee40a96ad815887d32edb77b"

  depends_on 'cmake' => :build

  def install
    system "cmake", "dev", *std_cmake_args
    system "make install"
  end
end
