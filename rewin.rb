class Rewin < Formula

  desc "A command line script for automatic reboot in BootCamp"
  homepage "https://github.com/Mortafix/homebrew-ReWin"
  url "https://github.com/Mortafix/homebrew-ReWin/archive/v1.0.0.tar.gz"
  sha256 "0af7c1ce55be180b03371f759f105c578e5badc8b343bf8c5a080530a59ac00a"
  version "1.0.0"

  depends_on "python3"

  bottle :unneeded

  require "fileutils"

  def install

    # Script
    (libexec/"bin").install "RebootInWindows.py" => "rewin"
    FileUtils.chmod("+x", libexec/"bin/rewin")
    (bin/"rewin").write_env_script libexec/"bin/rewin", :PATH => "#{libexec}/bin:$PATH"
  end

  test do
    system "rewin -h"
  end
end