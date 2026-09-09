class Libscanio < Formula
  desc "Scan huge CSV files without loading them into memory"
  homepage "https://github.com/melihbirim/libscanio"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.2.2/scanio-macos-aarch64.tar.gz"
      sha256 "e1e5284422bd2dd1d6a9047418d10d6733a70b8d62bad20643bd000d80bbf408"
    end
    on_intel do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.2.2/scanio-macos-x86_64.tar.gz"
      sha256 "853316f110b9cbe080a581bf79bb5f86363c8495b696f89bc906b75dd2883048"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.2.2/scanio-linux-x86_64.tar.gz"
      sha256 "8a04e27b41b9cbc5a428c74a6cf195c0cb1c0b3564070a50916f7c7a9541f485"
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
