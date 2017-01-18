# 初回起動時にデスクトップに移動（現状は無効化）
#cd ${USERPROFILE}
#cd Desktop

# open コマンドと Windows の start コマンドを紐付け
alias open=start

# 基本的な設定
alias ll="ls -la --color=always"

if [ -f /etc/bash_completion.d/git-prompt.sh ]; then
  source /etc/bash_completion.d/git-prompt.sh
fi

# byobu の初期化
if test -e ~/.byoburc; then source ~/.byoburc; fi

if [ -n "$BYOBU_CONFIG_DIR" ]; then
  cd /c/workspace/
  sshpass -p ${PASSWORD} ssh -p 2222 ${USERNAME}@localhost
fi
