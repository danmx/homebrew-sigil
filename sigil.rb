class Sigil < Formula
    desc "AWS SSM Session manager client"
    homepage "https://github.com/danmx/sigil"
    baseurl = "https://github.com/danmx/sigil/releases/download/"
    version "0.5.1"

    # Depends on AWS session-manager-plugin
    # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html

    bottle :unneeded

    if OS.mac?
      kernel = "darwin-amd64"
      sha256 "30c37cb248ab7707a27fe95b44aafa069513329cacc9278c74a77970f9c65874"
    elsif OS.linux?
      kernel = "linux-amd64"
      sha256 "0ac0d795341c8f3027545309009d8f7a01c7e1ccb2769890b822d189fab6b27a"
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
