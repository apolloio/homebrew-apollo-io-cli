class ApolloIoCli < Formula
  desc "Apollo.io CLI for searching people, companies, and more"
  homepage "https://github.com/apolloio/apollo-io-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-macos-arm64"
      sha256 "52954114f2c4d0597815dc4df401f3c7cb2498a8ea467a19056a7efe41c8d8fb"
    else
      url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-macos-x64"
      sha256 "4b6ee183861d4222a76a60e1c87bdb17f10954eaa1fc665211e43e535f8e5469"
    end
  end

  on_linux do
    url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-linux-x64"
    sha256 "f0977d841b7e749cd12da24c0d4a437fc8a2880697e22d2b49f6261424470ba7"
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
