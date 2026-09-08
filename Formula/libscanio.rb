class Libscanio < Formula
  desc "Scan huge CSV files without loading them into memory"
  homepage "https://github.com/melihbirim/libscanio"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.1.2/scanio-macos-aarch64.tar.gz"
      sha256 "961a678fb8dcb079cefe68dc5913a5c6201450c2b1aa4c737e810588230d2d6d"
    end
    on_intel do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.1.2/scanio-macos-x86_64.tar.gz"
      sha256 "34d08f98f968fa74576a61e4925363a2fb2e337af60e8ddd921895c910b2be82"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.1.2/scanio-linux-x86_64.tar.gz"
      sha256 "f75efb368a178db6e8fbbd134a7e7589a8bfa3a5676242f63b15cfdb93d27f85"
    end
  end

  def install
    bin.install Dir["scanio-*"].first => "scanio"
  end

  test do
    (testpath/"test.csv").write("name,age\nAlice,30\nBob,25\n")
    output = shell_output("#{bin}/scanio test.csv --where \"age > 26\"")
    assert_match "Alice", output
  end
end
