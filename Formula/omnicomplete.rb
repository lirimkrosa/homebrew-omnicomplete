require "language/node"

class Omnicomplete < Formula
  desc "A blazingly fast, native autocomplete UI for Zsh"
  homepage "https://github.com/lirimkrosa/omnicomplete"
  # This URL points to the NPM registry tarball, which gets published when you run `npm publish`
  url "https://registry.npmjs.org/@lirimkrosa/omnicomplete/-/omnicomplete-1.0.21.tgz"
  # You will need to update the sha256 when you publish a new version
  sha256 "b47d6f52153db90ec67e49428265b146983edf36ac44b17acb7c5e3ec32e5efa"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/omni", "--version"
  end
end
