#!/usr/bin/env bash
#
# LightFlow 🪶 一键安装脚本
# 用法: curl -fsSL https://raw.githubusercontent.com/leallee00/lightflow/main/install.sh | bash
#
# 在项目根目录下执行，会在当前目录安装 LightFlow

set -e

LIGHTFLOW_REPO="https://github.com/leallee00/lightflow.git"
LIGHTFLOW_DIR=".lightflow"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🪶 LightFlow 安装程序${NC}"
echo ""

# Check if we're in a project directory
if [ ! -f "package.json" ] && [ ! -f "Cargo.toml" ] && [ ! -f "pyproject.toml" ] && [ ! -f "go.mod" ] && [ ! -f "Gemfile" ] && [ ! -f "composer.json" ]; then
  echo -e "${YELLOW}⚠️  没有检测到项目配置文件（package.json / Cargo.toml 等）${NC}"
  echo -e "${YELLOW}   确认要在当前目录安装 LightFlow 吗？${NC}"
  read -p "继续? (Y/n) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]] && [[ ! $REPLY == "" ]]; then
    echo -e "${RED}已取消${NC}"
    exit 1
  fi
fi

# Clone LightFlow
if [ -d "$LIGHTFLOW_DIR" ]; then
  echo -e "${YELLOW}⚠️  $LIGHTFLOW_DIR 已存在，更新中...${NC}"
  cd "$LIGHTFLOW_DIR" && git pull && cd ..
else
  echo -e "${GREEN}📦 克隆 LightFlow...${NC}"
  git clone --depth=1 "$LIGHTFLOW_REPO" "$LIGHTFLOW_DIR"
fi

# Copy entry file
if [ -f "CLAUDE.md" ]; then
  echo -e "${YELLOW}⚠️  CLAUDE.md 已存在，备份为 CLAUDE.md.bak${NC}"
  cp CLAUDE.md CLAUDE.md.bak
fi
cp "$LIGHTFLOW_DIR/CLAUDE.md" ./

echo ""
echo -e "${GREEN}✅ LightFlow 安装完成！${NC}"
echo ""
echo -e "  下一步："
echo -e "  1. 编辑 CLAUDE.md，填写你的技术栈和代码规范"
echo -e "  2. 编辑 ${LIGHTFLOW_DIR}/config/threshold.md，调整复杂度阈值"
echo -e "  3. 开始用 AI 编程吧！"
echo ""
echo -e "  ${YELLOW}小任务直接干，复杂任务走流程 — 智能省 Token 🪶${NC}"
