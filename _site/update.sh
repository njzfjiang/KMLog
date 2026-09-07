# 创建备份脚本 backup.sh
#!/bin/bash
DATE=$(date +%Y%m%d_%H%M%S)
cd  ~/Desktop/K_Space/blog/KMLog
git add .
git commit -m "更新 $DATE"
git push origin main