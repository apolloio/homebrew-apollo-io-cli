class ApolloIoCli < Formula
  desc "Apollo.io CLI for searching people, companies, and more"
  homepage "https://github.com/apolloio/apollo-io-cli"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-macos-arm64"
      sha256 "b63080495e1cb4fd142dd98b9a37c3725c0088a9219fbbb40bc3ef2693bc4929"
    else
      url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-macos-x64"
      sha256 "23970deab57b543b903cc2f63ce3f3bb4fd440de90ee5994a05e44722256bfdb"
    end
  end

  on_linux do
    url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-linux-x64"
    sha256 "1be0d6d2f0e120d458ae03ce825c5a07f79e2868e95856aa30bac737c5b99001"
  end

  def install
    binary = if OS.linux?
               "apollo-linux-x64"
             elsif Hardware::CPU.arm?
               "apollo-macos-arm64"
             else
               "apollo-macos-x64"
             end
    bin.install binary => "apollo"
  end

  test do
    system "#{bin}/apollo", "--version"
  end
end
