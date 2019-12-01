class Jcli < Formula
  desc "Jenkins CLI allows you manage your Jenkins as an easy way"
  homepage "http://jcli.jenkins-zh.cn/"
  url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.23/jcli-darwin-amd64.tar.gz"
  sha256 "92b7221bbf742cbc8250c8def64de36e01d385b607ff9e7d16705dacd9927f5c"

  def install
    bin.install name

    # Install bash completion
    output = Utils.popen_read("#{bin}/jcli completion")
    (bash_completion/"jcli").write output

    prefix.install_metafiles
  end

  devel do
    jcli_id=$(docker create jenkinszh/jcli:dev)
    docker cp $jcli_id:/bin/darwin/jcli /usr/local/bin/jcli
    docker rm -v $jcli_id
  end
  
  test do
    # test version CLI command
    version_output = shell_output("#{bin}/jcli -v")
    assert_match version.to_s, version_output
  end
end
