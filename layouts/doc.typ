// 文稿设置，可以进行一些像页面边距这类的全局设置
#let doc(
  // documentclass 传入参数
  info: (:),
  // 其他参数
  fallback: false,  // 字体缺失时使用 fallback，不显示豆腐块
  lang: "zh",
  margin: (left:2.5cm, right:2cm, top:2.5cm, bottom:3.5cm,),
  it,
) = {
  // 1.  默认参数
  info = (
    authors: (
      ("张三",),
    ),
  ) + info
  if info.title == "" {
    info.title = "适用于日常交流的简易论文模板"
  }

  // 3.  基本的样式设置
  set text(fallback: fallback, lang: lang)
  set page(margin: margin)

  // 4.  PDF 元信息
  let authors = ()
  for a in info.authors {
    if a.len() > 0 {
      authors = authors + (a.first(),)
    }
  }
  set document(
    title: info.title,
    author: authors,
  )

  it
}