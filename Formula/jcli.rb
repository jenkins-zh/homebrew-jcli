class Jcli < Formula
  desc "Jenkins CLI allows you manage your Jenkins as an easy way"
  homepage "https://jenkins-zh.cn"
  version "0.0.20"
  sha256 "644190a442500269e9c097f59244da1d40cfcd54af110d829aee78de360df902"
  
  url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v#{version}/jcli-darwin-amd64.tar.gz"

  def install
    bin.install name

    prefix.install_metafiles
  end
  
  test do
    # test version CLI command
    version_output = shell_output("#{bin}/v -v")
    assert_match version.to_s, version_output
  end
end
