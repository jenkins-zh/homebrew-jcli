class Jcli < Formula
  desc "Jenkins CLI allows you manage your Jenkins as an easy way"
  homepage "http://jcli.jenkins-zh.cn/"
  version "v0.0.25"
  url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.25/jcli-darwin-amd64.tar.gz"
  sha256 "21a6eefb95276f2374a15af424150bf0c807aa207c3885b0d09ec48a7b1f203d"

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
