# 新项目初始化模板

在新的 AI 编程项目开始前，先用这个模板建立基础。

## 1. 安装 LightFlow

```bash
# 一行搞定
curl -fsSL https://raw.githubusercontent.com/leallee00/lightflow/main/install.sh | bash

# 或者手动
# git clone https://github.com/leallee00/lightflow.git .lightflow
# cp .lightflow/CLAUDE.md ./
```

## 2. 编辑 CLAUDE.md

填写项目信息：

```markdown
## 技术栈
- 前端：React + TypeScript + Tailwind
- 后端：Node.js + Express + Prisma
- 数据库：PostgreSQL
- 部署：Docker + Vercel

## 代码规范
- 命名：camelCase（JS/TS），snake_case（SQL）
- 测试：Jest，覆盖率 > 80%
- 提交信息：conventional commits
```

## 3. 设置阈值

编辑 `config/threshold.md`：
- 新项目初期：建议设低阈值（`max_files_changed: 2`）
- 项目稳定后：逐步提高

## 4. 开始开发

```bash
# 首次对话
"帮我搭建项目脚手架"

# 加功能
"加一个用户注册功能"  （中等任务 → Brainstorm + Code + Review）

# 小修改
"把按钮颜色改成蓝色"  （简单任务 → 直接改）
```
