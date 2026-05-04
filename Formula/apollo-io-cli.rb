class ApolloIoCli < Formula
  desc "Apollo.io CLI for searching people, companies, and more"
  homepage "https://github.com/apolloio/apollo-io-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-macos-arm64"
      sha256 "b0f897d91489fb0e4c2b6fa7bbe1dd663f9ca182c397e87ca9da45269723247a"
    else
      url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-macos-x64"
      sha256 "3a09dd9b10ada5f38993a1517973f4a277aa53561ff5e77f9e72c8ec8d94cc55"
    end
  end

  on_linux do
    url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-linux-x64"
    sha256 "794ce3437f9c59c167ad465d1f368b876e024a52f423b9a0b4896005062b9564"
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
