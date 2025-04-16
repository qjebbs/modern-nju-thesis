#import "../utils/style.typ": 字号, 字体
#import "../utils/double-underline.typ": double-underline
#import "../utils/invisible-heading.typ": invisible-heading

// 基本信息 + 摘要页
#let abstract(
  // documentclass 传入的参数
  anonymous: false,
  twoside: false,
  fonts: (:),
  // 其他参数
  outline-title: "摘　要",
  outlined: true,
  keywords: (),
  leading: 1.28em,
  spacing: 1.28em,
  body,
) = {
  // 1.  默认参数
  fonts = 字体 + fonts
 
  // 2.  对参数进行处理

  // 3.  内置辅助函数

  // 4.  正式渲染
  // pagebreak(weak: true)
  
  [
    #set text(font: fonts.宋体, size: 字号.小四)
    #set par(leading: leading, justify: true, spacing: spacing)

    // #show par: set block()

    // 标记一个不可见的标题用于目录生成
    #invisible-heading(level: 1, outlined: outlined, outline-title)
   
    #v(15pt)

    #{
      set par(first-line-indent: 0pt)
      {
        set text(font:字体.黑体, size: 字号.四号, weight: "bold")
        "摘　要："
      }
      {
        set text(font:字体.宋体, size: 字号.四号)
        body
      }
    }

    #if keywords.len() > 0 {
      set par(first-line-indent: 0pt)
      {
        set text(font: 字体.黑体, size: 字号.四号, weight: "bold")
        [关键词：]
      }
      (("",)+ keywords.intersperse("；")).sum()
    }
    #v(1em)
  ]
}