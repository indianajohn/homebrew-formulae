require 'formula'

class G2o < Formula
  homepage 'http://openslam.org/g2o.html'
  url 'https://github.com/RainerKuemmerle/g2o.git', :branch => 'master'
  version '13.'

  depends_on 'cmake'
  depends_on 'eigen'
  depends_on 'suite-sparse'

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
    else
      depends_on 'qt'
      depends_on 'libqglviewer'
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
