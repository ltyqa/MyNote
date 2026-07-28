 通用型「原点色彩扩散与收回」全屏转场设计方案与接入指南
(Universal Origin-Based Color Expansion Page Transition Specification)

本指南旨在提供一套**高可复用、通用型**的页面转场与交互组件设计规范。该方案解耦了具体业务场景与特定配色，支持灵活配置主题色、动画曲线、扩散机制与收回方向，可无缝适配个人作品集、企业官网、SaaS 平台、电商展示以及数字展厅等各类 Web 项目。

---

## 一、 设计理念与适用场景

### 1.1 核心设计理念

“原点色彩扩散转场”是一种强交互感、极具视觉冲击力的页面过渡形式：
- **操作反馈直观 (Origin-Aware)**：转场色彩以用户点击的位置（按钮、卡片、菜单项）为起点向外波浪式扩散，建立起操作动作与全屏变化的强关联。
- **视觉连贯性 (Color Continuum)**：将元素自身的品牌色/主题色无缝扩展至全屏，随后在蒙版全屏覆盖时完成新页面加载，最后优雅收回蒙版。
- **品牌调性高度契合 (Themeable)**：只需更改色彩参数，即可从先锋高饱和风格秒级切换为暗黑科技风或高级奢华风。

### 1.2 适用项目类型与配色推荐

| 项目类型 | 设计风格 | 建议配色方案 | 转场收回效果推荐 |
| :--- | :--- | :--- | :--- |
| **先锋创意 / 艺术设计** | 高饱和新粗犷主义 | 霓虹黄 `#E4D515` / 电光蓝 `#4ACFED` / 荧光绿 `#ABF7A1` | 向上/向侧平移卷缩 (`slide-up`) |
| **企业 SaaS / 科技平台** | 极简暗黑 / 沉浸式科技 | 深空灰 `#121316` / 极光蓝 `#0066FF` / 霓光紫 `#7C3AED` | 原点反向收缩 (`reverse-shrink`) |
| **高端奢华 / 品牌官网** | 优雅典雅 / 莫兰迪色系 | 雾霭蓝 `#8EA4B8` / 暖沙米 `#E8E2D5` / 橄榄绿 `#5C6B57` | 柔和渐隐淡出 (`fade-out`) |
| **电商平台 / 多业务线** | 分类语义化主题 | 依据商品/板块分类（如服装、数码、美妆对应不同色彩） | 幕布对开/收缩 (`curtain`) |

---

## 二、 核心参数与 CSS 变量设计系统

通过定义一套通用的 CSS Custom Properties（变量），使得转场特效的颜色、速度、缓动函数与运动方向均可在全局或单元素上轻松复写：

### 2.1 CSS 全局变量声明

```css
:root {
  /* 基础与默认主题 */
  --transition-default-color: #3B82F6; /* 默认转场主题色 (可被 data-transition-color 覆盖) */
  
  /* 动画时间参数 */
  --transition-expand-duration: 400ms;  /* 扩散覆盖阶段时长 */
  --transition-retract-duration: 450ms; /* 收回揭晓阶段时长 */
  
  /* 缓动曲线 (Bezier 贝塞尔曲线) */
  --transition-expand-ease: cubic-bezier(0.77, 0, 0.175, 1);  /* 强烈冲力扩散 */
  --transition-retract-ease: cubic-bezier(0.25, 1, 0.5, 1);    /* 柔和平滑收回 */
  
  /* 层级定义 */
  --transition-z-index: 99999;
}
```

---

## 三、 多样化转场收回动画模式 (Transition Retract Modes)

根据不同项目的视觉诉求，转场第二阶段的“收回蒙版”提供以下四种通用模式：

1. **Slide Up/Left/Right/Down（平移卷缩）**：蒙版保持覆盖，沿指定方向平移滑出视口（最推荐，有明确的空间层级感）。
2. **Reverse Shrink（原点反向收缩）**：蒙版向点击原点（或屏幕中心）缩回至消失。
3. **Fade Out（渐隐淡出）**：蒙版透明度 `opacity` 从 1 渐变为 0，适合优雅平缓的叙事体验。
4. **Scale Down（中心缩放）**：蒙版在整体缩小的同时渐隐。

---

## 四、 通用型全栈实现 Blueprint (Universal Blueprint)

