# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Jcli < Formula
  desc "Jenkins CLI allows you manage your Jenkins as an easy way"
  homepage "https://github.com/jenkins-zh/jenkins-cli"
  version "0.0.34"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.34/jcli-darwin-amd64.tar.gz"
    sha256 "1875a8e4430fa446ebb95bf91f791c9f3f3695f4ad2eb81da2afcab20e3c1689"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.34/jcli-linux-amd64.tar.gz"
    sha256 "018bb3fd3a4db434d84f816b4eab818aaafe27ccc776f466c742c678991115ea"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.34/jcli-linux-arm64.tar.gz"
    sha256 "76828fed9f1e13337f6a23b3113887251e5152eeaadb6a7f72f408bf71b368fe"
  end

  depends_on "vim" => :optional
  depends_on "bash-completion" => :optional

  def install
    bin.install name

    # Install bash completion
    output = Utils.popen_read("#{bin}/jcli completion")
    (bash_completion/"jcli").write output

    # Install zsh completion
    output = Utils.popen_read("#{bin}/jcli completion --type zsh")
    (zsh_completion/"_jcli").write output

    (Pathname.pwd/"man").mkpath
    system "#{bin}/jcli", "doc", "--doc-type", "ManPage", "man"
    man1.install Dir["man/*.1"]

    prefix.install_metafiles
  end

  test do
    version_output = shell_output("#{bin}/jcli version")
    assert_match version.to_s, version_output
  end
end
