class Sigil < Formula
    desc "AWS SSM Session manager client"
    homepage "https://github.com/danmx/sigil"
    baseurl = "https://github.com/danmx/sigil/releases/download/"
    version "0.6.0"

    # Depends on AWS session-manager-plugin
    # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html

    bottle :unneeded

    if OS.mac?
      kernel = "darwin-amd64"
      sha256 "1ad506cabda6bc073220297dc6ae3167916413e71e1b33d4b4a2f07714548abb"
    elsif OS.linux?
      kernel = "linux-amd64"
      sha256 "4cfcb1628a7691f26909bab8606e730c42874149b28467311349bdf6f6ba03ed"
    end

    url baseurl + "/" + version + "/sigil_" + kernel + ".tar.gz"
  
    def install
        bin.install "sigil"
    end

    def caveats; <<~EOS
        To use sigil you need to install AWS session-manager-plugin:
        https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html

        To see if you have it already installed run:
            sigil verify
        EOS
    end

    test do
        system "sigil" "--version"
    end
end
