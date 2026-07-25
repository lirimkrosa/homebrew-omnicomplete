require "language/node"

class Omnicomplete < Formula
  desc "A blazingly fast, native autocomplete UI for Zsh"
  homepage "https://github.com/lirimkrosa/omnicomplete"
  # This URL points to the NPM registry tarball, which gets published when you run `npm publish`
  url "https://registry.npmjs.org/@lirimkrosa/omnicomplete/-/omnicomplete-1.0.20.tgz"
  # You will need to update the sha256 when you publish a new version
  sha256 "bc2094729864fdfa075f577cd0f6ba44fb4c60dfa4a25422f2a90eb921ffe472"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/omni", "--version"
  end
end
