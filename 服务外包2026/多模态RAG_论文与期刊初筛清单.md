# 多模态检索增强生成（RAG）论文与期刊初筛清单

整理日期：2026-07-22

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
   - 用途：重点文献。展示文本、图像、音频等六种模态可映射到统一嵌入空间，直接对应项目的“图文音视频统一向量化”。
   - 链接：[CVPR Open Access](https://openaccess.thecvf.com/content/CVPR2023/html/Girdhar_ImageBind_One_Embedding_Space_To_Bind_Them_All_CVPR_2023_paper)

6. **Li et al. (2023), BLIP-2: Bootstrapping Language-Image Pre-training with Frozen Image Encoders and Large Language Models. ICML.**
   - 用途：说明如何用轻量 Q-Former 连接冻结的视觉编码器与大语言模型，可作为图像理解/描述生成后再索引的技术依据。
   - 链接：[PMLR 正式页面](https://proceedings.mlr.press/v202/li23q.html)

7. **Faysse et al. (2024), ColPali: Efficient Document Retrieval with Vision Language Models. arXiv:2407.01449.**
   - 用途：重点前沿文献。把文档页面直接作为图像进行多向量编码和后期交互检索，避免复杂、脆弱的 OCR 管线；非常适合教材 PDF、课件、图表混排材料。
   - 链接：[arXiv](https://arxiv.org/abs/2407.01449)

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
    - 用途：强调知识库没有答案时系统应拒答或说明证据不足，而不是强行生成；对权威教学内容和幻觉控制尤其重要。
    - 链接：[ACL Anthology](https://aclanthology.org/2025.acl-long.415/)

## 3. 教育场景与中文扩展文献

23. **《浅谈大模型时代下的检索增强：发展趋势、挑战与展望》（2024），中国计算语言学大会 CCL。**
    - 用途：中文综述，围绕检索策略、内容处理及多模态知识增强展开，适合用于中文研究现状表述并追踪其参考文献。
    - 链接：[ACL Anthology PDF](https://aclanthology.org/2024.ccl-2.9.pdf)

## 4. 补充前沿线索（第二轮筛选）

以下文献较新或仍为预印本，适合写“研究趋势与展望”，不建议在核心论证中占比过高：

- **Ask in Any Modality: A Comprehensive Survey on Multimodal Retrieval-Augmented Generation** (2025), arXiv:2502.08826。用于补充多模态查询、检索、融合、增强和生成的分类框架。[链接](https://arxiv.org/abs/2502.08826)
- **Multi-modal Retrieval Augmented Multi-modal Generation: Datasets, Evaluation Metrics and Strong Baselines** (2024), arXiv:2411.16365。适合关注多模态输出及基准评价。[链接](https://arxiv.org/abs/2411.16365)
- **Self-adaptive Multimodal Retrieval-Augmented Generation** (2024), arXiv:2410.11321。讨论动态决定检索数量、降低固定 Top-k 带来的噪声。[链接](https://arxiv.org/abs/2410.11321)
- **DRAGIN: Dynamic Retrieval Augmented Generation based on the Information Needs of Large Language Models** (2024), arXiv:2403.10081。讨论“何时检索、检索什么”。[链接](https://arxiv.org/abs/2403.10081)
- **GENIUS: A Generative Framework for Universal Multimodal Search** (2025), CVPR。用于追踪通用多模态检索的新范式。[链接](https://openaccess.thecvf.com/content/CVPR2025/html/Kim_GENIUS_A_Generative_Framework_for_Universal_Multimodal_Search_CVPR_2025_paper.html)

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
