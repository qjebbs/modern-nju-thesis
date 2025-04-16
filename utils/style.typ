#let 字号 = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)

#let 字体 = (
  // 宋体，属于「有衬线字体」，一般可以等同于英文中的 Serif Font
  宋体: (
    (name: "Times New Roman", covers: "latin-in-cjk"),
    "Source Han Serif SC", 
    "Source Han Serif", 
    "Noto Serif CJK SC", 
    "SimSun", 
    "Songti SC", 
    "STSongti",
  ),
  // 黑体，属于「无衬线字体」，一般可以等同于英文中的 Sans Serif Font
  黑体: (
    (name: "Arial", covers: "latin-in-cjk"), // Arial（无衬线英文字体）
    "Source Han Sans SC", // 思源黑体（简体）
    "Source Han Sans", // 思源黑体
    "Noto Sans CJK SC", // 黑体（Windows）
    "SimHei", // 黑体（MacOS）
    "Heiti SC", 
    "STHeiti",
  ),
  // 楷体
  楷体: (
    (name: "Times New Roman", covers: "latin-in-cjk"),
    "Kaiti SC",
    "STKaiti", 
    "FZKai-Z03S",
  ),
  // 仿宋
  仿宋: (
    (
      name: "Times New Roman", covers: "latin-in-cjk"), 
      "FangSong", 
      "FangSong SC", 
      "STFangSong", 
      "FZFangSong-Z02S",
    ),
  // 等宽字体，用于代码块环境，一般可以等同于英文中的 Monospaced Font
  等宽: (
    (name: "Courier New", covers: "latin-in-cjk"), // Courier New（Windows 等宽英文字体）
    (name: "Menlo", covers: "latin-in-cjk"), 
    (name: "IBM Plex Mono", covers: "latin-in-cjk"), 
    "Source Han Sans HW SC", // 思源等宽黑体（简体）
    "Source Han Sans HW", // 思源等宽黑体
    "Noto Sans Mono CJK SC", // 黑体（Windows）
    "SimHei", // 黑体（MacOS）
    "Heiti SC", 
    "STHeiti",
  ),
)