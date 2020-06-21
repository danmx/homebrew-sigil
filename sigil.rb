class Sigil < Formula
    desc "AWS SSM Session manager client"
    homepage "https://github.com/danmx/sigil"
    baseurl = "https://github.com/danmx/sigil/releases/download/"
    version "0.5.3"

    # Depends on AWS session-manager-plugin
    # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html

    bottle :unneeded

    if OS.mac?
      kernel = "darwin-amd64"
      sha256 "d0441c0dfe505163145109e8b66e30e156d7ea80e8dddb9661ffbb403d8fe8f9"
    elsif OS.linux?
      kernel = "linux-amd64"
      sha256 "5d8b0cc8e760c762398d73e793c4b23bc5bf88f47862f58c129a74ab82d6c3f1"
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
