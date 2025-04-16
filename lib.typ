#import "layouts/doc.typ": doc
#import "layouts/preface.typ": preface
#import "layouts/mainmatter.typ": mainmatter
#import "layouts/appendix.typ": appendix
#import "pages/fonts-display-page.typ": fonts-display-page
#import "pages/abstract.typ": abstract
#import "pages/bachelor-outline-page.typ": bachelor-outline-page
#import "pages/list-of-figures.typ": list-of-figures
#import "pages/list-of-tables.typ": list-of-tables
#import "pages/notation.typ": notation
#import "pages/acknowledgement.typ": acknowledgement
#import "utils/bilingual-bibliography.typ": bilingual-bibliography
#import "utils/custom-numbering.typ": custom-numbering
#import "utils/custom-heading.typ": heading-display, active-heading, current-heading
#import "@preview/i-figured:0.2.4": show-figure, show-equation
#import "utils/style.typ": 字体, 字号

#let indent = h(2em)

// 使用函数闭包特性，通过 `documentclass` 函数类进行全局信息配置，然后暴露出拥有了全局配置的、具体的 `layouts` 和 `templates` 内部函数。
#let documentclass(
  twoside: false,  // 双面模式，会加入空白页，便于打印
  anonymous: false,  // 匿名模式
  bibliography: none,  // 原来的参考文献函数
  fonts: (:),  // 字体，应传入「宋体」、「黑体」、「楷体」、「仿宋」、「等宽」
  info: (:),
) = {
  // 默认参数
  fonts = 字体 + fonts
  info = (
    title: "",
    contacts: (),
  ) + info

  return (
    // 将传入参数再导出
    twoside: twoside,
    anonymous: anonymous,
    fonts: fonts,
    info: info,
    // 页面布局
    doc: (..args) => {
      doc(
        ..args,
        info: info + args.named().at("info", default: (:)),
      )
    },
    preface: (..args) => {
      preface(
        twoside: twoside,
        ..args,
      )
    },
    mainmatter: (..args) => {
      mainmatter(
        twoside: twoside,
        anonymous: anonymous,
        display-header: true,
        info: info + args.named().at("info", default: (:)),
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
      )
    },
    appendix: (..args) => {
      appendix(
        ..args,
      )
    },

    // 字体展示页
    fonts-display-page: (..args) => {
      fonts-display-page(
        twoside: twoside,
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
      )
    },

    // 中文摘要页，通过 type 分发到不同函数
    abstract: (..args) => {
      abstract(
        anonymous: anonymous,
        twoside: twoside,
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
      )
    },

    // 目录页
    outline-page: (..args) => {
      bachelor-outline-page(
        twoside: twoside,
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
      )
    },

    // 插图目录页
    list-of-figures: (..args) => {
      list-of-figures(
        twoside: twoside,
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
      )
    },

    // 表格目录页
    list-of-tables: (..args) => {
      list-of-tables(
        twoside: twoside,
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
      )
    },

    // 符号表页
    notation: (..args) => {
      notation(
        twoside: twoside,
        ..args,
      )
    },

    // 参考文献页
    bilingual-bibliography: (..args) => {
      bilingual-bibliography(
        bibliography: bibliography,
        ..args,
      )
    },

    // 致谢页
    acknowledgement: (..args) => {
      acknowledgement(
        anonymous: anonymous,
        twoside: twoside,
        ..args,
      )
    },
  )
}
