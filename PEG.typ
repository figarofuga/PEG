// Get Polylux from the official package repository
#import "@preview/touying:0.5.5": *
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
// #import fletcher.shapes: arc
#import themes.university: *

#import "@preview/numbly:0.1.0": numbly
#import fletcher.shapes: diamond

#import "@preview/cetz:0.3.2"
#import "@preview/cetz-plot:0.1.1": chart



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

#outline(title: [Table of contents], depth: 1)
#show outline: set text(size: 24pt)

= 代替栄養とは

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


= PEGとは


== PEGとは

- PEG（Percutaneous Endoscopic Gastrostomy）は、内視鏡を用いて胃に直接カテーテルを挿入する手技です。主に、経口摂取が困難な患者に対して栄養補給を行うために使用されます。
#refs("Nihon Shokakibyo Gakkai Zasshi. 2009;106(9):1313-1320.")

== PEGの適応


#let data = (
  ([Belgium], 24),
  ([Germany], 31),
  ([Greece], 18),
  ([Spain], 21),
  ([France], 23),
  ([Hungary], 18),
  ([Netherlands], 27),
  ([Romania], 17),
  ([Finland], 26),
  ([Turkey], 13),
)

#cetz.canvas({
  let colors = gradient.linear(red, blue, green, yellow)

  chart.piechart(
    data,
    value-key: 1,
    label-key: 0,
    radius: 4,
    slice-style: colors,
    inner-radius: 1,
    outset: 3,
    inner-label: (content: (value, label) => [#text(white, str(value))], radius: 110%),
    outer-label: (content: "%", radius: 120%),
  )
})

== PEGの合併症

- 日本の2007-2010年のDPCデータ(n = 64,219)
  - 30日死亡は6.2%, 院内死亡は11.9%
  - 特に、男性、高齢者などが高リスク
  - 合併症は創部感染(0.9%), 腹膜炎(0.8%), 消化管穿孔(2.6%), 消化管出血(0.03%), 腹腔内出血(0.03%)など

#table(
  columns: 2,
  [subgroup], [粗の院内死亡率],
  [70-89歳 vs. 90歳以上], [12.0% vs. 14.6%],
  [男性 vs. 女性], [12.4% vs. 9.6%],
  [認知症のみ vs. 認知症+肺炎], [4.8% vs. 12.1%],
  [脳血管疾患のみ vs. 脳血管疾患+肺炎], [5.6% vs. 14.7%],
)

#refs("Gastrointest Endosc. 2014;80(1):88-96. doi:10.1016/j.gie.2013.12.006")
