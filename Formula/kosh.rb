class Kosh < Formula
  desc "Fast shell with static analysis and a language server"
  homepage "https://github.com/fennec-support/kosh"
  license "BSD-3-Clause"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fennec-support/kosh/releases/download/0.3.0/kosh-darwin-aarch64-0.3.0"
      sha256 "54713c220d40b2a98c8c3368fd681bc90cda6f2ad8d1c943a757260786d7c0bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fennec-support/kosh/releases/download/0.3.0/kosh-linux-aarch64-0.3.0"
      sha256 "08491f6f59785e2794fdce585738d9c026cb1db5901729fb6c331fb7bf9c0957"
    end

    on_intel do
      url "https://github.com/fennec-support/kosh/releases/download/0.3.0/kosh-linux-amd64-0.3.0"
      sha256 "5f25b35075526b3bbc37c1c6e57d53a52724109a168825092c08e7121d86ee2c"
    end
  end

  def install
    asset = if OS.mac?
      "kosh-darwin-aarch64-#{version}"
    elsif Hardware::CPU.arm?
      "kosh-linux-aarch64-#{version}"
    else
      "kosh-linux-amd64-#{version}"
    end

    bin.install asset => "kosh"
  end

  test do
    assert_equal "hello", shell_output("#{bin}/kosh -c 'echo hello'").strip
  end
end
