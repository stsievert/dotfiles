echo "Installing python language server pylsp (used in Spyder)..."
echo "(this takes a while, and requires closing vim after it's complete)"
sleep 3
nvim -c "LspInstall pylsp"

echo "" && echo "### Installing mypy..."
sleep 1
~/.local/share/nvim/lsp_servers/pylsp/venv/bin/pip install pylsp-mypy

echo "" && echo "### Making sure typing/stubs has system packages (e.g., numpy)..."
sleep 1
sed -i .orig -e 's/site-packages = false/site-packges = true/g' \
    ~/.local/share/nvim/lsp_servers/pylsp/venv/pyvenv.cfg
