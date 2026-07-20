class ApolloIoCli < Formula
  desc "Apollo.io CLI for searching people, companies, and more"
  homepage "https://github.com/apolloio/apollo-io-cli"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-macos-arm64"
      sha256 "d72c611c094884ab6836cf70303bbf17137d5b31642d582456635faa66eb7025"
    else
      url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-macos-x64"
      sha256 "bc2dd4012d00f8bc6ec87c6103f3ea14512ef351c1d724af4ded147797bbecb2"
    end
  end

  on_linux do
    url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-linux-x64"
    sha256 "0c6b17ee51048d545913e06f79c74bb204f9913f32920e51f12e9d1086f105b5"
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
