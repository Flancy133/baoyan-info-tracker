# Baoyan Info Tracker Skill

一个温柔陪伴式的保研/推免资讯追踪 skill，用于检索官方来源、整理院校表格、识别夏令营/预推免/九推信息，并基于数据给出全面建议。

## 一条命令安装

```bash
curl -fsSL https://raw.githubusercontent.com/Flancy133/baoyan-info-tracker/main/install.sh | bash
```

安装后可这样使用：

```text
用 $baoyan-info-tracker 帮我整理新传保研院校。
```

## 适合做什么

- 查询某高校保研/推免资讯
- 整理某专业保研院校清单
- 记录夏令营、预推免、九推时间
- 判断夏令营 offer 效力
- 记录个人报名、入营、参营、offer、面试、九推确认状态
- 标注往届信息，提醒用户不能把历史公告当作目标年份结论
- 主动询问是否设置每日/每周定时任务

## 给不支持 Codex Skill 的平台

如果平台不支持多文件 skill，可以直接使用单文件版：

```text
skills/baoyan-info-tracker/baoyan-info-tracker-single.md
```

把它粘贴到 Claude、Kimi、Coze、通义、文心等平台的智能体指令里即可。

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
