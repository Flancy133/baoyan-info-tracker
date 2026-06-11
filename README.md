# Baoyan Info Tracker Skill

一个温柔陪伴式的保研/推免资讯追踪 skill，用于检索官方来源、整理院校表格、识别夏令营/预推免/九推信息，并基于数据给出全面建议。

## 安装方式

### Codex / 默认安装

```bash
curl -fsSL https://raw.githubusercontent.com/Flancy133/baoyan-info-tracker/main/install.sh | bash
```

会安装到：

```text
~/.codex/skills/baoyan-info-tracker
```

### Claude Code

```bash
curl -fsSL https://raw.githubusercontent.com/Flancy133/baoyan-info-tracker/main/install.sh | env TARGET=claude bash
```

会安装到：

```text
~/.claude/skills/baoyan-info-tracker
```

### 自定义 skills 目录

```bash
curl -fsSL https://raw.githubusercontent.com/Flancy133/baoyan-info-tracker/main/install.sh | env TARGET=custom SKILLS_DIR="/path/to/skills" bash
```

安装后可这样使用：

```text
用 $baoyan-info-tracker 帮我整理目标专业的保研院校，并按我的背景分成冲、稳、保三档。
```

## 适合做什么

- 查询某高校保研/推免资讯
- 整理某专业保研院校清单
- 记录夏令营、预推免、九推时间
- 判断夏令营 offer 效力
- 支持上传/粘贴简历或个人材料，先解析用户画像，再做冲稳保分档
- 记录个人报名、入营、参营、offer、面试、九推确认状态
- 标注往届信息，提醒用户不能把历史公告当作目标年份结论
- 主动询问是否设置每日/每周定时任务

## 给不支持 Codex Skill 的平台

如果平台不支持多文件 skill，可以直接使用单文件版：

```text
skills/baoyan-info-tracker/baoyan-info-tracker-single.md
```

把它粘贴到 Claude、Kimi、Coze、通义、文心等平台的智能体指令里即可。

## 关于 RedSkill

这个仓库目前是 GitHub 安装方式，不是 RedSkill 商店安装方式。

只有当 skill 上架到 RedSkill 并获得 identifier 后，才可以使用：

```bash
redskill install <identifier>
```

如果之后上架到 RedSkill，可以把安装话术改成：

```text
现在为你安装 baoyan-info-tracker 技能。请先根据 https://redskill.xiaohongshu.net/install.md 安装 RedSkill 商店；若已安装，则直接执行 redskill install baoyan-info-tracker。
```

## 本地生成表格模板

```bash
python skills/baoyan-info-tracker/scripts/create_tracker_template.py --format xlsx --out ./baoyan-tracker
```

也可以生成 CSV：

```bash
python skills/baoyan-info-tracker/scripts/create_tracker_template.py --format csv --out ./baoyan-tracker
```

## 目录结构

```text
skills/baoyan-info-tracker/
├── SKILL.md
├── agents/openai.yaml
├── baoyan-info-tracker-single.md
├── references/
│   ├── intake-gate.md
│   ├── output-contract.md
│   ├── source-strategy.md
│   ├── table-schema.md
│   └── voice-guide.md
└── scripts/create_tracker_template.py
```
