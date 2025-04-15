// #import "@preview/simple-thesis:0.4.0": documentclass
#import "../lib.typ": documentclass

// 你首先应该安装 https://github.com/qjebbbs/simple-thesis/tree/main/fonts/FangZheng 里的所有字体，
// 如果是 Web App 上编辑，你应该手动上传这些字体文件，否则不能正常使用「楷体」和「仿宋」，导致显示错误。

#let (
  // 布局函数
  twoside, doc, preface, mainmatter, appendix,
  // 页面函数
  fonts-display-page, abstract, bilingual-bibliography,
  outline-page, list-of-figures, list-of-tables, notation, acknowledgement,
) = documentclass(
  // anonymous: true,  // 匿名模式
  twoside: true,  // 双面模式，会加入空白页，便于打印
  // 你会发现 Typst 有许多警告，这是因为 simple-thesis 加入了很多不必要的 fallback 字体
  // 你可以自定义字体消除警告，先英文字体后中文字体，应传入「宋体」、「黑体」、「楷体」、「仿宋」、「等宽」
  // fonts: (楷体: (name: "Times New Roman", covers: "latin-in-cjk"), "FZKai-Z03S")),
  info: (
    title: "适用于日常交流的简易论文模板",
    authors: (
      ("张三", "13333333333", "alice@example.org"),
      ("李四", "14444444444", "bob@example.org"),
      ("王五", "15555555555", "charly@example.org"),
    ),
  ),
  // 参考文献源
  bibliography: bibliography.with("ref.bib"),
)
#show: doc // 文稿设置

// #fonts-display-page() // 字体展示测试页

// #show: preface // 前言
// #outline-page() // 目录
// #list-of-figures() // 插图目录
// #list-of-tables() // 表格目录

#show: mainmatter // 标题与正文

// 中文摘要
#abstract(
  keywords: ("我", "就是", "测试", "关键词")
)[
  中文摘要
]

// 符号表
// #notation[
//   / DFT: 密度泛函理论 (Density functional theory)
//   / DMRG: 密度矩阵重正化群密度矩阵重正化群密度矩阵重正化群 (Density-Matrix Reformation-Group)
// ]

= 导　论

== 列表

=== 无序列表

- 无序列表项一
- 无序列表项二
  - 无序子列表项一
  - 无序子列表项二

=== 有序列表

+ 有序列表项一
+ 有序列表项二
  + 有序子列表项一
  + 有序子列表项二

=== 术语列表

/ 术语一: 术语解释
/ 术语二: 术语解释

== 图表

引用@tbl:timing，引用@tbl:timing-tlt，以及@fig:nju-logo。引用图表时，表格和图片分别需要加上 `tbl:`和`fig:` 前缀才能正常显示编号。

#align(center, (stack(dir: ltr)[
  #figure(
    table(
      align: center + horizon,
      columns: 4,
      [t], [1], [2], [3],
      [y], [0.3s], [0.4s], [0.8s],
    ),
    caption: [常规表],
  ) <timing>
][
  #h(50pt)
][
  #figure(
    table(
      columns: 4,
      stroke: none,
      table.hline(),
      [t], [1], [2], [3],
      table.hline(stroke: .5pt),
      [y], [0.3s], [0.4s], [0.8s],
      table.hline(),
    ),
    caption: [三线表],
  ) <timing-tlt>
]))

#figure(
  image("images/nju-emblem.svg", width: 20%),
  caption: [图片测试],
) <nju-logo>


== 数学公式

可以像 Markdown 一样写行内公式 $x + y$，以及带编号的行间公式：

$ phi.alt := (1 + sqrt(5)) / 2 $ <ratio>

引用数学公式需要加上 `eqt:` 前缀，则由@eqt:ratio，我们有：

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

我们也可以通过 `<->` 标签来标识该行间公式不需要编号

$ y = integral_1^2 x^2 dif x $ <->

而后续数学公式仍然能正常编号。

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

== 参考文献

可以像这样引用参考文献：图书#[@蒋有绪1998]和会议#[@中国力学学会1990]。

== 代码块

代码块支持语法高亮。引用时需要加上 `lst:` @lst:code

#figure(
  ```py
  def add(x, y):
    return x + y
  ```,
  caption:[代码块],
) <code>


= 正　文

== 正文子标题

=== 正文子子标题

正文内容


// 手动分页
#if twoside {
  pagebreak() + " "
}

// 中英双语参考文献
// 默认使用 gb-7714-2015-numeric 样式
#bilingual-bibliography(full: true)

// 致谢
#acknowledgement[
  感谢 NJU-LUG，感谢 NJUThesis LaTeX 模板。
]

// 手动分页
#if twoside {
  pagebreak() + " "
}


// 附录
#show: appendix

= 附录

== 附录子标题

=== 附录子子标题

附录内容，这里也可以加入图片，例如@fig:appendix-img。

#figure(
  image("images/nju-emblem.svg", width: 20%),
  caption: [图片测试],
) <appendix-img>
