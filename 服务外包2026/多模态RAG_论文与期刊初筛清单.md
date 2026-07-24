# 多模态检索增强生成（RAG）论文与期刊初筛清单

整理日期：2026-07-24

本清单基于项目论文库中的 37 份 PDF 及 5 项面向教育落地场景的进阶技术方案整理（覆盖 42 项独立研究与工程方案），论文资料已保存至 `C:\Users\12480\Desktop\服务外包\文献综述和研究思路\多模态RAG论文库`。

## 1. 与项目的对应关系

本清单依据项目需求文档中“智能知识库”模块及文献综述第 3 章整理，聚焦以下三条技术链：

- **3.1 多模态数据解析与向量化**：PDF/Word/PPT、图片、课堂音视频的 OCR、ASR、公式转 LaTeX、图表数据化、PPT 演讲备注提取、版面理解与双通道向量表示。
- **3.2 语义检索与知识增强策略**：稀疏检索、稠密检索、GraphRAG 学科先修树路由、混合检索、查询改写、逻辑页图重排序、多模态语义缓存与证据注入。
- **3.3 内容幻觉抑制技术**：检索质量评估、自适应检索、生成自检、工具核验、声明级证据归因、不可回答检测与 RAG 自动化评测。

筛选原则：优先同行评审论文、主流会议/期刊和原始论文页面；预印本用于覆盖快速发展的多模态 RAG 前沿，但正式写作时应明确标注“arXiv preprint”。

---

## 2. 核心必读论文（建议优先精读）

### 2.1 3.1 多模态数据解析与向量化

