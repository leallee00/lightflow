# LightFlow 🪶

> Superpowers 的轻量替代方案 — 省 80% Token，智能按需启用

<p align="center">
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT"></a>
  <a href="https://github.com/leallee00/lightflow"><img src="https://img.shields.io/github/stars/leallee00/lightflow?style=flat" alt="GitHub Stars"></a>
  <a href="https://github.com/leallee00/lightflow/issues"><img src="https://img.shields.io/github/issues/leallee00/lightflow" alt="GitHub Issues"></a>
  <img src="https://img.shields.io/badge/startup_token-%3C3K-brightgreen" alt="Startup Token < 3K">
  <img src="https://img.shields.io/badge/Skills-3_core_%2B_1_optional-blue" alt="3 Core Skills">
</p>

## 为什么做 LightFlow？

Superpowers 是个好项目（25K+ Star），但它有三个硬伤：

| 问题 | Superpowers | LightFlow |
|------|-------------|----------|
| **启动 Token** | 22,000 Token | < 3,000 Token |
| **Skill 数量** | 14 个，全量加载 | 3 个核心，按需启用 |
| **小任务处理** | 改个变量名也走完整流程 | 智能阈值，小任务直接干 |
| **Skill 开关** | 部分平台不能单独关 | 每个 Skill 独立开关 |
| **代码量** | 977 行 | < 500 行（合计） |

**LightFlow 的核心哲学**：像引导一个成年人，而不是给实习生制定 SOP。

## 快速开始

### 安装

**一行命令安装**（在项目根目录下执行）：

```bash
curl -fsSL https://raw.githubusercontent.com/leallee00/lightflow/main/install.sh | bash
```

**或者手动安装**：

```bash
# 1. 克隆到项目根目录
git clone https://github.com/leallee00/lightflow.git .lightflow

# 2. 复制入口文件
cp .lightflow/CLAUDE.md ./

# 3. 配置项目规范
# 编辑 CLAUDE.md，填写你的技术栈和代码规范
```

### 配置

编辑 `config/threshold.md` 调整复杂度阈值：

```yaml
max_files_changed: 3    # 超过 3 个文件才走完整流程
max_lines_changed: 100  # 超过 100 行才走完整流程
risk_level: medium      # low / medium / high
```

## 核心 Skills

| Skill | 触发条件 | 行为 |
|-------|---------|------|
| **brainstorm** | 复杂任务或需求模糊 | 追最多 3 个问题，给选项，聊清楚就停 |
| **plan** | 跨模块/数据库/API 变更 | 3-8 步实施计划，标注风险 |
| **review** | 每次代码变更后 | 5 维度检查（类型/错误/性能/安全/测试） |

可选：

| Skill | 用途 |
|-------|------|
| **task-breakdown** | 大型重构时拆分子任务 |

## 兼容性

- ✅ Claude Code
- ✅ Codex
- ✅ Cursor（通过 .cursorrules）
- ✅ Trae
- ✅ 任何支持 SKILL.md 的 AI 编程工具

## 看它怎么工作

### 简单任务：改个变量名

```
用户："把 userName 改成 displayName"
→ 1. 直接搜 → 2. 替换 → 3. Review（✅通过） → 完成
耗时：15 秒  Token 开销：几乎为 0
```

### 中等任务：加一个新 API

```
用户："加一个获取用户列表的 API"
→ 1. 确认边界 → 2. 写代码 → 3. Review（⚠️建议分页）
耗时：2 分钟  Token 开销：低
```

### 复杂任务：重构支付模块

```
用户："把支付模块从 Stripe 迁移到支付宝"
→ 1. Brainstorm（确认迁移范围）
→ 2. Plan（列出 6 步迁移计划）
→ 3. 写代码 → 4. Review（检查安全性）
耗时：视规模而定  Token 开销：正常
```

> 💡 **一步都不多余** — 简单任务不加载 Brainstorm/Plan，不生成文档，不创建 Git Worktree。
> 只有真的复杂任务，才走完整流程。

## 与 Superpowers 详细对比

| 维度 | Superpowers | LightFlow |
|------|-------------|-----------|
| 启动 Token | ~22K | < 3K |
| 上下文窗口占用 | 11%+ | < 2% |
| Skill 数量 | 14（捆绑加载） | 3（独立开关） |
| 简单任务 | 也走完整流程 | 智能跳过 |
| 输出文档 | 生成 Spec/Plan 文件 | 只在对话中输出 |
| Git Worktree | 强制使用 | 不用 |
| 安装复杂度 | 需插件系统 | 复制文件即可 |
| 可定制性 | 低（锁定部分 Skill） | 高（全开） |

## 更新日志

### v0.1（2026-07-19）
- 初始版本
- 核心 3 Skill（brainstorm / plan / review）
- 复杂度阈值系统
- CLAUDE.md 集成

## License

MIT

## 致谢

- [Superpowers](https://github.com/obra/superpowers) — 启发了整个方向，感谢他们探路
- [fable-skills](https://github.com/DizzyMii/fable-skills) — 轻量思路的验证
