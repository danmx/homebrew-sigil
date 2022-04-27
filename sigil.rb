class Sigil < Formula
    desc "AWS SSM Session manager client"
    homepage "https://github.com/danmx/sigil"
    baseurl = "https://github.com/danmx/sigil/releases/download/"
    version "0.8.0"

    # Depends on AWS session-manager-plugin
    # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html

    if OS.mac?
      kernel = "darwin-amd64"
      sha256 "f811142c0a6a4dfd0b051c94be76f7b02c3528adb907817ad209b2f280bff284"
    elsif OS.linux?
      kernel = "linux-amd64"
      sha256 "fbf8d5dc0e64591d65e9094587880fe6cb5a4c75aca5d47e7d90cbf20a2389c1"
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
