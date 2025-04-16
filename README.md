# 适用于日常交流的简易论文模板 simple-thesis

基于[南京大学毕业论文](https://typst.app/universe/package/modern-nju-thesis)修改的 Typst 模板，更简洁、适适用于日常交流。

## 使用

未发布为 Typst 包，所以需要手动下载。

```sh
git clone https://github.com/qjebbs/simple-thesis lib
```

```typst
#import "lib/lib.typ": documentclass
```

导入即可。

### 为什么图表的引用结果与展示不一致？

这是因为本模板引入了 `@preview/i-figured` 库，
引用时必须加上标签前缀 `fig:`, `tbl:`, 或 `lst:`，这是其特有的行为。

```typst
应使用 `@fig:example` 引用为“图1.1”，若通过 `@example` 引用则显示为“图1”
#figure(
  caption: [Example],
  [img]
) <example>
```

### 为什么我的字体没有显示出来，而是一个个「豆腐块」？

这是因为本地没有对应的字体，**这种情况经常发生在 MacOS 的「楷体」显示上**。

你应该安装本目录下的 `fonts` 里的所有字体，里面包含了可以免费商用的「方正楷体」和「方正仿宋」，然后再重新渲染测试即可。

你可以使用 `#fonts-display-page()` 显示一个字体渲染测试页面，查看对应的字体是否显示成功。

如果还是不能成功，你可以按照模板里的说明自行配置字体，例如

```typst
#let (...) = documentclass(
  fonts: (楷体: ((name: "Times New Roman", covers: "latin-in-cjk"), "FZKai-Z03S")),
)
```

先是填写英文字体，然后再填写你需要的「楷体」中文字体。

**字体名称可以通过 `typst fonts` 命令查询。**

如果找不到你所需要的字体，可能是因为 **该字体变体（Variants）数量过少**，导致 Typst 无法识别到该中文字体。


### 为什么 Typst 有很多关于字体的警告？

你会发现 Typst 有许多关于字体的警告，这是因为 modern-nju-thesis 加入了很多不必要的 fallback 字体，你可以自定义字体消除警告，先英文字体后中文字体，应传入「宋体」、「黑体」、「楷体」、「仿宋」、「等宽」。

```typst
#let (...) = documentclass(
  fonts: (楷体: ((name: "Times New Roman", covers: "latin-in-cjk"), "FZKai-Z03S")),
)
```

## License

This project is licensed under the MIT License.
