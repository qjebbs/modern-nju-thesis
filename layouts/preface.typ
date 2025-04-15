// 前言，重置页面计数器
#let preface(
  // documentclass 传入的参数
  twoside: false,
  ..args,
  it,
) = {
  pagebreak(weak: true, to: if twoside { "odd" })
  counter(page).update(1)
  set page(numbering: "I")
  it
}