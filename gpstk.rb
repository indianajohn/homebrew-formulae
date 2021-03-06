require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Gpstk < Formula
  homepage ""
  url "https://downloads.sourceforge.net/project/gpstk/gpstk/2.4/gpstk-2.4.src.tar.gz"
  sha1 "14d32e93f5f1e82eee40a96ad815887d32edb77b"

  depends_on 'cmake' => :build

  patch :DATA

  def install
    system "cmake", "dev", *std_cmake_args
    system "make install"
  end
end

__END__

diff --git a/dev/CMakeLists.txt b/dev/CMakeLists.txt
index 9b510d0..4f99993 100755
--- a/dev/CMakeLists.txt
+++ b/dev/CMakeLists.txt
@@ -187,9 +187,9 @@ endif()
 
 install (TARGETS gpstk DESTINATION lib)
 if (CORE_ONLY)
-  install (FILES ${CORE_HDRS} ${CORE_HDRS2} DESTINATION include )
+  install (FILES ${CORE_HDRS} ${CORE_HDRS2} DESTINATION include/gpstk )
 else ()
-  install (FILES ${CORE_HDRS} ${CORE_HDRS2} ${EXT_HDRS} ${EXT_HDRS2} DESTINATION include )
+  install (FILES ${CORE_HDRS} ${CORE_HDRS2} ${EXT_HDRS} ${EXT_HDRS2} DESTINATION include/gpstk )
 endif ()
 
 

