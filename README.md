# Baoyan Info Tracker Skill

一个面向中国高校保研/推免申请的资讯追踪 skill。它会用温柔陪伴式语气，先收集用户基础信息和个人背景，再检索官方来源，整理可筛选表格，维护可复用申请材料库，生成 Gap 清单，并基于数据给出“冲、稳、保”三档建议。

它不是单纯的择校建议模板，而是一个“官方信息检索 + 院校画像 + 材料复用 + Gap 清单 + 个人申请追踪 + 定时更新提醒”的工作流。

## 适合谁

这个 skill 适合：

- 正在准备保研/推免的本科生
- 想系统整理夏令营、预推免、九推信息的学生
- 需要按城市、学校层次、学科方向、学硕/专硕、学费筛选院校的人
- 想记录报名、入营、参营、offer、面试、九推确认状态的人
- 想复用申请材料、避免每个学校重复整理材料的人
- 想知道自己目前最该补学业、英语、科研、竞赛、实习/作品、材料表达还是面试表达的人
- 需要根据个人背景做“冲、稳、保”分档的人
- 想让 AI 每日/每周检查新公告、截止提醒、名单发布的人
- 陪学生做保研规划的学长学姐、辅导员、升学顾问

它不只适用于新闻传播，也适用于计算机、法学、金融、材料、管理、教育、中文、社会学等专业。专业方向必须来自用户输入，skill 不会默认用户是某一个专业。

## 不适合什么

这个 skill 不适合：

- 代替学校官方公告做最终报名依据
- 承诺录取概率或保证 offer
- 在没有用户背景时强行推荐冲稳保
- 只看排名、城市或学校层次做片面推荐
- 用第三方平台信息替代官网、研招网、学院官网等官方来源

如果只查到往届公告，skill 会明确标注“往届信息/历史参考”，提醒用户不能把历史日期当作目标年份结论。

## 核心功能

### 1. 第一轮信息收集

skill 会先判断用户是否已经提供足够信息。信息不足时，它不会直接推荐学校，而是先温柔收集：

- 目标年份/届次
- 目标专业/方向
- 单校查询还是院校清单
- 城市、地区、学校层次偏好
- 学硕/专硕、学费/学制限制
- 本科院校层次、专业、排名/绩点、英语、科研、竞赛、实习、论文、作品集
- 是否记录个人申请进度
- 是否设置每日/每周定时任务

支持交互式 HTML 页面：

```text
skills/baoyan-info-tracker/assets/intake-form.html
```

如果平台不能打开交互页面，会退回 Markdown 问卷。

### 2. 简历/个人材料解析

用户可以上传或粘贴：

- 简历
- 个人陈述
- 成绩单摘要
- 经历清单
- 作品集说明

skill 会先提取 `用户画像`，再做冲稳保分档。缺失字段会标为 `待补充`，不会编造。手机号、邮箱、身份证号、住址等敏感信息不会在最终输出中展示。

### 3. 官方资讯检索

检索优先级：

1. 教育部、学信网、全国推荐免试攻读研究生信息公开暨管理服务系统
2. 高校研究生院/研究生招生网
3. 学院/学部/系官网
4. 学校或学院官方报名系统
5. 官方微信公众号
6. 第三方平台只作线索，不能单独作为结论

固定入口：

- 学信网推免服务系统：https://yz.chsi.com.cn/tm/

### 4. 夏令营、预推免、九推追踪

表格会记录：

- 是否有夏令营
- 夏令营时间
- 夏令营是否有 offer 效力
- 是否有预推免
- 预推免时间
- 是否通常九推
- 九推时间
- 报名入口
- 材料要求
- 考核形式
- 地点
- 结果发布日期

### 5. offer 效力判断

skill 不会把“优秀营员”自动等同于“铁 offer”。

会区分：

- 强效力/近似铁 offer
- 弱效力/非铁 offer
- 无效力
- 未披露
- 不适用

判断必须引用公告依据。

### 6. 冲、稳、保分档

推荐档位只有三档：

- `冲`
- `稳`
- `保`