下面提供一套**无第三方依赖、标准 DOM + CSS 原生实现**的通用代码架构。

### 4.1 通用 HTML 结构与 Data 属性定义

使用 `data-transition-*` 自定义属性绑定转场控制：

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>通用转场组件示例</title>
  <link rel="stylesheet" href="page-transition.css">
</head>
<body>

  <!-- 通用转场遮罩节点 -->
  <div class="ui-page-transition" id="pageTransitionOverlay" aria-hidden="true"></div>

  <!-- 页面顶部导航栏示例 -->
  <header class="app-header">
    <div class="brand-logo">CORE DESIGN</div>
    <nav class="nav-links">
      <!-- 通过 data-transition-color 自由配置不同按钮的色彩 -->
      <a href="#product" class="btn" data-transition-color="#0066FF" data-retract-mode="slide-up">产品中心</a>
      <a href="#solutions" class="btn" data-transition-color="#7C3AED" data-retract-mode="slide-up">解决方案</a>
      <a href="#about" class="btn" data-transition-color="#10B981" data-retract-mode="reverse-shrink">关于我们</a>
    </nav>
  </header>

  <!-- 页面主体示例 -->
  <main class="app-main">
    <section class="hero-section">
      <h1>通用原点色彩扩散转场</h1>
      <p>点击任何带有 <code>data-transition-color</code> 的元素即可预览通用转场。</p>
    </section>
  </main>

  <script src="page-transition.js"></script>
</body>
</html>
```

### 4.2 标准化 CSS (page-transition.css)

```css
/* ========================================================
   通用转场遮罩层样式 (UI Page Transition Overlay)
   ======================================================== */
.ui-page-transition {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  z-index: var(--transition-z-index, 99999);
  pointer-events: none;
  background-color: var(--transition-color, var(--transition-default-color));
  clip-path: circle(0% at 50% 50%);
  will-change: clip-path, transform, opacity;
  opacity: 1;
}

/* 阶段 1：点击原点向外扩散 */
.ui-page-transition.is-expanding {
  pointer-events: auto;
  animation: transitionExpand var(--transition-expand-duration) var(--transition-expand-ease) forwards;
}

/* 阶段 2A：模式 A - 向上卷起收回 (Slide Up) */
.ui-page-transition.is-retracting-slide-up {
  pointer-events: none;
  animation: retractSlideUp var(--transition-retract-duration) var(--transition-retract-ease) forwards;
}

/* 阶段 2B：模式 B - 原点反向收缩 (Reverse Shrink) */
.ui-page-transition.is-retracting-reverse-shrink {
  pointer-events: none;
  animation: retractReverseShrink var(--transition-retract-duration) var(--transition-retract-ease) forwards;
}

/* 阶段 2C：模式 C - 渐隐淡出 (Fade Out) */
.ui-page-transition.is-retracting-fade-out {
  pointer-events: none;
  animation: retractFadeOut var(--transition-retract-duration) var(--transition-retract-ease) forwards;
}

/* ========================================================
   Keyframes 关键帧动画集
   ======================================================== */

/* 扩散覆盖全屏 */
@keyframes transitionExpand {
  0% {
    clip-path: circle(0% at var(--click-x, 50%) var(--click-y, 50%));
  }
  100% {
    clip-path: circle(150% at var(--click-x, 50%) var(--click-y, 50%));
  }
}

/* 向上平移收回 */
@keyframes retractSlideUp {
  0% {
    clip-path: circle(150% at 50% 50%);
    transform: translateY(0%);
  }
  100% {
    clip-path: circle(150% at 50% 50%);
    transform: translateY(-100%);
  }
}

/* 原点反向收缩收回 */
@keyframes retractReverseShrink {
  0% {
    clip-path: circle(150% at var(--click-x, 50%) var(--click-y, 50%));
  }
  100% {
    clip-path: circle(0% at var(--click-x, 50%) var(--click-y, 50%));
  }
}

/* 渐隐收回 */
@keyframes retractFadeOut {
  0% {
    clip-path: circle(150% at 50% 50%);
    opacity: 1;
  }
  100% {
    clip-path: circle(150% at 50% 50%);
    opacity: 0;
  }
}
```

### 4.3 面向对象的 JavaScript 控制器 (page-transition.js)

封装为纯 ES6 / Class 模式，无任何框架绑定，可随时集成至 React / Vue / Svelte 或原生项目：

```javascript
/**
 * Universal Page Transition Controller
 * 通用原点色彩扩散转场控制器
 */
