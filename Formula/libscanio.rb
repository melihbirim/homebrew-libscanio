class Libscanio < Formula
  desc "Scan huge CSV files without loading them into memory"
  homepage "https://github.com/melihbirim/libscanio"
  version "0.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.0.0/scanio-macos-aarch64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.0.0/scanio-macos-x86_64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.0.0/scanio-linux-x86_64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install Dir["scanio-*"].first => "scanio"
  end

  test do
    (testpath/"test.csv").write("name,age\nAlice,30\nBob,25\n")
    output = shell_output("#{bin}/scanio test.csv --where 'age > 26'")
    assert_match "Alice", output
  end
end
