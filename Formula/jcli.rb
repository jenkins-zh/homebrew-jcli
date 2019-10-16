class Jcli < Formula
  desc "Jenkins CLI allows you manage your Jenkins as an easy way"
  homepage "https://jenkins-zh.github.io"
  url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.20/jcli-darwin-amd64.tar.gz"
  sha256 "644190a442500269e9c097f59244da1d40cfcd54af110d829aee78de360df902"

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
