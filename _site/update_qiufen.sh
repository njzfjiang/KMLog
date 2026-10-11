#!/bin/bash

DATE=$(date +%Y%m%d_%H%M%S)

# 切到当前仓库根目录（本脚本所在目录）
cd "$(dirname "$0")"

POST="_posts/2026-09-27-qiufen-fox.md"

if [ ! -f "$POST" ]; then
  echo "Error: 找不到 $POST，先确认文件路径是不是改名/挪走了～"
  exit 1
fi

# 只添加这篇文章（而不是 git add .）
git add "$POST"

echo "下面是即将提交的改动："
git status

# 简单确认一下，防止手滑
read -p "确认提交这些改动吗？(y/N) " ans
if [[ "$ans" != "y" && "$ans" != "Y" ]]; then
  echo "已取消提交。"
  exit 0
fi

# 提交信息可以带上日期，和原来的 update.sh 风格统一一点
git commit -m "秋分 · 狐狸记 更新 $DATE"

# 使用远程 origin。凭证交给系统 credential helper / GitHub CLI 管理，
# 不要把 PAT 写进 remote URL，以免进入 shell history、日志或截图。
# 可先用 `git remote -v` 核对地址，再单独配置认证。

git push origin main

echo "秋分文章已提交并推送～"
