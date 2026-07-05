# Codex 导入说明

## 最推荐的方式

把当前项目相关的 Obsidian 笔记复制或同步到前端项目仓库里，例如：

```text
你的项目/
  AGENTS.md
  docs/
    project-brief.md
    requirements.md
    design-system.md
    inspiration.md
    content.md
    decisions.md
```

然后在 `AGENTS.md` 写入：

```md
# Project Instructions

Before making frontend, design, or product changes, read these files:

- docs/project-brief.md
- docs/requirements.md
- docs/design-system.md
- docs/inspiration.md
- docs/content.md
- docs/decisions.md

Follow the requirements, visual direction, constraints, and decisions documented there.
When requirements conflict, ask for clarification before implementing.
```

## 临时导入方式

如果你不想复制文件，可以直接告诉 Codex：

```text
请先读取 C:\Users\12480\Documents\Obsidian Vault\前端设计模板 里的相关笔记，
再根据这些要求实现当前页面。
```

## 给 Codex 的提示词模板

```text
先阅读我的 Obsidian 前端设计资料：
C:\Users\12480\Documents\Obsidian Vault\前端设计模板

重点读取：
- 01 项目总览.md
- 02 需求清单.md
- 03 设计系统.md
- 06 灵感与参考.md
- 07 文案与内容.md

然后根据这些资料实现/优化当前前端页面。
如有冲突，以 02 需求清单 和 08 决策记录 为准。
```

## 图片资源建议

- 尽量使用本地图片，不要只贴网页截图链接。
- 图片文件名要表达内容，例如 `homepage-reference-stripe.png`。
- 在笔记中说明图片可借鉴的具体点。

## 注意事项

- Codex 更擅长读取 Markdown、代码、JSON、CSV。
- 不要只写“参考这个网站”，要写清楚参考它的布局、配色、动效、文案还是组件。
- 需求变更后，把变更原因写进 [[前端设计模板/08 决策记录]]。

