class Sigil < Formula
    desc "AWS SSM Session manager client"
    homepage "https://github.com/danmx/sigil"
    url "https://github.com/danmx/sigil.git",
        :tag      => "0.3.3",
        :revision => "1826b9a8bb16816ebd89aa0fdf895b0039cfc085"
    head "https://github.com/danmx/sigil.git"
  
    # Depends on AWS session-manager-plugin
    # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html

    depends_on "go" => :build
    depends_on "cmake" => :build
  
    def install
        ENV["GOPATH"] = buildpath
        dir = buildpath/"src/github.com/danmx/sigil"
        dir.install buildpath.children - [buildpath/".brew_home"]
        
        cd dir do
            ENV["VERSION"] = stable.instance_variable_get(:@resource).instance_variable_get(:@specs)[:tag]
            ENV["REVISION"] = stable.instance_variable_get(:@resource).instance_variable_get(:@specs)[:revision]
            # Bootstrap
            system "make", "bootstrap"
            # Make binary
            system "make", "build-mac"
            bin.install "bin/release/darwin/amd64/sigil"
        end
    end

    def caveats; <<~EOS
        To use sigil you need to install AWS session-manager-plugin:
        https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html

        To see if you have it already installed run:
            sigil verify
        EOS
    end

    test do
        run_output = shell_output("#{bin}/sigil 2>&1")
        assert_match "A tool for establishing a session in EC2 instances with AWS SSM Agent installed", run_output
    
        version_output = shell_output("#{bin}/sigil version --client 2>&1")
        assert_match "GitTreeState:\"clean\"", version_output
        if build.stable?
          assert_match stable.instance_variable_get(:@resource)
                             .instance_variable_get(:@specs)[:revision],
                       version_output
        end
    end
end