class PageTransitionController {
  constructor(options = {}) {
    this.overlay = document.getElementById(options.overlayId || 'pageTransitionOverlay');
    this.defaultColor = options.defaultColor || '#3B82F6';
    this.defaultRetractMode = options.defaultRetractMode || 'slide-up';
    this.onPageUpdate = options.onPageUpdate || null;

    if (!this.overlay) {
      console.warn('PageTransitionController: 未找到转场 Overlay 节点。');
      return;
    }

    this.initListeners();
  }

  /**
   * 自动监听页面中带有 [data-transition-color] 属性的元素
   */
  initListeners() {
    document.addEventListener('click', (event) => {
      const trigger = event.target.closest('[data-transition-color], [data-page-transition]');
      if (!trigger) return;

      // 如果是页面跳转链接，阻止默认刷新
      if (trigger.tagName === 'A' && trigger.getAttribute('href')?.startsWith('#')) {
        event.preventDefault();
      }

      // 获取触发元素定义的配置
      const color = trigger.getAttribute('data-transition-color') || this.defaultColor;
      const mode = trigger.getAttribute('data-retract-mode') || this.defaultRetractMode;
      const targetUrl = trigger.getAttribute('href');

      // 获取点击坐标
      const originX = event.clientX;
      const originY = event.clientY;

      this.startTransition({
        x: originX,
        y: originY,
        color: color,
        mode: mode,
        onComplete: () => {
          if (this.onPageUpdate) {
            this.onPageUpdate(targetUrl, trigger);
          }
        }
      });
    });
  }

  /**
   * 手动触发转场 API
   */
  startTransition({ x = window.innerWidth / 2, y = window.innerHeight / 2, color, mode = 'slide-up', onComplete }) {
    const activeColor = color || this.defaultColor;

    // 设置 CSS 局部变量
    this.overlay.style.setProperty('--click-x', `${x}px`);
    this.overlay.style.setProperty('--click-y', `${y}px`);
    this.overlay.style.setProperty('--transition-color', activeColor);

    // 重置所有 class 状态
    this.overlay.className = 'ui-page-transition';
    void this.overlay.offsetWidth; // 触发 DOM Reflow

    // 1. 启动扩散
    this.overlay.classList.add('is-expanding');

    // 2. 扩散完成 -> 执行数据/路由切换 -> 启动收回
    setTimeout(() => {
      if (typeof onComplete === 'function') {
        onComplete();
      }

      this.overlay.classList.remove('is-expanding');
      this.overlay.classList.add(`is-retracting-${mode}`);

      // 3. 收回完成 -> 清理动画状态
      setTimeout(() => {
        this.overlay.className = 'ui-page-transition';
        this.overlay.style.transform = '';
        this.overlay.style.opacity = '';
      }, 500);

    }, 400); // 与 CSS --transition-expand-duration 保持一致
  }
}

// 初始化全局实例
document.addEventListener('DOMContentLoaded', () => {
  window.pageTransition = new PageTransitionController({
    defaultColor: '#3B82F6',
    defaultRetractMode: 'slide-up',
    onPageUpdate: (url, triggerEl) => {
      console.log(`[PageTransition] 页面切至: ${url}`);
    }
  });
});
```

---

## 五、 最佳实践与性能/无障碍优化 (Best Practices)

1. **减弱动画适配 (Accessibility / Reduced Motion)**:
   为习惯减弱动效的用户提供回退机制：
   ```css
   @media (prefers-reduced-motion: reduce) {
     .ui-page-transition {
       animation: none !important;
       transition: opacity 200ms ease;
     }
   }
   ```
2. **GPU 硬件加速**:
   - 动画属性仅使用 `clip-path`、`transform` 与 `opacity`。
   - 保留 `will-change: clip-path, transform, opacity` 提示浏览器开辟独立图层渲染，确保 60FPS/120FPS 丝滑体验。
3. **单页应用 (Vue / React / Next.js) 路由集成**:
   - 在 Vue Router 的 `beforeEach` 或 React Router 的 Location Change 挂钩中调用 `pageTransition.startTransition()`，在路由加载完成后触发收回动画即可。
