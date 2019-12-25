class Jcli < Formula
  desc "Jenkins CLI allows you manage your Jenkins as an easy way"
  homepage "http://jcli.jenkins-zh.cn/"
  url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.24/jcli-darwin-amd64.tar.gz"
  sha256 "930924661f42ba7f3bb1282acf79d982c3f5abe6a2fa2554d94f750aa7096be2"

  def install
    bin.install name

    # Install bash completion
    output = Utils.popen_read("#{bin}/jcli completion")
    (bash_completion/"jcli").write output

    prefix.install_metafiles
  end

  test do
    # test version CLI command
    version_output = shell_output("#{bin}/jcli -v")
    assert_match version.to_s, version_output
  end
end
