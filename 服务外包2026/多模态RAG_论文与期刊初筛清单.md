# 多模态检索增强生成（RAG）论文与期刊初筛清单

整理日期：2026-07-23

本轮新增阅读：7 份正式会议论文 PDF（其中 P28 是原 P24 预印本的 ACL 2025 正式版本更新），均已保存至 `C:\Users\12480\Desktop\服务外包\文献综述和研究思路\多模态RAG论文库`。

## 1. 与项目的对应关系

本清单依据项目需求文档中“智能知识库”模块及文献综述第 3 章整理，聚焦以下三条技术链：

- 3.1 多模态数据解析与向量化：PDF/Word/PPT、图片、课堂音视频的 OCR、ASR、版面理解、跨模态对齐和统一向量表示。
- 3.2 语义检索与知识增强策略：稀疏检索、稠密检索、混合检索、查询改写、重排序、多模态检索及证据注入。
- 3.3 内容幻觉抑制技术：检索质量评估、自适应检索、生成自检、证据归因、不可回答检测与 RAG 评测。

筛选原则：优先同行评审论文、主流会议/期刊和原始论文页面；预印本用于覆盖快速发展的多模态 RAG 前沿，但正式写作时应明确标注“arXiv preprint”。

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
    - 用途：快速建立 MRAG 的组件、数据集、评价指标和研究问题全景，适合作为第 3 章综述的结构参考，不宜代替原始论文。
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

## 3. 教育场景与中文扩展文献

