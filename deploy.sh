cp .tmux.conf ~/
cp -r nvim ~/.config/nvim
nvim -c "PlugInstall" -c "qa"
echo "now run 'bash nvim/pylisp.sh', might fail because of local directory structure. Look at docs in nvim/README.md"
