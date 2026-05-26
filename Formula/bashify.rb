class Bashify < Formula
  include Language::Python::Virtualenv

  desc "Natural language to zsh CLI powered by Claude"
  homepage "https://github.com/reed-colloton/bashify"
  url "https://github.com/reed-colloton/bashify/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f8c42a00bbda9d39806a3519b01d0335cee6d6be951c502715dbffce503af210"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Create a virtualenv, install dependencies, and install the script
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install_and_link buildpath
  end

  test do
    # Since it requires an API key and starts an interactive shell,
    # we verify that the command executes and correctly reports the missing API key error.
    assert_match "Error: OPENROUTER_API_KEY environment variable not set.", shell_output("#{bin}/bashify", 1)
  end
end
