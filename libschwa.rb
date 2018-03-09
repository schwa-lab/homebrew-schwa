require "formula"

class Libschwa < Formula
  homepage "https://github.com/schwa-lab/libschwa"
  url "https://github.com/schwa-lab/libschwa/releases/download/0.4.0/libschwa-0.4.0.tar.gz"
  sha256 "09c9b8db339b44ce251a1289a5075dcf2b5edf4b8cde05af97f6e992bc12e617"

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
