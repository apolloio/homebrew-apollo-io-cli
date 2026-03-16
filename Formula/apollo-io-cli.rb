class ApolloIoCli < Formula
  desc "Apollo.io CLI for searching people, companies, and more"
  homepage "https://github.com/apolloio/apollo-io-cli"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-macos-arm64"
      sha256 "75ce80ba6d0ffbc7c2b578303b277378ef516260aa2ccd83bc3fcc4161c63395"
    else
      url "https://github.com/apolloio/apollo-io-cli/releases/download/v#{version}/apollo-macos-x64"
      sha256 "ee679512ded5bbc3b42472a57c3e39bee5358b9089482701f07572e7f2520eaf"
    end
  end

  def install
    binary = Hardware::CPU.arm? ? "apollo-macos-arm64" : "apollo-macos-x64"
    bin.install binary => "apollo"
  end

  test do
    system "#{bin}/apollo", "--version"
  end
end
