class Jcli < Formula
  desc "Jenkins CLI which support you"
  homepage "https://jenkins-zh.cn"
  version "0.0.1"
  
  url "https://github.com/jenkins-x/jx/releases/download/v#{version}/jcli-darwin-amd64.tar.gz"
  # depends_on "cmake" => :build

  def install
    bin.install name

    output = Utils.popen_read("SHELL=bash #{bin}/jx completion bash")
    (bash_completion/"jx").write output

    output = Utils.popen_read("SHELL=zsh #{bin}/jx completion zsh")
    (zsh_completion/"_jx").write output

    prefix.install_metafiles
  end
end
