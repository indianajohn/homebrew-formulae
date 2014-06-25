require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Cegui < Formula
  homepage "http://static.cegui.org.uk/docs/current/index.html"
  url "http://sourceforge.net/projects/crayzedsgui/files/CEGUI%20Mk-2/0.8/cegui-0.8.2.tar.gz/download"
  sha1 "1e2978517cce280395014b890aa62378213a7c22"

  depends_on "cmake" => :build
  depends_on "freeimage"
  depends_on "freetype"
  depends_on "jpeg"
# depends_on "libmng"
  depends_on "libtiff"
  depends_on "lzlib"
  depends_on "glfw3"
  depends_on "glew"
  depends_on "glm"
  depends_on "pcre"
  depends_on "xerces-c"
  depends_on "expat"
  depends_on "devil"
  depends_on "lua"
  depends_on "libpng"
#  depends_on "tolua"
  depends_on "tinyxml2"
#  depends_on "cegui-dependencies"

  patch :DATA

  def install
    # Remove unrecognized options if warned by configure
    system "mkdir build"
    cd 'build'
    system "cmake", "..", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

end
__END__
diff --git a/cmake/CEGUIMacros.cmake b/cmake/CEGUIMacros.cmake
index 75a7f06..2972a13 100644
--- a/cmake/CEGUIMacros.cmake
+++ b/cmake/CEGUIMacros.cmake
@@ -309,33 +309,33 @@ macro (cegui_apple_app_setup _TARGET_NAME _STATIC)
     endif()
 
     add_custom_command(TARGET ${_TARGET_NAME} POST_BUILD 
-        COMMAND if [ x${_CEGUI_BUILD_CONFIG} == xDebug ]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; else ce_ext=\"\"\; fi\; rm -rf \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Frameworks\"
+        COMMAND if \[ x${_CEGUI_BUILD_CONFIG} == xDebug \]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; else ce_ext=\"\"\; fi\; rm -rf \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Frameworks\"
         COMMENT "Removing old Frameworks in ${_TARGET_NAME}.app")
     add_custom_command(TARGET ${_TARGET_NAME} POST_BUILD 
-        COMMAND if [ x${_CEGUI_BUILD_CONFIG} == xDebug ]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; else ce_ext=\"\"\; fi\; rm -rf \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Resources\"
+        COMMAND if \[ x${_CEGUI_BUILD_CONFIG} == xDebug \]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; else ce_ext=\"\"\; fi\; rm -rf \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Resources\"
         COMMENT "Removing old Resources in ${_TARGET_NAME}.app")
 
     add_custom_command(TARGET ${_TARGET_NAME} POST_BUILD 
-        COMMAND if [ x${_CEGUI_BUILD_CONFIG} == xDebug ]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; else ce_ext=\"\"\; fi\; mkdir -p \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Frameworks\"
+        COMMAND if \[ x${_CEGUI_BUILD_CONFIG} == xDebug \]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; else ce_ext=\"\"\; fi\; mkdir -p \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Frameworks\"
         COMMENT "Creating Frameworks directory ${_TARGET_NAME}.app")
     add_custom_command(TARGET ${_TARGET_NAME} POST_BUILD 
-        COMMAND if [ x${_CEGUI_BUILD_CONFIG} == xDebug ]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; else ce_ext=\"\"\; fi\; mkdir -p \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Resources\"
+        COMMAND if \[ x${_CEGUI_BUILD_CONFIG} == xDebug \]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; else ce_ext=\"\"\; fi\; mkdir -p \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Resources\"
         COMMENT "Creating Resources directory ${_TARGET_NAME}.app")
 
     if (NOT ${_STATIC})
         if (NOT CEGUI_BUILD_SHARED_LIBS_WITH_STATIC_DEPENDENCIES)
             add_custom_command(TARGET ${_TARGET_NAME} POST_BUILD 
-                COMMAND if [ x${_CEGUI_BUILD_CONFIG} == xDebug ]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; ce_libglob=\"*${CEGUI_BUILD_SUFFIX}.dylib\"\; else ce_ext=\"\"\; shopt -s extglob\; ce_libglob=\"!\(*${CEGUI_BUILD_SUFFIX}\).dylib\"\; fi\; ${_ACTIONCMD} ${CMAKE_PREFIX_PATH}/lib/dynamic/$$ce_libglob \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Frameworks/\"
+                COMMAND if \[ x${_CEGUI_BUILD_CONFIG} == xDebug \]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; ce_libglob=\"*${CEGUI_BUILD_SUFFIX}.dylib\"\; else ce_ext=\"\"\; shopt -s extglob\; ce_libglob=\"!\(*${CEGUI_BUILD_SUFFIX}\).dylib\"\; fi\; ${_ACTIONCMD} ${CMAKE_PREFIX_PATH}/lib/dynamic/$$ce_libglob \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Frameworks/\"
                 COMMENT "Creating ${_ACTIONMSG} dependency libraries in ${_TARGET_NAME}.app")
         endif()
 
         add_custom_command(TARGET ${_TARGET_NAME} POST_BUILD 
-            COMMAND if [ x${_CEGUI_BUILD_CONFIG} == xDebug ]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; ce_libglob=\"*${CEGUI_BUILD_SUFFIX}.dylib\"\; else ce_ext=\"\"\; shopt -s extglob\; ce_libglob=\"!\(*${CEGUI_BUILD_SUFFIX}\).dylib\"\; fi\; ${_ACTIONCMD} ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/$$ce_libglob \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Frameworks/\"
+            COMMAND if \[ x${_CEGUI_BUILD_CONFIG} == xDebug \]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; ce_libglob=\"*${CEGUI_BUILD_SUFFIX}.dylib\"\; else ce_ext=\"\"\; shopt -s extglob\; ce_libglob=\"!\(*${CEGUI_BUILD_SUFFIX}\).dylib\"\; fi\; ${_ACTIONCMD} ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/$$ce_libglob \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Frameworks/\"
             COMMENT "Creating ${_ACTIONMSG} built cegui libraries in ${_TARGET_NAME}.app")
     endif()
 
     add_custom_command(TARGET ${_TARGET_NAME} POST_BUILD 
-        COMMAND if [ x${_CEGUI_BUILD_CONFIG} == xDebug ]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; else ce_ext=\"\"\; fi\; ${_ACTIONCMD} ${CMAKE_SOURCE_DIR}/datafiles \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Resources/\"
+        COMMAND if \[ x${_CEGUI_BUILD_CONFIG} == xDebug \]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; else ce_ext=\"\"\; fi\; ${_ACTIONCMD} ${CMAKE_SOURCE_DIR}/datafiles \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Resources/\"
         COMMENT "Creating ${_ACTIONMSG} sample datafiles ${_TARGET_NAME}.app")
 
     # When CEGUI_APPLE_SYMLINK_DEPENDENCIES_TO_SAMPLE_APPS is TRUE, this
@@ -345,7 +345,7 @@ macro (cegui_apple_app_setup _TARGET_NAME _STATIC)
     # CEGUI_APPLE_SYMLINK_DEPENDENCIES_TO_SAMPLE_APPS to false and the thing
     # will be copied to the output app bundle instead.
     add_custom_command(TARGET ${_TARGET_NAME} POST_BUILD 
-        COMMAND if [ x${_CEGUI_BUILD_CONFIG} == xDebug ]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; else ce_ext=\"\"\; fi\; ${_ACTIONCMD} ${CMAKE_BINARY_DIR}/datafiles/samples \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Resources/datafiles\"
+        COMMAND if \[ x${_CEGUI_BUILD_CONFIG} == xDebug \]\; then ce_ext=\"${CEGUI_BUILD_SUFFIX}\"\; else ce_ext=\"\"\; fi\; ${_ACTIONCMD} ${CMAKE_BINARY_DIR}/datafiles/samples \"${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${_TARGET_NAME}$$ce_ext.app/Contents/Resources/datafiles\"
         COMMENT "Creating ${_ACTIONMSG} samples.xml ${_TARGET_NAME}.app")
 endmacro()
 

