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
// for tall slide
#let tall-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(
    width: 33.867cm,
    height: 33.867cm,
  ))
  touying-slide(self: self, body)
})

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
  [経鼻胃管], [
    - 簡単に入る
    - 合併症はほぼない
    - 十分に栄養が入る], [
      - 抑制が必要
      - 長期使用は難しい],
  [胃瘻], [
    - 十分に栄養が入る
    - 長期に使える
    - 抑制は不要な可能性が高い], [
      - 倫理的問題
      - 作成時の合併症の発症],
  [CVポート], [
    - 比較的侵襲性は低い
    - 十分な栄養が入る], [
      - 肝障害、
      - *感染症のリスク*],
)

== 代替栄養を考える時

- 嚥下機能低下
- 意識障害
- 消化管の機能不全
など

== 例えば

- 脳梗塞後で嚥下の回復が見込めるが時間がかかる時
  - 2-3週間以上、経鼻胃管が必要な時は胃瘻造設が考慮される
#refs("Stroke. 2018;49(3):e46-e110. doi:10.1161/STR.0000000000000158")
  - 咽頭部癌の術後、食道癌で経口摂取が困難な時など
  - 4週間を超える経管栄養で経鼻胃管よりPEGを推奨
#refs("Gut Liver. 2024;18(1):10-26.")
- *認知機能低下や年齢により恒久的に嚥下機能が低下している時*

== 我々が思う悩む時

- 患者の思い
- 家族の思い
- 医学的適応
- 倫理的適応  などを確認する

== 家族の思いとは？～世界

- 2/3の認知症がある施設の居住者はCareの第一目標は安楽である
- 26%は非侵襲的な治療のみ希望している(抗菌薬、経静脈治療)
- わずか7%が寿命延伸を第一目標としている
  
#refs("BMJ. 2025;389:e075326.")

== 日本においては？

#figure(
  image("figure/japan_iro_kibo.png", height: 50%),
  caption: [
    日本における人生終末期の医療希望
  ],
)

- 無回答の解釈が難しいが、医師も一般国民もほぼ同じ比率
  - 約10%が胃瘻を望み、約85%が望まない


#refs("
    人生の最終段階における医療・ケアに関する意識調査事業. 人生の最終段階における医療・ケアに関する意識調査報告書. 2022年5月.
    https://www.mhlw.go.jp/toukei/list/dl/saisyuiryo_a_r04.pdf  
")

== PEGの適応の決定方法

- 大きく分けて
  - 倫理的適応
  - 身体的適応  #lb に分けられる

== PEGの倫理的適応

#tall-slide[
  #figure(
  image("figure/PEG_rirni_tekiou.jpeg", height: 70%)
)
]

== PEGの身体的適応

#figure(
  image("figure/PEG_shintai_tekiou.jpeg", height: 100%)
)

= PEGとは

== PEGとは

- PEG（Percutaneous Endoscopic Gastrostomy）は、内視鏡を #lb 用いて胃瘻を作成する手法
- 1979年に米国で開発され、世界中に広まった
  - 1980年代には世界中の人工栄養の主流となった


#refs("日老医誌  2012；49：126―129")

== PEGの構造

#figure(
  image("figure/PEG_atglance.jpeg", height: 60%),
  caption: [
    PEGの見た目と構造
  ],
)


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
  [ボタン型], [
    #text(size: 20pt)[
      - 自己抜去のRiskが少ない]
    #text(size: 20pt)[
      - カテーテル汚染が少ない]], [
     #text(size: 20pt)[
      - 栄養剤との接続が複雑]
     #text(size: 20pt)[
      - 交換時までシャフト長を#lb 変更出来ない]],
  [チューブ型], [
    #text(size: 20pt)[
      - 栄養剤との接続が容易]
    #text(size: 20pt)[
      - 自己抜去のRiskが高い]]
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
  - 開腹でやる事もある
  - 入れ方でpush/pull法、Introducer法などがある
  - 当院では基本的にはIntroducer法/Introducer変法との事

== PEGの短期死亡率

- 日本の2007-2010年のDPCデータ(n = 64,219)
  - 30日死亡は6.2%, 院内死亡は11.9%
  - 特に、男性、高齢者などが高リスク

#table(
  columns: 2,
  [subgroup], [粗の院内死亡率],
  [70-89歳 vs. 90歳以上], [12.0% vs. 14.6%],
  [男性 vs. 女性], [12.4% vs. 9.6%],
  [認知症のみ vs. 認知症+肺炎], [4.8% vs. 12.1%],
  [脳血管疾患のみ vs. 脳血管疾患+肺炎], [5.6% vs. 14.7%],
)

#refs("Gastrointest Endosc. 2014;80(1):88-96.")

== PEGの周術期合併症

- 2週間以内の早期合併症と晩期合併症に別れる
  - 早期合併症の方が予後が悪い
- 大きく分けて、感染症、出血、消化管穿孔、その他に分けられる
  - 感染症は創部感染、腹膜炎、肺炎など
  - 出血は胃粘膜の損傷、血管損傷
  - 消化管穿孔は胃壁の損傷、腸管損傷
- PEG特有なのはバンパー埋没症候群やボールバルブ症候群

== PEGの周術期合併症の発症率

