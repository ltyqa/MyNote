# Project Simply - 全屏色彩扩散与收回转场设计方案 (Design System & Page Transition)

本文档提取自 [Project Simply](https://projectsimply.com/) 官方网站的交互设计与转场特效，详细拆解其核心视觉语言、按钮样式以及**点击色彩从按钮扩充至全屏再收回**的核心实现原理与完整代码 Blueprint。

---

## 一、 视觉设计系统 (Design System)

Project Simply 采用了**新复古/新粗犷主义 (Neo-Brutalism)** 结合**动感先锋色彩 (Vivid Cultural Aesthetics)** 的设计风格。

### 1.1 品牌核心调色板 (Color Palette)

每个业务板块（Sectors）与案例（Work Items）均绑定独有的高饱和/高明度 Accent Color，形成极强视觉记忆点：

```css
:root {
  /* 基础对比色 */
  --bg-beige: #F5F2EB;       /* 主背景米白色 */
  --text-dark: #161616;      /* 极深黑文本 */
  --brand-purple: #754AF0;   /* 品牌标志紫 */

  /* 板块专属 Accent 色彩 (通过 data-color 传递) */
  --color-blue: #4ACFED;     /* 电光蓝 (Fashion & Talent) */
  --color-pink: #FFB5D6;     /* 霓虹粉 (Music & Events) */
  --color-green: #ABF7A1;    /* 荧光绿 (Venues & Co-working) */
  --color-yellow: #E4D515;   /* 亮金黄 (Featured Case Studies) */
}
```

### 1.2 按钮与卡片交互设计 (Buttons & Cards UI)

- **胶囊/圆角形状**：配合无衬线加粗字体（如 `Inter` / `Outfit` / `Space Grotesk`）。
- **Hover 反馈**：鼠标悬停时触发微交互，例如渐变扩展、底色突变、微放大或跑马灯字幕（Marquee）。
- **色彩属性绑定**：每个可交互转场元素添加 `data-color` 属性与 `data-work-item-link` 标记。

---

## 二、 全屏色彩扩散与收回转场原理 (Transition Mechanism)

### 2.1 三阶段转场流程 (Three-Phase Flow)

```
[阶段 1: 点击触发]  ---> [阶段 2: 色彩全屏扩散]  ---> [阶段 3: 页面替换与收回]
点击按钮/卡片          遮罩层自点击坐标/按钮中心     遮罩层充满全屏，完成内容加载后
读取 data-color        向外以圆形 (clip-path) 扩大   向上/向侧边平移或反向收缩隐去
```

1. **触发与原点计算 (Origin Calculation)**：
   - 监听含有转场标记的链接点击事件（例如 `[data-color]`）。
   - 获取点击点的视口坐标 `(x, y)`，作为圆形扩散的中心点。
2. **扩散退出 (Exit Transition / Expand)**：
   - 激活全屏 Overlay 元素 `.psPageTransition`。
   - 将 Overlay 的背景颜色设为目标元素的 `data-color`。
   - 使用 CSS `clip-path: circle(0% at x y)` 动画过渡至 `circle(150% at x y)`，在 350ms - 450ms 内瞬间铺满整个屏幕。
3. **收回进入 (Entrance Transition / Retract)**：
   - 当 Overlay 充满全屏后，触发页面渲染或 AJAX 内容无刷新替换。
   - Overlay 执行收回动画（通过向上滑动 `transform: translateY(-100%)` 或反向 `clip-path` 收缩），露出新页面。

---

## 三、 完整可运行代码实现 (Implementation Blueprint)

包含完整 HTML、CSS 与 JavaScript 逻辑，可以直接复制运行预览效果。

### 3.1 HTML 结构

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Project Simply Color Transition Effect</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

  <!-- 转场遮罩层 -->
  <div class="psPageTransition" id="pageTransitionOverlay"></div>

  <!-- 顶部导航栏 -->
  <header class="header">
    <div class="logo">PROJECT SIMPLY</div>
    <nav class="nav-sectors">
      <a href="#fashion" class="sector-btn" data-color="#4ACFED">Fashion & Talent</a>
      <a href="#music" class="sector-btn" data-color="#FFB5D6">Music & Events</a>
      <a href="#venues" class="sector-btn" data-color="#ABF7A1">Venues & Co-working</a>
    </nav>
  </header>

  <!-- 主体内容卡片流 -->
  <main class="content" id="appContent">
    <section class="hero">
      <h1>A brand, website and AI studio for cultural pioneers</h1>
      <p>点击下方卡片或导航按钮预览全屏色彩扩充与收回转场特效</p>
    </section>

    <div class="grid">
      <div class="card" data-transition-link data-color="#4ACFED">
        <div class="card-media" style="background: #2a3a4a;"></div>
        <div class="card-title">DreamHouse</div>
      </div>
      <div class="card" data-transition-link data-color="#FFB5D6">
        <div class="card-media" style="background: #4a2a3a;"></div>
        <div class="card-title">Hyde Park Winter Wonderland</div>
      </div>
      <div class="card" data-transition-link data-color="#ABF7A1">
        <div class="card-media" style="background: #2a4a3a;"></div>
        <div class="card-title">Street Food Circus</div>
      </div>
      <div class="card" data-transition-link data-color="#E4D515">
        <div class="card-media" style="background: #4a4a2a;"></div>
        <div class="card-title">The Warehouse Project</div>
      </div>
    </div>
  </main>

  <script src="script.js"></script>
</body>
</html>
```

### 3.2 CSS 样式 (style.css)

```css
:root {
  --bg-beige: #F5F2EB;
  --text-dark: #161616;
  --transition-out-duration: 0.4s;
  --transition-in-duration: 0.5s;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  background-color: var(--bg-beige);
  color: var(--text-dark);
  font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  min-height: 100vh;
  overflow-x: hidden;
}

/* 顶部导航 */
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 2rem 4rem;
}