分档是相对用户背景的，不是学校固定属性。比如本科是 211 的用户申请多数 985 项目，默认应先按 `冲` 评估，不能直接标成 `稳`。没有用户画像时，skill 不会强行分档。

### 7. Gap 清单

skill 会根据用户画像、目标院校画像、项目要求和材料库，判断用户当前最需要补强的板块：

- 学业
- 英语
- 科研
- 竞赛
- 实习/作品
- 材料表达
- 面试表达
- 信息核验

Gap 清单会按 `P0/P1/P2` 标优先级。比如 P0 通常是会影响报名资格、材料完整性或高权重考核的缺口；P1 是会明显影响冲/稳项目竞争力的短板；P2 是长期润色或锦上添花。

它不会简单说“提升综合实力”，而是会写清楚：影响哪个目标、当前证据是什么、目标要求是什么、差距在哪里、下一步怎么补。

### 8. 表格化追踪

默认会维护 9 张表：

- `用户画像`
- `院校库`
- `院校画像`
- `项目节点`
- `材料库`
- `Gap清单`
- `我的申请`
- `更新日志`
- `提醒队列`

也可以生成 Excel/CSV 模板。

### 9. 材料库与材料包

很多保研材料可以复用，但不同学校会有格式、命名、字数、盖章、研究方向和提交入口差异。skill 会维护 `材料库`，并在每次提交前根据学校官方公告生成材料包。

材料会被分成：

- 可直接复用：如基础简历、成绩单、英语证明、获奖证明
- 部分复用：如个人陈述、研究计划、作品集说明
- 需单独准备：如指定模板、推荐信、盖章排名证明、报名系统生成表

当用户问“这个学校要交哪些材料”或“这次提交材料帮我整理一下”时，skill 会输出：

- 可复用材料
- 需要定制材料
- 待补材料
- 学校特殊要求
- 提交前检查清单

材料包模板：

```text
skills/baoyan-info-tracker/assets/material-package-template.md
```

### 10. 定时任务提醒

skill 会主动询问用户是否需要每日/每周检查：

- 新公告
- 补充通知
- 延期通知
- 报名截止
- 入营名单
- 优秀营员名单
- 拟录取名单
- 九推待录取确认

是否真的能自动定时执行，取决于用户所在 agent 平台是否支持自动化/定时任务。

## 输出示例

用户可以这样说：

```text
用 $baoyan-info-tracker 帮我整理计算机保研院校，我本科是 211，专业前 10%，想看北京和江浙沪，按冲稳保分档。
```

或者：

```text
用 $baoyan-info-tracker 帮我查复旦大学目标专业的夏令营和预推免信息，标注是否是往届公告。
```

或者：

```text
我上传简历，你先帮我生成用户画像，再查适合我的保研院校。
```

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

## 给不支持多文件 Skill 的平台

如果平台不支持 `SKILL.md + references/ + assets/` 这种目录结构，可以使用单文件版：

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

生成 Excel：

```bash
python skills/baoyan-info-tracker/scripts/create_tracker_template.py --format xlsx --out ./baoyan-tracker
```

生成 CSV：

```bash
python skills/baoyan-info-tracker/scripts/create_tracker_template.py --format csv --out ./baoyan-tracker
```

同时生成 Excel 和 CSV：

```bash
python skills/baoyan-info-tracker/scripts/create_tracker_template.py --format both --out ./baoyan-tracker
```

## 文件结构

```text
skills/baoyan-info-tracker/
├── SKILL.md
├── agents/openai.yaml
├── assets/
│   ├── intake-form.html
│   └── material-package-template.md
├── baoyan-info-tracker-single.md
├── references/
│   ├── intake-gate.md
│   ├── output-contract.md
│   ├── source-strategy.md
│   ├── table-schema.md
│   └── voice-guide.md
└── scripts/
    └── create_tracker_template.py
```

## 隐私与边界

- 简历和个人材料只用于提取保研决策需要的用户画像。
- 不在最终输出中展示手机号、邮箱、身份证号、住址等敏感信息。
- 所有重要结论都应有官方来源或标为待核验。
- 往届公告只能作为时间窗口参考，不能作为目标年份的最终依据。
- skill 不承诺录取结果，只提供信息追踪、材料整理和风险提示。
