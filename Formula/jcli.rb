class Jcli < Formula
  desc "Jenkins CLI allows you manage your Jenkins as an easy way"
  homepage "https://jenkins-zh.github.io/jcli-docs/"
  url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.21/jcli-darwin-amd64.tar.gz"
  sha256 "6e30f65d8cb5d4c27061378f1ee4eeb682e08440203c4928b78350cd57d55cb4"

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
