# Codex 导入说明

## 推荐提示词

```text
请先读取我的项目设计笔记：
C:\Users\12480\Documents\Obsidian Vault\图书管理系统前端设计

再修改前端项目：
C:\Users\12480\Desktop\web应用开发\frontend

重点读取：
- 01 项目总览.md
- 02 需求清单.md
- 03 设计系统.md
- 04 页面模板.md
- 05 组件模板.md
- 07 文案与内容.md
- 08 决策记录.md

修改时保持当前 Vue 3 + TypeScript + Element Plus 的实现方式，
不要破坏现有权限、路由、接口和深绿米色视觉系统。
```

## Codex 修改前应检查

- `frontend/src/router/index.ts`：路由、页面 title、权限 meta。
- `frontend/src/views/layout/index.vue`：侧边栏、顶部标题、角色菜单。
- `frontend/src/style.css`：全局设计变量、Element Plus 覆盖样式、响应式规则。
- 对应页面的 `frontend/src/views/**/index.vue` 或读者门户页面。
- `frontend/src/api/request.ts`：请求拦截、错误提示、登录失效处理。
- `frontend/src/store/auth.ts`：用户角色、会话、登录跳转相关逻辑。

## 新增页面规则

- 在 `router/index.ts` 添加路由和 `meta.title`。
- 员工页面加 `requiresStaff: true`。
- 管理员页面加 `requiresAdmin: true`。
- 读者页面加 `requiresReader: true`。
- 页面容器使用与现有页面一致的最大宽度和 `glass-card` 风格。
- 表格页面要有筛选、分页、加载、空状态。

## 修改设计规则

- 保持主色 `#1f6b50`。
- 保持页面背景米色，不要改成蓝紫渐变。
- 保持侧边栏深绿。
- 使用 Element Plus Icons，不要手写重复 SVG 图标。
- 表格操作列固定右侧，破坏性操作保留确认框。
- 移动端必须检查侧边栏收缩、表单换行和表格溢出。

## 验证命令

```powershell
cd C:\Users\12480\Desktop\web应用开发\frontend
npm run build
```

如需启动本地预览：

```powershell
cd C:\Users\12480\Desktop\web应用开发\frontend
npm run dev
```

