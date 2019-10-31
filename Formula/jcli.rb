class Jcli < Formula
  desc "Jenkins CLI allows you manage your Jenkins as an easy way"
  homepage "https://jenkins-zh.cn/jcli-docs/"
  url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.22/jcli-darwin-amd64.tar.gz"
  sha256 "dcd330dcd7777d46d35af2637c8fa3dcdcd6ff8ca883af182818a7d514eafac0"

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
