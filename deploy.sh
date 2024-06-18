echo "Copying tmux config..."
cp .tmux.conf ~/

echo "git aliases/shortcuts..."
echo "alias g='git'" >> ~/.zshrc
echo "alias g='git'" >> ~/.bashrc
echo "[alias]
  s = status
  c = commit
  a = add" >> ~/.gitconfig

echo "Copying nvim config..."
mkdir ~/.config
cp -r nvim ~/.config/nvim/

echo "export PATH=~/bin/:$PATH
alias vim=~/bin/nvim
alias vmi=~/bin/nvim
alias ivm=~/bin/nvim
alias imm=~/bin/nvim
alias miv=~/bin/nvim
alias mvi=~/bin/nvim
alias vi=~/bin/nvim
alias vi=~/bin/nvim
" >> ~/.zshrc
echo "export PATH=~/bin/:$PATH
alias vim=~/bin/nvim
alias vmi=~/bin/nvim
alias ivm=~/bin/nvim
alias imm=~/bin/nvim
alias miv=~/bin/nvim
alias mvi=~/bin/nvim
alias vi=~/bin/nvim
alias vi=~/bin/nvim
" >> ~/.bashrc

echo "Installing neovim, gcc, curl, git..."
apt install -y gcc curl make git neovim

# On Ubuntu 22.04 and getting "dlopen(): error loading libfuse.so.2" ?
# Try `apt install libfuse2` per https://askubuntu.com/questions/1363783/cant-run-an-appimage-on-ubuntu-20-04

echo "Installing nvim plugins..."
nvim -c "PlugInstall" -c "qa"
echo "now run 'bash nvim/pylisp.sh', might fail because of local directory structure. Look at docs in nvim/README.md"