23. **《浅谈大模型时代下的检索增强：发展趋势、挑战与展望》（2024），中国计算语言学大会 CCL。**
    - 用途：中文综述，围绕检索策略、内容处理及多模态知识增强展开，适合用于中文研究现状表述并追踪其参考文献。
    - 链接：[ACL Anthology PDF](https://aclanthology.org/2024.ccl-2.9.pdf)

## 4. 2025 年正式论文新增精读

### 4.1 正式版本更新

24F. **Abootorabi et al. (2025), Ask in Any Modality: A Comprehensive Survey on Multimodal Retrieval-Augmented Generation. Findings of ACL 2025.**
   - 定位：原 P24 预印本的正式发表版本，系统分类检索、融合、增强、生成、训练和智能体方法，并指出泛化、精确归因、跨模态推理、知识投毒防御和统一嵌入仍是开放问题。
   - 使用边界：该文是综述，不提供各方法的统一复现实验，核心论证仍应回到原始论文。
   - DOI：10.18653/v1/2025.findings-acl.861
   - 链接：[ACL Anthology](https://aclanthology.org/2025.findings-acl.861/)
   - 本地文件：`P28_Ask_in_Any_Modality_ACL2025.pdf`

### 4.2 视觉丰富文档与多文档 RAG

28. **Tanaka et al. (2025), VDocRAG: Retrieval-Augmented Generation over Visually-Rich Documents. CVPR 2025.**
   - 方法：把 PDF/PPTX 页面统一为图像，使用基于 LVLM 的双编码检索器和视觉生成器；提出 RCR/RCG 两个自监督任务，把整页视觉信息压缩到稠密表示。
   - 原文结果：在 ChartQA、SlideVQA、InfoVQA、DUDE 上，视觉 RAG 相对同底座文本 RAG 的端到端得分分别提高 24.0、15.6、15.7、8.4 个点（single-pool）。
   - 局限：在长文本、OCR 密集页面上不一定优于文本检索；未解决大规模图像索引成本，且训练使用 OCR 伪目标。
   - 项目用途：支持“复杂视觉页走原生视觉通道，长文本页保留文本通道”的双索引设计。
   - 链接：[CVPR Open Access](https://openaccess.thecvf.com/content/CVPR2025/html/Tanaka_VDocRAG_Retrieval-Augmented_Generation_over_Visually-Rich_Documents_CVPR_2025_paper.html)
   - 本地文件：`P29_VDocRAG_CVPR2025.pdf`

29. **Suri et al. (2025), VisDoM: Multi-Document QA with Visually Rich Elements Using Multimodal Retrieval-Augmented Generation. NAACL 2025.**
   - 方法：文本 RAG 与视觉 RAG 并行，分别执行证据整理和推理，再通过推理链一致性约束融合答案。
   - 原文结果：VisDoMRAG 在五个多文档子集上优于长上下文、纯文本和纯视觉基线；ColQwen2 的来源文档识别平均为 96.94%，BGE-1.5 为 92.40%。
   - 局限：每个查询需三次 LLM 调用，仍保留 OCR/解析成本，论文也明确不能消除幻觉。
   - 项目用途：为教材、论文、课件跨文档证据融合及“文本—视觉冲突检查”提供直接依据。
   - DOI：10.18653/v1/2025.naacl-long.310
   - 链接：[ACL Anthology](https://aclanthology.org/2025.naacl-long.310/)
   - 本地文件：`P30_VisDoM_NAACL2025.pdf`

### 4.3 统一检索、分层检索与逻辑检索

30. **Zhang et al. (2025), Bridging Modalities: Improving Universal Multimodal Retrieval by Multimodal Large Language Models. CVPR 2025.**
   - 方法：General Multimodal Embedder（GME）用一个 MLLM 编码文本、图像、视觉文档和图文混合输入，以指令化对比学习和难负例训练统一嵌入。
   - 原文结果：GME-Qwen2VL-2B/7B 在 47 个数据集组成的 UMRB 上平均得分为 64.45/67.44；7B 的文本到视觉文档 nDCG@5 为 89.92。
   - 局限：模型与约 800 万训练样本带来明显训练、推理和部署成本，不能直接替代轻量检索器而不做本地基准测试。
   - 项目用途：作为第二阶段统一检索器候选，与 BM25、文本 Dense 和 ColPali 组合方案比较成本和效果。
   - 链接：[CVPR Open Access](https://openaccess.thecvf.com/content/CVPR2025/html/Zhang_Bridging_Modalities_Improving_Universal_Multimodal_Retrieval_by_Multimodal_Large_Language_CVPR_2025_paper.html)
   - 本地文件：`P31_GME_CVPR2025.pdf`

31. **Yang et al. (2025), OMGM: Orchestrate Multiple Granularities and Modalities for Efficient Multimodal Retrieval. ACL 2025.**
   - 方法：按“实体摘要粗检索—图文融合实体重排—章节文本细筛”逐步缩小检索空间，并在阶段间传递相似度。
   - 原文结果：多模态重排使 E-VQA/InfoSeek 的 Recall@1 从 19.1/52.6 提高到 42.8/64.0；消融显示第二阶段带来最大问答增益。
   - 项目用途：迁移为“资源—页面—知识块”三级检索，但论文任务是 KB-VQA，不能直接声称已验证教学文档。
   - DOI：10.18653/v1/2025.acl-long.1198
   - 链接：[ACL Anthology](https://aclanthology.org/2025.acl-long.1198/)
   - 本地文件：`P32_OMGM_ACL2025.pdf`

32. **Wu et al. (2025), MoLoRAG: Bootstrapping Document Understanding via Multi-modal Logic-aware Retrieval. EMNLP 2025.**
   - 方法：用 ColPali 表示页面并构建相似度页图，由轻量 VLM 图遍历，同时估计语义相关性与逻辑相关性。
   - 原文结果：在四个多页 DocQA 数据集上，平均问答准确率比 LVLM 直接推理提高 9.68%，检索精度比基线提高 7.44%；效果随生成模型上下文能力和 Top-k 改变。
   - 局限：主要验证已知相关文档内的闭域检索，跨文档页图会显著增加复杂度。
   - 项目用途：把目录层级、相邻页、图注引用和例题—解析关系纳入跨页证据检索。
   - DOI：10.18653/v1/2025.emnlp-main.708
   - 链接：[ACL Anthology](https://aclanthology.org/2025.emnlp-main.708/)
   - 本地文件：`P33_MoLoRAG_EMNLP2025.pdf`

33. **Liu et al. (2025), ViDoRAG: Visual Document Retrieval-Augmented Generation via Dynamic Iterative Reasoning Agents. EMNLP 2025.**
   - 方法：用 GMM 分别估计文本与视觉相似度分布、动态确定召回数量，再由 Seeker—Inspector—Answer 三智能体迭代选择、反思和核验。
   - 原文结果：GPT-4o 上总体准确率由 TextRAG 的 63.5、VisualRAG 的 72.1 提高到 79.4；GMM 将平均页面数从 10 降至 6.76，同时准确率从 72.1 升至 72.8。
   - 局限：多智能体迭代引入延迟，问题构造可能有偏差，论文明确指出仍会产生无依据幻觉。
   - 项目用途：动态 Top-k 可进入标准路径；完整多智能体流程只适合正式试题、复杂教案等高风险慢路径。
   - DOI：10.18653/v1/2025.emnlp-main.464
   - 链接：[ACL Anthology](https://aclanthology.org/2025.emnlp-main.464/)
   - 本地文件：`P34_ViDoRAG_EMNLP2025.pdf`

### 4.4 仍需继续跟踪的前沿线索

- **Multi-modal Retrieval Augmented Multi-modal Generation** (2024), arXiv:2411.16365：多模态图文生成策略、数据集和评价指标。[链接](https://arxiv.org/abs/2411.16365)
- **Self-adaptive Multimodal Retrieval-Augmented Generation** (2024), arXiv:2410.11321：动态过滤证据和答案支持度检查。[链接](https://arxiv.org/abs/2410.11321)
- **DRAGIN** (2024), arXiv:2403.10081：根据模型信息需求判断何时检索、检索什么。[链接](https://arxiv.org/abs/2403.10081)
- **GENIUS** (2025), CVPR：通用多模态生成式检索范式。[链接](https://openaccess.thecvf.com/content/CVPR2025/html/Kim_GENIUS_A_Generative_Framework_for_Universal_Multimodal_Search_CVPR_2025_paper.html)

## 5. 推荐重点关注的期刊与会议

### 期刊

- **IEEE Transactions on Multimedia (TMM)**：多模态表示、跨模态检索、音视频理解。
- **IEEE Transactions on Pattern Analysis and Machine Intelligence (TPAMI)**：视觉语言基础模型、跨模态学习的高水平工作。
- **ACM Transactions on Information Systems (TOIS)**：信息检索、排序、RAG 系统评价。
- **Information Processing & Management (IP&M)**：语义检索、知识增强与实际信息系统。
- **Transactions of the Association for Computational Linguistics (TACL)**：NLP、检索增强生成与事实性研究。
- **Artificial Intelligence Review / ACM Computing Surveys**：适合查找系统综述。
- **Computers & Education**、**Computers and Education: Artificial Intelligence**：教育技术和生成式 AI 教育应用。
- **International Journal of Artificial Intelligence in Education (IJAIED)**：智能教学系统和教育智能体。
- 中文可重点检索：**《软件学报》**、**《计算机学报》**、**《自动化学报》**、**《计算机研究与发展》**、**《中文信息学报》**、**《现代教育技术》**、**《电化教育研究》**、**《中国电化教育》**。

### 会议

- NLP/RAG：ACL、EMNLP、NAACL、EACL、COLING、NeurIPS、ICLR、ICML。
- 信息检索：SIGIR、CIKM、WSDM。
- 多模态/视觉文档：CVPR、ICCV、ECCV、ACM Multimedia。
- 教育技术：AIED、EDM、LAK、SIGCSE Technical Symposium。

## 6. 可直接使用的检索式

### 英文检索式

1. `("multimodal retrieval-augmented generation" OR "multimodal RAG") AND (education OR teaching OR textbook OR courseware)`
2. `("visual document retrieval" OR "document image retrieval") AND (RAG OR "retrieval augmented generation")`
3. `(OCR OR ASR OR "document understanding") AND (embedding OR vectorization) AND multimodal`
4. `("hybrid retrieval" OR "dense sparse retrieval") AND rerank* AND RAG`
5. `("cross-modal retrieval" OR "unified embedding") AND (text image audio video)`
6. `(hallucination OR faithfulness OR factuality) AND (RAG OR "retrieval augmented generation")`
7. `("retrieval quality" OR "context relevance") AND (self-correction OR reflection OR critique) AND RAG`
8. `(unanswerable OR abstention OR "insufficient evidence") AND RAG`

### 中文检索式

1. `多模态 检索增强生成 教育`
2. `多模态知识库 文档解析 向量化`
3. `图文音视频 统一表征 跨模态检索`
4. `混合检索 稠密检索 稀疏检索 重排序 RAG`
5. `检索增强生成 幻觉 忠实性 事实性`
6. `教育知识库 大语言模型 智能问答`
7. `不可回答 拒答 证据不足 检索增强生成`

## 7. 建议的综述写作主线

- **3.1**：先写多源教学资源解析（OCR/ASR/文档版面理解），再写 CLIP/ImageBind 式跨模态共享空间，最后引出 ColPali 式视觉文档多向量检索，并比较“解析后文本索引”和“页面图像端到端索引”的优缺点。
- **3.2**：从 BM25 与 DPR 的互补性引出混合召回，以 ColBERT/ColPali 说明后期交互和重排序，以 HyDE 说明查询改写，以 RAG/MuRAG/RA-CM3 说明证据增强生成；最后讨论 Top-k、上下文压缩及 Lost-in-the-Middle。
- **3.3**：将幻觉来源拆成检索失败、证据噪声、生成不忠实和知识库无答案四类；分别对应 CRAG、重排序/过滤、Self-RAG/CRITIC、不可回答检测，并用 RAGAS/ARES 建立评价指标。

## 8. 使用注意

- `arXiv` 论文需在参考文献中标为预印本，并在定稿前再次检查是否已有会议/期刊正式版本。
- 不要把“使用了 RAG”等同于“消除了幻觉”；RAG 仍可能出现检索错误、错误证据放大和有证据却不忠实生成等问题。
- 教育场景除准确率外，还应评价来源可追溯性、课程标准一致性、难度适配、拒答能力、隐私权限和教师可控性。
- 建议建立项目内小型评测集：文本题、图片题、图表题、音视频题、跨模态题、知识库无答案题，并分别记录 Recall@k/nDCG、答案正确性、忠实度、引用准确率和拒答率。

## 9. 后续补充方向

- **教育实证研究**：当前论文库以通用RAG技术为主，应补充AIED、EDM、Computers & Education等来源中有关教师信任、学习效果和课程标准一致性的研究。
- **长视频与时间对齐**：补充视频RAG、长视频检索、说话人分离及课件页—讲解时间对齐研究；Whisper与ImageBind不足以单独覆盖完整视频RAG链路。
- **中文文档验证**：ColPali、VDocRAG、VisDoM、GME、MoLoRAG 与 ViDoRAG 的核心实验均不能替代中文教学材料验证；应使用中文教材、试卷、PPT、公式页面及跨页例题建立独立测试集。
- **成本与慢路径验证**：VisDoM 和 ViDoRAG 都依赖多次模型调用，应分别报告普通问答与复杂教学任务的 P50/P95 延迟、Token 成本和质量收益。
- **开放域逻辑检索**：MoLoRAG 主要处理给定文档内部的页图；本项目若扩展到多个教材版本，需要研究文档级粗检索后再构建局部页图，避免全库建图。
