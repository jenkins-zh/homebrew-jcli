class Jcli < Formula
  desc "Jenkins CLI allows you manage your Jenkins as an easy way"
  homepage "https://jenkins-zh.cn"
  version "0.0.20"
  
  url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v#{version}/jcli-darwin-amd64.tar.gz"
  # depends_on "cmake" => :build

  def install
    bin.install name

    prefix.install_metafiles
  end
end
