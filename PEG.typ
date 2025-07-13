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

// キャプションのフォントサイズを10ptに設定
#show figure.caption: set text(size: 10pt)

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

- 基本的にはかなり悪いが、原疾患による
- 例えば、誤嚥性肺炎や認知機能低下によるものは極端に予後が悪い

== Landmark trial

#figure(
  image("figure/cascade_km.drawio.svg"),
  caption: [
    Kaplan meier curve in CASCADE trial.
  ],
)

- 2009年のCASCADE trial
- 肺炎合併の重度認知症患者の中央値は6ヶ月

#refs("N Engl J Med. 2009;361(16):1529-1538.")

== 日本のデータ

- 聖隷浜松病院のデータ


#refs("
    Honda Y, Homma Y, Nakamura M, Ojima T, Saito K. Extremely Poor Post-discharge Prognosis in Aspiration Pneumonia and Its Prognostic Factors: A Retrospective Cohort Study. Dysphagia. Published online February 22, 2024. doi:10.1007/s00455-023-10665-z
  ")

== 現在の世界的コンセンサス

- 重度認知症患者に対する人工栄養は、予後改善、QOL改善、栄養状態の改善に寄与しない
  - ただし、RCTは存在しない
  - 改善のEvidenceがない事 ≠ 改善しないEvidenceがある事 に注意
#refs("Cochrane Database Syst Rev. 2021;8(8):CD013503.")

== 家族の思いとは？～世界

- 2/3の認知症がある施設の居住者はCareの第一目標は安楽である
- 26%は非侵襲的な治療のみ希望している(抗菌薬、経静脈治療、入院)
- わずか7%が寿命延伸を第一目標としている
  
#refs("BMJ. 2025;389:e075326.")

== 家族の思いとは？～日本

#figure(
  image("figure/japan_iro_kibo.png", height: 70%),
  caption: [
    日本における人生終末期の医療希望
  ],
)

#refs("
    人生の最終段階における医療・ケアに関する意識調査事業. 人生の最終段階における医療・ケアに関する意識調査報告書. 2022年5月.
    https://www.mhlw.go.jp/toukei/list/dl/saisyuiryo_a_r04.pdf  
")

== PEGの適応の決定方法

- 大きく分けて
  - 倫理的適応
  - 身体的適応  に分けられる

== PEGの倫理的適応

#figure(
  image("figure/PEG_rirni_tekiou.jpeg", height: 70%)
)

== PEGの身体的適応

#figure(
  image("figure/PEG_shintai_tekiou.jpeg", height: 70%)
)

= PEGとは

== PEGとは

#figure(
  image("figure/PEG_atglance.jpeg", height: 70%),
  caption: [
    PEGの見た目と構造
  ],
)

- PEG（Percutaneous Endoscopic Gastrostomy）は、内視鏡を用いて胃に直接カテーテルを挿入する手技。

#refs("Nihon Shokakibyo Gakkai Zasshi. 2009;106(9):1313-1320.")

== PEGの種類

#figure(
  image("figure/PEG_shurui.jpeg", height: 60%),
  caption: [
    PEGの種類
  ],
)

- 外部ストッパーと内部ストッパーで大別される
  - 外部ストッパー: ボタン型/チューブ型
  - 内部ストッパー: バルーン/バンパー型

== 外部ストッパーについて

#table(
  columns: 3,
  [外部ストッパー], [メリット], [デメリット],
  [ボタン型], [自己抜去のRiskが少ない #lb カテーテル汚染が少ない], [栄養剤との接続が複雑 #lb 交換時までシャフト長を変更出来ない],
  [チューブ型], [栄養剤との接続が容易], [自己抜去のRiskが高い]
)

- ボタン型が良いのは
  - 若くて理解力がある元気な患者
  - 逆に自己抜去のRiskが非常に高い患者で良い適応
- チューブ型が良いのは
  - 理解力があるが麻痺などで細かい作業が困難な患者で良い適応


== PEGの入れ方

#figure(
  image("figure/PEG_introducer.jpeg", height: 50%),
  caption: [
    Introducer変法(direct法)
  ],
)

- 基本的には内視鏡を用いて皮膚から胃壁を通して胃にカテーテルを挿入する
  - どうしてももできない時は開腹でやる事もある
  - 入れ方でpush/pull法、Introducer法などがある
  - 当院では基本的にはIntroducer法/Introducer変法との事

== PEGの適応

- ガイドライン上は4週間を超える経管栄養で経鼻胃管より推奨

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

== PEGの短期合併症

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

#refs("Gastrointest Endosc. 2014;80(1):88-96.")

== PEGの交換

- Balloon型だと1-3ヶ月毎
- バンパー型だと4-6ヶ月毎

== PEGの長期予後

- aa

#refs("JAMA Netw Open. 2025;8(2):e2460780.")

#refs(" World J Gastroenterol. 2010;16(40):5084-5091. doi:10.3748/wjg.v16.i40.5084")


  
