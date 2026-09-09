class Libscanio < Formula
  desc "Scan huge CSV files without loading them into memory"
  homepage "https://github.com/melihbirim/libscanio"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.2.0/scanio-macos-aarch64.tar.gz"
      sha256 "059f9051916ef0c19b88b8a955b3337a2122b5dd8d541162ef84de623856d342"
    end
    on_intel do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.2.0/scanio-macos-x86_64.tar.gz"
      sha256 "95966c130d51c9530d1d0c769c861a451cb9b22437c11da9cad9df6f2894a9e9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/libscanio/releases/download/v0.2.0/scanio-linux-x86_64.tar.gz"
      sha256 "b7fbe11cbe38f2e1385dfc406c522a1d8ca8fb757803bab5960f841873af5a8f"
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
