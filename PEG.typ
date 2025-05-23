// Get Polylux from the official package repository
#import "@preview/touying:0.5.5": *
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#import themes.university: *

#import "@preview/numbly:0.1.0": numbly

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [PEGについての覚書],
    subtitle: [人生終末期の代替栄養],
    author: [Nozomi Niimi],
    date: datetime.today(),
    institution: [東京医療センター]
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#import fletcher.shapes: diamond


// Make the paper dimensions fit for a presentation and the text larger
#set footnote.entry(clearance: 0.1em, gap: 0.2em)
#show heading:set align(start + top)
#show heading: set text(size: 28pt)
#set align(horizon)

#let lb = linebreak(justify: false)

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
    lang: "ja",  // 英語しか使わない文書では"en"とする（もしくは指定しない）
    font: ("Noto Serif CJK JP"),  
    // font: (日本語文字を含まないフォント, 日本語文字を含むフォント),  となっている
)

// Use #polylux-slide to create a slide and style it using your favourite Typst functions
#title-slide(
  authors: ([Nozomi Niimi]), 
  date: datetime.today(), 
  title: [PEGについての覚書], 
  subtitle: [人生終末期の代替栄養], 
  institution: [東京医療センター])


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