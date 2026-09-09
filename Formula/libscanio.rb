class Libscanio < Formula
  desc "Scan huge CSV files without loading them into memory"
  homepage "https://github.com/melihbirim/libscanio"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.2.1/scanio-macos-aarch64.tar.gz"
      sha256 "273b024fc4eaf5ab4b4a201f2630324cccbe3ad1ac0c4f8c92df57a6c5142272"
    end
    on_intel do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.2.1/scanio-macos-x86_64.tar.gz"
      sha256 "32e523cff7ef7541c216b59775297976f886dabf0d82438e9b4cbabcd9e5adcb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.2.1/scanio-linux-x86_64.tar.gz"
      sha256 "3434a6893abcdcdb5b3b91bc38035c47b8cde5e3a2f123812fb48f6422b5105b"
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
