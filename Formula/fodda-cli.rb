require "language/node"

class FoddaCli < Formula
  desc "Automatically configure Fodda MCP servers across Claude, Cursor, and Windsurf"
  homepage "https://fodda.ai"
  
  # Once you publish the npm package `fodda-cli` to npm registry, this URL will be live.
  url "https://registry.npmjs.org/fodda-cli/-/fodda-cli-1.0.0.tgz"
  
  # TO UPDATE THE SHA256:
  # Once published to npm, run:
  # curl -sL https://registry.npmjs.org/fodda-cli/-/fodda-cli-1.0.0.tgz | shasum -a 256
  # and replace this value:
  sha256 "5e7ee4b62b94216d55671a70fdaf89c8909e28c35986d7c209f1e426349af774"
  
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # Verify the command is in the path and runs successfully
    system "#{bin}/fodda", "--version"
  end
end