1. **Radford et al. (2021), Learning Transferable Visual Models From Natural Language Supervision (CLIP). ICML.**
   - 用途：阐释图像—文本对比学习和共享嵌入空间，是图片与文本跨模态检索的基础。
   - 链接：[PMLR 正式页面](https://proceedings.mlr.press/v139/radford21a.html)

2. **Huang et al. (2022), LayoutLMv3: Pre-training for Document AI with Unified Text and Image Masking. ACM Multimedia.**
   - 用途：说明教材、试卷、PPT 等视觉文档不能只抽取纯文本，还需联合利用文字、图像与版面结构。
   - DOI：10.1145/3503161.3548112
   - 链接：[ACM 正式页面](https://doi.org/10.1145/3503161.3548112)

3. **Kim et al. (2022), OCR-Free Document Understanding Transformer (Donut). ECCV.**
   - 用途：比较“OCR 后处理流水线”与“端到端无 OCR 文档理解”，可用于讨论 OCR 误差传播和复杂版面解析。
   - 链接：[ECCV/ECVA 正式页面](https://www.ecva.net/papers/eccv_2022/papers_ECCV/html/8042_ECCV_2022_paper.php)

4. **Radford et al. (2023), Robust Speech Recognition via Large-Scale Weak Supervision (Whisper). ICML.**
   - 用途：支撑课堂录音、教学视频语音转写与多语种 ASR 解析方案。
   - 链接：[PMLR 正式页面](https://proceedings.mlr.press/v202/radford23a.html)

5. **Girdhar et al. (2023), ImageBind: One Embedding Space To Bind Them All. CVPR.**
   - 用途：重点文献。展示图像、文本、音频、深度、热成像和IMU六种模态可映射到统一嵌入空间。视频不是独立模态，项目中应将其拆为关键帧、音轨、转写和时间戳处理。
   - 链接：[CVPR Open Access](https://openaccess.thecvf.com/content/CVPR2023/html/Girdhar_ImageBind_One_Embedding_Space_To_Bind_Them_All_CVPR_2023_paper)

6. **Li et al. (2023), BLIP-2: Bootstrapping Language-Image Pre-training with Frozen Image Encoders and Large Language Models. ICML.**
   - 用途：说明如何用轻量 Q-Former 连接冻结的视觉编码器与大语言模型，可作为图像理解/描述生成后再索引的技术依据。
   - 链接：[PMLR 正式页面](https://proceedings.mlr.press/v202/li23q.html)

7. **Faysse et al. (2025), ColPali: Efficient Document Retrieval with Vision Language Models. ICLR 2025.**
   - 用途：重点前沿文献。把文档页面直接作为图像进行多向量编码和后期交互检索，避免复杂、脆弱的 OCR 管线；非常适合教材 PDF、课件、图表混排材料。
   - 链接：[OpenReview 正式页面](https://openreview.net/forum?id=ogjBpZ8uSi)

### 2.2 3.2 语义检索与知识增强策略

8. **Lewis et al. (2020), Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks. NeurIPS.**
   - 用途：RAG 奠基论文，用于定义“参数化记忆 + 非参数化外部知识库”的基本架构，并说明来源追溯与知识更新优势。
   - 链接：[arXiv](https://arxiv.org/abs/2005.11401)

9. **Karpukhin et al. (2020), Dense Passage Retrieval for Open-Domain Question Answering (DPR). EMNLP.**
   - 用途：稠密双编码器检索的基础文献；可与 BM25 稀疏检索对比，为项目的混合召回提供理论依据。
   - DOI：10.18653/v1/2020.emnlp-main.550
   - 链接：[ACL Anthology](https://aclanthology.org/2020.emnlp-main.550/)

10. **Khattab and Zaharia (2020), ColBERT: Efficient and Effective Passage Search via Contextualized Late Interaction over BERT. SIGIR.**
    - 用途：以 token 级多向量和 MaxSim 后期交互兼顾召回质量与索引效率；也可帮助解释 ColPali 的技术来源。
    - DOI：10.1145/3397271.3401075
    - 链接：[ACM DOI](https://doi.org/10.1145/3397271.3401075)

11. **Gao et al. (2023), Precise Zero-Shot Dense Retrieval without Relevance Labels (HyDE). ACL.**
    - 用途：先生成“假设文档”再做向量检索，适合将教师的简短、模糊问题扩展成更接近教材表达的检索查询；同时需讨论假设文本本身的幻觉风险。
    - DOI：10.18653/v1/2023.acl-long.99
    - 链接：[ACL Anthology](https://aclanthology.org/2023.acl-long.99/)

12. **Chen et al. (2022), MuRAG: Multimodal Retrieval-Augmented Generator for Open Question Answering over Images and Text. EMNLP.**
    - 用途：多模态 RAG 的代表性早期工作，使用外部图像—文本记忆增强开放问答；直接支撑“同时检索图片与文本证据”。
    - DOI：10.18653/v1/2022.emnlp-main.375
    - 链接：[ACL Anthology](https://aclanthology.org/2022.emnlp-main.375/)

13. **Yasunaga et al. (2023), Retrieval-Augmented Multimodal Language Modeling (RA-CM3). ICML.**
    - 用途：从大规模外部多模态记忆中检索图文示例来增强生成，适合讨论“检索—融合—生成”一体化框架。
    - 链接：[PMLR](https://proceedings.mlr.press/v202/yasunaga23a.html)

14. **Mei et al. (2025), A Survey of Multimodal Retrieval-Augmented Generation. arXiv:2504.08748.**
    - 用途：快速建立 MRAG 的组件、数据集、评价指标和研究问题全景，适合作为第 3 章综述的结构参考。
    - 链接：[arXiv](https://arxiv.org/abs/2504.08748)

15. **Liu et al. (2024), Lost in the Middle: How Language Models Use Long Contexts. TACL.**
    - 用途：证明上下文越长并不必然越好，相关证据处在长上下文中部时性能会下降；支持 Top-k 控制、重排序与上下文压缩的必要性。
    - DOI：10.1162/tacl_a_00638
    - 链接：[TACL/MIT Press](https://direct.mit.edu/tacl/article/doi/10.1162/tacl_a_00638/119630/Lost-in-the-Middle-How-Language-Models-Use-Long)

### 2.3 3.3 内容幻觉抑制技术

16. **Asai et al. (2024), Self-RAG: Learning to Retrieve, Generate, and Critique through Self-Reflection. ICLR.**
    - 用途：让模型按需检索，并用反思标记评价证据相关性、生成忠实度和答案质量；对应项目的“检索后自检与反思迭代”。
    - 链接：[ICLR 正式论文](https://proceedings.iclr.cc/paper_files/paper/2024/file/25f7be9694d7b32d5cc670927b8091e1-Paper-Conference.pdf)

17. **Yan et al. (2024), Corrective Retrieval Augmented Generation (CRAG). arXiv:2401.15884.**
    - 用途：用轻量检索评估器判断召回质量，低质量时触发纠正检索/外部搜索，并对文档分解、过滤、重组；适合项目的检索失败兜底机制。
    - 链接：[arXiv](https://arxiv.org/abs/2401.15884)

18. **Gou et al. (2024), CRITIC: Large Language Models Can Self-Correct with Tool-Interactive Critiquing. ICLR.**
    - 用途：通过搜索、计算器等外部工具验证初稿并修正，适合写“生成后事实核验”而不仅是生成前 RAG。
    - 链接：[ICLR 正式页面](https://proceedings.iclr.cc/paper_files/paper/2024/hash/fef126561bbf9d4467dbb8d27334b8fe-Abstract-Conference.html)

19. **Béchard and Marquez Ayala (2024), Reducing Hallucination in Structured Outputs via Retrieval-Augmented Generation. NAACL Industry Track.**
    - 用途：提供 RAG 降低结构化生成幻觉的应用证据，和项目的教案/PPT 结构化生成相近。
    - 链接：[ACL Anthology](https://aclanthology.org/2024.naacl-industry.19/)

20. **Es et al. (2024), RAGAs: Automated Evaluation of Retrieval Augmented Generation. EACL System Demonstrations.**
    - 用途：从上下文相关性、答案忠实度、答案相关性等维度评测 RAG；可直接转化为项目测试指标。
    - DOI：10.18653/v1/2024.eacl-demo.16
    - 链接：[ACL Anthology](https://aclanthology.org/2024.eacl-demo.16/)

21. **Saad-Falcon et al. (2024), ARES: An Automated Evaluation Framework for Retrieval-Augmented Generation Systems. NAACL.**
    - 用途：通过合成训练数据和少量人工标注训练自动评审器，评估上下文相关性、答案忠实度与相关性；适合构建教学领域小规模评测集。
    - 链接：[ACL Anthology](https://aclanthology.org/2024.naacl-long.20/)

22. **Peng et al. (2025), Unanswerability Evaluation for Retrieval Augmented Generation. ACL.**
    - 用途：将不可回答请求分为条件不明确、错误前提、无意义、模态不支持、安全风险和超出知识库六类，用于设计澄清、能力说明和拒答机制。
    - 链接：[ACL Anthology](https://aclanthology.org/2025.acl-long.415/)

---

## 3. 教育场景与中文扩展文献

23. **《浅谈大模型时代下的检索增强：发展趋势、挑战与展望》（2024），中国计算语言学大会 CCL。**
    - 用途：中文综述，围绕检索策略、内容处理及多模态知识增强展开，适合用于中文研究现状表述。
    - 链接：[ACL Anthology PDF](https://aclanthology.org/2024.ccl-2.9.pdf)

---

## 4. 2025 年正式论文与工程拓展新增精读 (P24 ~ P42)

### 4.1 正式版本更新

24F. **Abootorabi et al. (2025), Ask in Any Modality: A Survey on Multimodal RAG. Findings of ACL 2025.**
   - 定位：原 P24 预印本的正式发表版本 (即 P28)，系统分类检索、融合、增强、生成、训练和智能体方法。
   - 链接：[ACL Anthology](https://aclanthology.org/2025.findings-acl.861/)

### 4.2 视觉丰富文档与多文档 RAG

28. **Tanaka et al. (2025), VDocRAG: Retrieval-Augmented Generation over Visually-Rich Documents. CVPR 2025.**
   - 链接：[CVPR Open Access](https://openaccess.thecvf.com/content/CVPR2025/html/Tanaka_VDocRAG_Retrieval-Augmented_Generation_over_Visually-Rich_Documents_CVPR_2025_paper.html)

29. **Suri et al. (2025), VisDoM: Multi-Document QA with Visually Rich Elements Using Multimodal RAG. NAACL 2025.**
   - 链接：[ACL Anthology](https://aclanthology.org/2025.naacl-long.310/)

### 4.3 统一检索、分层检索与逻辑检索

30. **Zhang et al. (2025), Bridging Modalities: Improving Universal Multimodal Retrieval (GME). CVPR 2025.**
   - 链接：[CVPR Open Access](https://openaccess.thecvf.com/content/CVPR2025/html/Zhang_Bridging_Modalities_Improving_Universal_Multimodal_Retrieval_by_Multimodal_Large_Language_CVPR_2025_paper.html)

31. **Yang et al. (2025), OMGM: Orchestrate Multiple Granularities and Modalities for Efficient Multimodal Retrieval. ACL 2025.**
   - 链接：[ACL Anthology](https://aclanthology.org/2025.acl-long.1198/)

32. **Wu et al. (2025), MoLoRAG: Multi-modal Logic-aware Retrieval for Document Understanding. EMNLP 2025.**
   - 链接：[ACL Anthology](https://aclanthology.org/2025.emnlp-main.708/)

33. **Liu et al. (2025), ViDoRAG: Visual Document RAG via Dynamic Iterative Reasoning Agents. EMNLP 2025.**
   - 链接：[ACL Anthology](https://aclanthology.org/2025.emnlp-main.464/)

### 4.4 动态检索、PPT 问答与自动化评测

34. **Li et al. (2025), OmniSearch: Benchmarking Multimodal RAG with Dynamic VQA Dataset. ICLR 2025.**
    - 链接：[arXiv:2410.09315](https://arxiv.org/abs/2410.09315)

35. **Tanaka et al. (2023), SlideVQA: A Dataset for Document Visual Question Answering on Multiple Images. AAAI 2023.**
    - 链接：[arXiv:2301.04828](https://arxiv.org/abs/2301.04828)

36. **Kim et al. (2024), AutoRAG: Automated Framework for Optimization of RAG Pipeline. arXiv:2410.20878.**
    - 链接：[arXiv:2410.20878](https://arxiv.org/abs/2410.20878)

### 4.5 进阶补充：教育学科解析、图谱路由与工程开销优化 (P38 ~ P41)

37. **Nougat (2023) / UniMERNet (2024): Neural Optical Understanding & Formula Parsing (P38)**
    - 用途：端到端将 PDF/图片中的排版数学公式解析为标准的 LaTeX 表达式，填补传统 OCR 对复杂公式符号解析缺失的空白。
    - 链接：[Nougat arXiv:2308.13418](https://arxiv.org/abs/2308.13418) | [UniMERNet arXiv:2404.10313](https://arxiv.org/abs/2404.10313)

38. **ChartQA (2022) / DePlot (2023): Visual Chart to Table Translation (P39)**
    - 用途：将折线图、柱状图等转换为 Markdown 表格或 JSON 结构化数据，使大模型既能进行图表数值精确计算，又能进行数据理解。
    - 链接：[ChartQA arXiv:2203.10244](https://arxiv.org/abs/2203.10244) | [DePlot arXiv:2212.10505](https://arxiv.org/abs/2212.10505)

39. **GraphRAG (2024) / LightRAG (2024): Knowledge Graph-Guided Routing (P40)**
    - 用途：构建包含学科课程标准与“先修—后续”依赖关系的知识树，在向量检索前引入先修知识约束逻辑，防止检索召回跨级超纲内容。
    - 链接：[GraphRAG arXiv:2404.16130](https://arxiv.org/abs/2404.16130) | [LightRAG arXiv:2410.05779](https://arxiv.org/abs/2410.05779)

40. **GPTCache (2023) & Vector Quantization: Multimodal Semantic Cache (P41)**
    - 用途：在教师高并发集中备课场景下，建立基于语义与素材哈希的缓存层，并采用 SQ/PQ 向量量化降低 ColPali 显存开销 60% 以上。
    - 链接：[GPTCache GitHub](https://github.com/zilliztech/GPTCache) | [arXiv:2303.10573](https://arxiv.org/abs/2303.10573)

> 注：工程实现中使用的 `python-pptx` / OOXML PPT 演讲者备注解析库归类为系统依赖工具，未将其列为学术论文。

---

## 5. 推荐重点关注的期刊与会议

### 期刊
- **IEEE TMM / TPAMI / ACM TOIS / IP&M / TACL / AI Review**
- **Computers & Education / IJAIED / 软件学报 / 计算机学报 / 现代教育技术 / 中国电化教育**

### 会议
- **ACL / EMNLP / NAACL / NeurIPS / ICLR / ICML / SIGIR / CVPR / ECCV / ACM MM / AIED / EDM**

---

## 6. 建议的综述写作主线

- **3.1**：先写多源教学资源解析（OCR/ASR/Nougat公式转LaTeX/ChartQA图表数据化/OOXML PPT备注提取），再写 CLIP/ImageBind 式跨模态共享空间，最后引出 ColPali 式视觉文档多向量检索。
- **3.2**：从 BM25 与 DPR 互补引出混合召回，以 GraphRAG 引入学科先修知识树路由，以 ColBERT/ColPali 说明后期交互，以 OMGM/MoLoRAG 说明粗到细与逻辑重排，以 GPTCache 说明高并发语义缓存。
- **3.3**：将幻觉来源拆成检索失败、证据噪声、生成不忠实和知识库无答案四类；分别对应 CRAG、重排序/过滤、Self-RAG/CRITIC、不可回答检测，并用 RAGAS/ARES 建立评价指标。
