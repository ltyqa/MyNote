# 滚动驱动的科技感背景动效规范 (Scroll-Driven Tech Background System)

## 1. 核心视觉与分层架构 (Layer Composition)

科技感背景由 **4 层固定视口 (Fixed Viewport Layers)** 上下叠加而成，通过 `z-index` 形成三维沉浸感：

```
┌─────────────────────────────────────────────────────────┐ Layer 4: HUD 视角定界符 (Corner Crosshairs) [z-10]
│  [+]                                               [+]  │
│                                                         │ Layer 3: 浮动字符/粒子纹理 (ASCII/Grid Texture) [z-0]
│       Scroll-driven Video / Canvas Background           │
│                                                         │ Layer 2: 渐变蒙版与视频层 (Video / Shader Canvas) [-z-10]
│  [+]                                               [+]  │
└─────────────────────────────────────────────────────────┘ Layer 1: 底色降级层 (Fallback Background Color) [-z-20]
```

---

## 2. 三大核心科技感效果 (Core Features)

### 2.1 滚动驱动背景状态机 (Scroll Background Swapping)
- 每个页面章节分配 `data-background="1...N"` 触发器。
- 当用户滚动到指定章节（通过 `IntersectionObserver` 监听），背景视频/Canvas 纹理平滑切换透明度、播放速度或色彩滤镜。

### 2.2 渐变遮罩与空间消融 (Dynamic Gradient Masking)
- 使用 CSS `mask-image` / `-webkit-mask-image` 控制背景边缘的隐退，防止硬切边。
- 页脚或转场处使用 `mask: linear-gradient(to bottom, transparent 0%, black 10%, black 100%)` 实现从无缝透明到沉浸实色的渐变消融。

### 2.3 动态字符/像素底层 (ASCII Code / Matrix Overlay)
- 在背景视频上方覆盖一层只读的 `font-mono` ASCII 字符或网格点阵，赋予静态/动态画面极客科技纹理。

---

## 3. 通用代码实现 (Generic Implementation)

### 3.1 HTML 结构 (Generic Markup)
```html
<!-- 固定全屏背景系统 -->
<div class="fixed inset-0 pointer-events-none overflow-hidden">
  <!-- 1. 动态视频/Shader 背景 -->
  <video 
    id="tech-bg-video"
    autoplay muted loop playsinline 
    class="fixed inset-0 -z-10 h-full w-full object-cover transition-opacity duration-700 opacity-100"
    src="/backgrounds/scene-1.mp4">
  </video>

  <!-- 2. ASCII/点阵科技纹理层 -->
  <div class="absolute inset-0 z-0 select-none font-mono text-[14px] text-white/10 overflow-hidden leading-none opacity-50">
    0101010101010101010101010101010101010101010101010101010101
  </div>

  <!-- 3. 四角 HUD 科技定界标 -->
  <div class="fixed inset-0 z-10 flex flex-col justify-between p-6">
    <div class="flex justify-between">
      <div class="relative size-4">
        <div class="absolute top-1/2 left-0 h-px w-full bg-white/30"></div>
        <div class="absolute top-0 left-1/2 w-px h-full bg-white/30"></div>
      </div>
      <div class="relative size-4">
        <div class="absolute top-1/2 left-0 h-px w-full bg-white/30"></div>
        <div class="absolute top-0 left-1/2 w-px h-full bg-white/30"></div>
      </div>
    </div>
    <div class="flex justify-between">
      <div class="relative size-4">
        <div class="absolute top-1/2 left-0 h-px w-full bg-white/30"></div>
        <div class="absolute top-0 left-1/2 w-px h-full bg-white/30"></div>
      </div>
      <div class="relative size-4">
        <div class="absolute top-1/2 left-0 h-px w-full bg-white/30"></div>
        <div class="absolute top-0 left-1/2 w-px h-full bg-white/30"></div>
      </div>
    </div>
  </div>
</div>
```

### 3.2 滚动监听逻辑 (JS State Machine)
```javascript
// 通用背景状态切换器
const bgVideo = document.getElementById('tech-bg-video');
const bgSources = {
  '1': '/backgrounds/scene-1.mp4',
  '2': '/backgrounds/scene-2.mp4',
  '3': '/backgrounds/scene-3.mp4',
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const bgId = entry.target.getAttribute('data-background');
      if (bgId && bgSources[bgId]) {
        // 平滑渐隐淡出并切换资源
        bgVideo.style.opacity = '0.3';
        setTimeout(() => {
          bgVideo.src = bgSources[bgId];
          bgVideo.style.opacity = '1';
        }, 300);
      }
    }
  });
}, { threshold: 0.5 });

document.querySelectorAll('[data-background]').forEach(section => observer.observe(section));
```

### 3.3 主题与配色适配 (Theme Customization)
```css
:root {
  /* 科技感深色/亮色配置 */
  --bg-hud-color: rgba(255, 255, 255, 0.3);    /* 定界标线段颜色 */
  --bg-ascii-color: rgba(255, 255, 255, 0.08);  /* 字符/网格纹理颜色 */
  --bg-mask-gradient: linear-gradient(to bottom, transparent 0%, rgba(0,0,0,0.8) 100%);
}
```
