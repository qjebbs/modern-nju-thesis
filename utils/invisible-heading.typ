// 用于创建一个不可见的标题，用于给 outline 加上短标题
#let invisible-heading(..args) = {
  set text(fill: rgb(0,0,0,0))
  // 使用 place 使其脱离文档流
  place(
    dx: 0pt,
    heading(numbering: none, ..args),
  )
}
