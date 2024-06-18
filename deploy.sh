echo "Copying tmux config..."
cp .tmux.conf ~/

echo "git aliases/shortcuts..."
echo "alias g='git'" >> ~/.zshrc
echo "alias g='git'" >> ~/.bashrc
echo "[alias]\n  s = status\n  c = commit\n  a = add" >> ~/.gitconfig

echo "Copying nvim config..."
mkdir ~/.config
cp -r nvim ~/.config/nvim/

echo "Installing nvim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mkdir ~/bin
cp nvim.appimage ~/bin/nvim.appimage
echo "export PATH=~/bin/:$PATH" >> ~/.zshrc
echo "export PATH=~/bin/:$PATH" >> ~/.bashrc

echo "Installing nvim plugins..."
./nvim.appimage -c "PlugInstall" -c "qa"
echo "now run 'bash nvim/pylisp.sh', might fail because of local directory structure. Look at docs in nvim/README.md"
