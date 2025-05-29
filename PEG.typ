// Get Polylux from the official package repository
#import "@preview/touying:0.5.5": *
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#import fletcher.shapes: arc
#import themes.university: *

#import "@preview/numbly:0.1.0": numbly
#import fletcher.shapes: diamond


// set headings
#set heading(numbering: numbly("{1}.", default: "1.1"))
#show heading: set align(start + top)
#show heading: set text(size: 28pt)

// Make the paper dimensions fit for a presentation and the text larger
#set footnote.entry(clearance: 0.1em, gap: 0.2em)

#set align(horizon)

// custom functions
#let lb = linebreak(justify: false)
#let refs(body) = {
  set text(size: 8pt)
  align(right, body)
}

#let pie-chart = (values, colors) => diagram(
  // values: [数値, ...]
  // colors: ["red", "blue", ...]
  let total = sum(values)
  let start = 0.0
  for i in range(len(values)) {
    let angle = values[i] / total * 360
    arc(
      center: (0, 0),
      radius: 80pt,
      angles: (start, start + angle),
      fill: colors[i],
      stroke: none
    )
    start += angle
  }
  // 枠線を描きたい場合はここにcircleなどを追加
)


// set lists
#set list(marker: ([•], [◦], [🗸]))
#let list-counter = counter("list")

#show list: set text(14pt)
#show list: it => {
  list-counter.step()

  context {
    set text(24pt) if list-counter.get().first() == 1
    set text(20pt) if list-counter.get().first() == 2
    set text(16pt) if list-counter.get().first() >= 3
    it
  }
  list-counter.update(i => i - 1)
}

// for main text
#set text(
  lang: "ja", // 英語しか使わない文書では"en"とする（もしくは指定しない）
  font: "Noto Serif CJK JP",
  // font: (日本語文字を含まないフォント, 日本語文字を含むフォント),  となっている
)

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [PEGについての覚書],
    subtitle: [人生終末期の代替栄養],
    author: [Nozomi Niimi],
    date: datetime.today(),
    institution: [東京医療センター],
  ),
)

#title-slide()

== 目次

- PEGとは
- PEGの適応
- PEGの挿入方法
- PEGの合併症
- PEGの管理
- PEGの除去
- まとめ


== PEGとは

- PEG（Percutaneous Endoscopic Gastrostomy）は、内視鏡を用いて胃に直接カテーテルを挿入する手技です。主に、経口摂取が困難な患者に対して栄養補給を行うために使用されます。
#refs("Nihon Shokakibyo Gakkai Zasshi. 2009;106(9):1313-1320.")



