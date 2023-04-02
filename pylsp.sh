echo "Installing python language server pylsp (used in Spyder)..."
echo "(this takes a while, and requires closing vim after it's complete)"
sleep 3
nvim -c "LspInstall pylsp"

echo "" && echo "### Installing mypy..."
sleep 1
~/.local/share/nvim/lsp_servers/pylsp/venv/bin/pip install --upgrade pylsp-mypy
~/.local/share/nvim/lsp_servers/pylsp/venv/bin/pip install --upgrade "python-lsp-server[all]"
~/.local/share/nvim/lsp_servers/pylsp/venv/bin/pip install --upgrade "python-lsp-black"
~/.local/share/nvim/lsp_servers/pylsp/venv/bin/pip install --upgrade "python-lsp-mypy"

pip install --upgrade pylsp-mypy
pip install --upgrade "python-lsp-server[all]"

echo "" && echo "### Making sure typing/stubs has system packages (e.g., numpy, pandas)..."
sleep 1
sed -i .orig -e 's/site-packages = false/site-packages = true/g' \
    ~/.local/share/nvim/lsp_servers/pylsp/venv/pyvenv.cfg
