class Sigil < Formula
    desc "AWS SSM Session manager client"
    homepage "https://github.com/danmx/sigil"
    url "https://github.com/danmx/sigil/releases/download/0.3.3/sigil_darwin-amd64.tar.gz"
    version "0.3.3"
    sha256 "39fa73472d2741293369207552bf997b77d0b72584c972cf58f16b6f522503ec"

    # Depends on AWS session-manager-plugin
    # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html
  
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
