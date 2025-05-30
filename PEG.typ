// Get Polylux from the official package repository
#import "@preview/touying:0.5.5": *
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
// #import fletcher.shapes: arc
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

- 代替栄養とは
- PEGとは
- PEGの適応
- PEGの挿入方法
- PEGの合併症
- PEGの管理
- PEGの除去
- まとめ

== 代替栄養とは

- 代替栄養（Artificial Nutrition）は、経口摂取が困難な患者に対して、栄養を補給するための医療行為
- 主に、経管栄養（Enteral Nutrition）と静脈栄養（Parenteral Nutrition）の2つに分類される
- 経管栄養は、口から胃や腸に直接栄養を供給する方法で、PEGもその一つ
- 静脈栄養は、CVポートや中心静脈カテーテルを通じて行う
- 皮下点滴も一応入れたり入れなかったり

== 代替栄養の利点・欠点

#table(
  columns: 3,
  [方法], [メリット], [デメリット],
  [経鼻胃管], [簡単に入る、合併症はほぼない、十分に栄養が入る], [抑制が必要、長期使用は難しい],
  [胃瘻], [十分に栄養が入る、長期に使える、抑制は不要な可能性が高い], [倫理的問題、作成時の合併症の発症],
  [CVポート], [比較的侵襲性は低い、十分な栄養が入る], [肝障害、*感染症のリスク*],
)

== 代替栄養を考える時

- 嚥下機能低下
- 意識障害
- 消化管の機能不全
など

== 嚥下機能低下の予後？

== 代替栄養についてのコンセンサス

- FAST 7C+の人だと意義はないかも

== PEGとは

- PEG（Percutaneous Endoscopic Gastrostomy）は、内視鏡を用いて胃に直接カテーテルを挿入する手技です。主に、経口摂取が困難な患者に対して栄養補給を行うために使用されます。
#refs("Nihon Shokakibyo Gakkai Zasshi. 2009;106(9):1313-1320.")

== PEGの適応