.logo {
  font-weight: 800;
  letter-spacing: -0.5px;
  font-size: 1.25rem;
}

.nav-sectors {
  display: flex;
  gap: 1rem;
}

.sector-btn {
  text-decoration: none;
  color: var(--text-dark);
  font-weight: 600;
  padding: 0.75rem 1.5rem;
  border-radius: 999px;
  background-color: transparent;
  transition: transform 0.2s ease, filter 0.2s ease;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
}

.sector-btn:hover {
  transform: translateY(-2px);
}

/* 关联色彩分类标签 */
.sector-btn[data-color="#4ACFED"] { background-color: #4ACFED; }
.sector-btn[data-color="#FFB5D6"] { background-color: #FFB5D6; }
.sector-btn[data-color="#ABF7A1"] { background-color: #ABF7A1; }

/* 内容区域 */
.content {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;
}

.hero {
  margin-bottom: 4rem;
}

.hero h1 {
  font-size: 3.5rem;
  line-height: 1.1;
  max-width: 800px;
  margin-bottom: 1rem;
}

/* 卡片网格 */
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 2rem;
}

.card {
  border-radius: 16px;
  overflow: hidden;
  cursor: pointer;
  background: #ffffff;
  transition: transform 0.3s cubic-bezier(0.25, 1, 0.5, 1);
  position: relative;
}

.card:hover {
  transform: scale(1.02);
}

.card-media {
  height: 320px;
  width: 100%;
}

.card-title {
  padding: 1.25rem 1.5rem;
  font-weight: 700;
  font-size: 1.1rem;
}

/* ========================================================
   核心：全屏色彩扩散与收回遮罩 (psPageTransition)
   ======================================================== */
.psPageTransition {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  z-index: 9999;
  pointer-events: none;
  background-color: transparent;
  clip-path: circle(0% at 50% 50%);
  will-change: clip-path, transform;
}

/* 第一阶段：从点击位置扩散扩张至 150% 全屏 */
.psPageTransition.is-expanding {
  pointer-events: auto;
  animation: circleExpand var(--transition-out-duration) cubic-bezier(0.77, 0, 0.175, 1) forwards;
}

/* 第二阶段：向上/侧向收回揭晓新页面 */
.psPageTransition.is-retracting {
  pointer-events: none;
  animation: slideRetract var(--transition-in-duration) cubic-bezier(0.77, 0, 0.175, 1) forwards;
}

@keyframes circleExpand {
  0% {
    clip-path: circle(0% at var(--click-x, 50%) var(--click-y, 50%));
  }
  100% {
    clip-path: circle(150% at var(--click-x, 50%) var(--click-y, 50%));
  }
}

@keyframes slideRetract {
  0% {
    clip-path: circle(150% at 50% 50%);
    transform: translateY(0%);
  }
  100% {
    clip-path: circle(150% at 50% 50%);
    transform: translateY(-100%); /* 向上卷起收回 */
  }
}
```

### 3.3 JavaScript 交互逻辑 (script.js)

```javascript
document.addEventListener('DOMContentLoaded', () => {
  const overlay = document.getElementById('pageTransitionOverlay');

  // 获取所有支持转场特效的触发元素
  const triggerElements = document.querySelectorAll('[data-color]');

  triggerElements.forEach(element => {
    element.addEventListener('click', (event) => {
      event.preventDefault();

      // 1. 获取点击位置 (相对于 Viewport)
      const x = event.clientX;
      const y = event.clientY;

      // 2. 获取该元素定义的色彩
      const accentColor = element.getAttribute('data-color') || '#754AF0';

      // 3. 执行全屏扩大转场
      triggerColorTransition({ x, y, color: accentColor }, () => {
        // 在遮罩完全覆盖页面后，可在此处加载/替换新页面内容 (例如 fetch API 或 SPA 路由)
        console.log(`页面逻辑更新：已切换至 ${element.textContent || '新页面'}`);
      });
    });
  });

  /**
   * 触发转场控制函数
   */
  function triggerColorTransition({ x, y, color }, onCoveredCallback) {
    // 设置点击坐标变量与背景色
    overlay.style.setProperty('--click-x', `${x}px`);
    overlay.style.setProperty('--click-y', `${y}px`);
    overlay.style.backgroundColor = color;

    // 清理之前的 class
    overlay.classList.remove('is-expanding', 'is-retracting');
    
    // 强制重绘以确保动画生效
    void overlay.offsetWidth;

    // 步骤 A: 展开全屏
    overlay.classList.add('is-expanding');

    // 展开动画完成后 (约 400ms)
    setTimeout(() => {
      // 执行页面数据/DOM 替换
      if (typeof onCoveredCallback === 'function') {
        onCoveredCallback();
      }

      // 步骤 B: 向上卷起/收回遮罩
      overlay.classList.remove('is-expanding');
      overlay.classList.add('is-retracting');

      // 收回动画完成后重置状态
      setTimeout(() => {
        overlay.classList.remove('is-retracting');
        overlay.style.transform = '';
      }, 500);

    }, 400); // 对应 --transition-out-duration
  }
});
```

---

## 四、 核心设计要点总结 (Design Highlights)

1. **原点感知 (Origin-Aware Ripple)**:
   使用 `event.clientX` 与 `event.clientY` 将变量传递给 CSS `clip-path: circle()`, 让扩张波浪始终从用户点击的按钮精准涌出。
2. **色彩延续 (Color Consistency)**:
   转场遮罩的颜色与被点击按钮的 `data-color` 严格一致，增强了界面操作的连贯性与趣味性。
3. **高效性能 (GPU Acceleration)**:
   动画完全依赖 `clip-path` 与 `transform` 属性，由 GPU 硬件加速完成，无重排 (Reflow) 卡顿。
