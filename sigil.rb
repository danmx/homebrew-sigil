class Sigil < Formula
    desc "AWS SSM Session manager client"
    homepage "https://github.com/danmx/sigil"
    baseurl "https://github.com/danmx/sigil/releases/download/"
    version "0.3.3"
    @@bin_name "sigil"

    # Depends on AWS session-manager-plugin
    # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html

    bottle :unneeded

    if OS.mac?
      kernel = "darwin-amd64"
      sha256 "39fa73472d2741293369207552bf997b77d0b72584c972cf58f16b6f522503ec"
    elsif OS.linux?
      kernel = "linux-amd64"
      sha256 "543f161e32e4abcdc59acc36e1879dc98e579658fa59c03b0801c011f8005491"
    end

    url baseurl + "/" + version + "/" + @@bin_name + "_" + kernel + ".tar.gz"
  
    def install
        bin.install @@bin_name
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
