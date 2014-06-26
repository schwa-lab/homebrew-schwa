require "formula"

class Libschwa < Formula
  homepage "https://github.com/schwa-lab/libschwa"
  url "https://github.com/schwa-lab/libschwa/releases/download/0.3.0/libschwa-0.3.0.tar.gz"
  sha1 "9b44fb99547b3e8dd1a8e1e7bf24615f3f437bd6"

  depends_on "pkg-config"
  depends_on "zeromq" => :optional

  option "without-check", "skip build-time checks (not recommended)"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make check" if build.include? "check"
    system "make", "install"
  end

  test do
    system "#{bin}/schwa-tokenizer", "--version"
  end
end
