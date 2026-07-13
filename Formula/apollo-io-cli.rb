class ApolloIoCli < Formula
  desc "Apollo.io CLI for searching people, companies, and more"
  homepage "https://github.com/apolloio/apollo-io-cli"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-macos-arm64"
      sha256 "7cebf42e2e3e3155a6a3e86c2e46b32cd58b01bade29ea664534fe5c06502823"
    else
      url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-macos-x64"
      sha256 "062ef0cfcddd374cd0989a3c17058ceb32d7253ae138ac959f76af49eec5d768"
    end
  end

  on_linux do
    url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-linux-x64"
    sha256 "6599e9d3466a125371d438681011de95315ac2cf2bd6d090b03d56d4380f1655"
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
