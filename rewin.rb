class Rewin < Formula

  #include Language::Python::Virtualenv

  desc "A command line script for automatic reboot in BootCamp"
  homepage "https://github.com/Mortafix/homebrew-ReWin"
  url "https://github.com/Mortafix/homebrew-ReWin/archive/v1.0.0.tar.gz"
  sha256 "0af7c1ce55be180b03371f759f105c578e5badc8b343bf8c5a080530a59ac00a"
  version "1.0.0"

  depends_on "python3"

  bottle :unneeded

  require "fileutils"

  def install
    #ENV.append "CPPFLAGS", "-I#{MacOS.sdk_path_if_needed}/usr/include/ffi"

    # Installing python modules
    #venv = virtualenv_create(libexec, Formula["python3"].opt_bin/"python3")
    #venv.pip_install resources

    # My python dependencies
    #(libexec/"bin").install "config.json"
    #(libexec/"bin"/"torrents").install "torrents/x1337.py"
    #(libexec/"bin"/"torrents").install "torrents/limetorrents.py"
    #(libexec/"bin"/"torrents").install "torrents/torlock.py"
    #(libexec/"bin"/"torrents").install "torrents/torrentdownloads.py"
    #(libexec/"bin"/"torrents").install "torrents/corsaronero.py"

    # Final Script
    (libexec/"bin").install "RebootInWindows.py" => "rewin"
    FileUtils.chmod("+x", libexec/"bin/rewin")
    (bin/"rewin").write_env_script libexec/"bin/rewin", :PATH => "#{libexec}/bin:$PATH"
  end

  test do
    system "gold-pirate -h"
  end
end