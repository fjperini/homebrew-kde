class Kf5Kconfig < Formula
  desc "Configuration system"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.49/kconfig-5.49.0.tar.xz"
  sha256 "4e3f2b98fd15fa9c90763fe6fca79f75324f1aee6efa81af2d19a24c6d666331"

  head "git://anongit.kde.org/kconfig.git"

  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "qt"

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DBUILD_QCH=ON"
    args << "-DKDE_INSTALL_QMLDIR=lib/qt5/qml"
    args << "-DKDE_INSTALL_PLUGINDIR=lib/qt5/plugins"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
