class Kosh < Formula
  RELEASES = "https://github.com/fennec-support/kosh/releases".freeze

  def self.latest_tag
    @latest_tag ||= Utils::Curl.curl_output("--silent", "--head", "#{RELEASES}/latest")
                               .stdout[%r{^location:\s*\S+/releases/tag/(\S+)}i, 1]
  end

  def self.asset_url(platform)
    "#{RELEASES}/download/#{latest_tag}/kosh-#{platform}-#{latest_tag}"
  end

  def self.asset_sha256(platform)
    @checksums ||= Utils::Curl.curl_output(
      "--fail", "--silent", "--location",
      "#{RELEASES}/download/#{latest_tag}/SHA256SUMS"
    ).stdout.lines.to_h { |line| line.split.reverse }
    @checksums.fetch("kosh-#{platform}-#{latest_tag}")
  end

  desc "Fast shell with static analysis and a language server"
  homepage "https://github.com/fennec-support/kosh"
  license "BSD-3-Clause"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url asset_url("darwin-aarch64")
      sha256 asset_sha256("darwin-aarch64")
    end
  end

  on_linux do
    on_arm do
      url asset_url("linux-aarch64")
      sha256 asset_sha256("linux-aarch64")
    end

    on_intel do
      url asset_url("linux-amd64")
      sha256 asset_sha256("linux-amd64")
    end
  end

  def install
    asset = Dir["kosh-*"].first
    bin.install asset => "kosh"
  end

  test do
    assert_equal "hello", shell_output("#{bin}/kosh -c 'echo hello'").strip
  end
end