- 世界的には5-20%
#refs("Dig Dis Sci. 2021;66(5):1593-1599.")
#refs("BMC Gastroenterol. 2022;22(1):361.")
- 合併症自身と死亡は相関しない
#refs("Dig Liver Dis. 2019;51(10):1380-1387.")
- 日本でも同程度(上記、DPCデータだと約5%、単施設だと約20%)
  - 感染症が80%で最多(肺炎は約25%、創部感染が約8%)
  - 緊急手術が必要な状態はPEG施行のうち1.6%
#refs("Ann Nutr Metab. 2020;76(6):413-421.")

== 合併症各論～バンパー埋没症候群とは

#figure(
  image("figure/bumper_embedded.png", height: 45%)
)

- PEGの内部のバンパーの締まりが強すぎて#lb 胃粘膜の血流障害を起こすこと
  - 内部バンパーは徐々に胃壁に埋没してしまう
- 適切なタイミングでバンパーを緩める必要がある
  - 当院では24時間後

#refs("https://www.peg.or.jp/lecture/peg/06-03-01.html")

== 合併症各論～ボールバルブ症候群とは

#figure(
  image("figure/ball_valve.png", height: 55%)
)

- バルーン型カテーテルの先端バルーンが十二指腸に嵌頓してしまう
- 嘔吐を繰り返すが胆汁や栄養剤が出てこないのが特徴
- バルーンを虚脱させ、胃内に戻す

#refs("https://www.peg.or.jp/lecture/peg/06-03-02.html")

== PEGの交換

- 日本では
  - バルーン型だと1-2ヶ月毎が多い
  - 日本ではバンパー型だと4-6ヶ月毎が多い
#refs("https://www.peg.or.jp/lecture/peg/04-01.html")
- 海外のガイドラインではバルーン型だと3-6ヶ月毎
#refs("Clin Endosc. 2023;56(4):391-408.")

== PEGの交換方法

- カテーテル非切断法とカテーテル切断法がある
  - カテーテル切断法は内部ストッパーを一旦切り離し、古いカテーテルを抜き去った後、新しいカテーテルを用手的に挿入した後、内視鏡で古い内部ストッパーを回収する方法
- いずれにせよ、PEG交換後の胃内の留置確認が必要

== PEG交換後の胃内留置確認法

#table(
  columns: 2,
  [間接確認法], [
    - 送気音による確認 → 非推奨
    - 胃内容物の吸引による確認 → 非推奨
    - 色素液注入による確認（スカイブルー法）
    - レントゲン設備を利用した確認
  ],
  [直接確認法], [
    - 経胃瘻カテーテル内視鏡による確認
    - 経鼻/経口内視鏡による確認
  ]
)

#refs("https://www.peg.or.jp/lecture/peg/04-03.html")

- 当院だと、非切断法でインジゴカルミン液を用いたスカイブルー法の併用が多い

= PEGの長期予後

== PEGの長期予後総論

- PEGの患者の観察研究の予後はかなり差がある
  - 傾向として日本だと長く、欧米だと短い
- これはPEGをやっている患者層の差が大きそう

== 重症認知症の場合

#figure(
  image("figure/cascade_km.drawio.svg", height: 60%),
  caption: [
    Kaplan-meier curve in CASCADE trial.
  ],
)

- 2009年のCASCADE trialにおいて、肺炎合併の重度認知症患者の中央値は6ヶ月


#refs("N Engl J Med. 2009;361(16):1529-1538.")


== 重症認知症のSystematic review


- 最低限抑えるべきSystematic review
- FAST 7C+以降の患者において、PEGは
  - 生命予後
  - 栄養状態
  - QOL  をいずれも改善しない

#refs("Cochrane Database Syst Rev. 2021;8(8):CD013503.")


== 非重症認知症の場合は


- 2014-2018年のカナダの大規模データ
- 65歳以上の認知症のPEG患者(実際の平均年齢は約84歳、#lb n = 1,312)
- 1年生存率は約50%

#refs("JAMA Netw Open. 2025;8(2):e2460780.")


== 日本のデータ

#figure(
  image("figure/stratified_pneumonia_km.png", height: 55%),
  caption: [
    誤嚥性肺炎患者の生命予後
  ],
)

- 聖隷浜松病院のデータ
- 全体だと、誤嚥性肺炎患者のうち半数は1年以内に亡くなる
- 特に、経口摂取できないと誤嚥性肺炎の予後は極めて悪い


#refs("Dysphagia. 2024;39(5):837-845.")

== とは言え


- PEGの患者の研究の予後は研究によってめちゃくちゃ違う
  - 古い日本の研究だと、2年以上生きている人も半数超えるものもある
#refs("World J Gastroenterol. 2010;16(40):5084-5091.")
- やはり、手技というよりは患者背景による
- 特にRCTがないので、非PEG患者の予後との比較は不可能
- 一つ一つの症例で悩むくらいが良いのかも


== Take home message

- PEGの適応は倫理的適応と身体的適応を考慮する
- PEGの短期合併症はそこそこあるが、適切に管理すれば問題ない
- PEGの長期予後は患者背景によるが、一人ひとり迷うくらいがちょうど良い

== 最後に

#figure(
  image("figure/hand_feeding.png", height: 60%)
)

#refs("JAMA. 2025;334(6):550. doi:10.1001/jama.2025.7857")

- 最後まで手で食べることが重要なんだと思う