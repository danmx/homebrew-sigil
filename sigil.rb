class Sigil < Formula
    desc "AWS SSM Session manager client"
    homepage "https://github.com/danmx/sigil"
    baseurl = "https://github.com/danmx/sigil/releases/download/"
    version "0.4.0"

    # Depends on AWS session-manager-plugin
    # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html

    bottle :unneeded

    if OS.mac?
      kernel = "darwin-amd64"
      sha256 "f343d5e87935ae46f9c081d04196079092e201a7276e77d71a18cf1e2d5f1d75"
    elsif OS.linux?
      kernel = "linux-amd64"
      sha256 "19b335c1f016bad13f5840041e4f5db7953ecaf42e65ba8da7ac674a3e1ffc0a"
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
