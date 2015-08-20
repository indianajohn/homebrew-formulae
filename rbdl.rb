# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Rbdl < Formula
  homepage 'http://rbdl.bitbucket.org/'
  url 'https://bitbucket.org/rbdl/rbdl/get/default.zip'
  version '2.4.0'
  sha256 "591b407ff0acdb1cb73a922d1335b8e8cded4e0ba476795071f5fb1645e7aa0f"

  depends_on 'cmake' => :build
  depends_on 'eigen'

  def options
    [
      ['--no_apps',"Don't build applications"],
      ['--deprecated', "Build deprecated types"],
      ['--examples', "Build examples"],
      ['--linked', "Build linked applications"],
      ['--csparse', "Build csparse"],
      ['--no_opengl',"Disable use opengl"],
      ['--use_openmp', "Use openmp"],
    ]
  end

  def install
    args = std_cmake_parameters.split

    if ARGV.include? '--no_apps'
      args << "-DG2O_BUILD_APPS:BOOL=OFF"
    end
    if ARGV.include? '--deprecated'
      args << "-DG2O_BUILD_DEPRECATED_TYPES:BOOL=ON"
    end
    if ARGV.include? '--examples'
      args << "-DG2O_BUILD_EXAMPLES:BOOL=OFF"
    end
    if ARGV.include? '--linked'
      args << "-DG2O_BUILD_LINKED_APPS:BOOL=ON"
    end
    if ARGV.include? '--csparse'
      args << "-DBUILD_CSPARSE:BOOL=ON"
    end
    if ARGV.include? '--no_opengl'
      args << "DG2O_USE_OPENGL:BOOL=OFF"
    end
    if ARGV.include? '--use_opengl'
      args << "DG2O_USE_OPENMP:BOOL=ON"
    end

    system "mkdir build"
    args << ".."
    Dir.chdir 'build' do
      system "cmake", *args
      system "make install"
    end
  end
end
