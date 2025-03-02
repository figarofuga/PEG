# 基本イメージとしてRust公式イメージを使用
FROM ghcr.io/typst/typst:latest

# 必要なパッケージのインストール
RUN apk update && \
    apk --no-cache add git \
    musl-locales \
    musl-locales-lang \
    curl \
    unzip \
    msttcorefonts-installer \
    font-noto \
    font-noto-cjk \
    font-ipa \
    fontconfig && \
    update-ms-fonts && \
    fc-cache -f

# RUN apk add --no-cache curl fontconfig \
#     && curl -O https://moji.or.jp/wp-content/ipafont/IPAexfont/IPAexfont00301.zip \
#     && mkdir -p /usr/share/fonts/ipa \
#     && unzip -o -d /usr/share/fonts/ipa/ IPAexfont00301.zip "*.ttf" \
#     && rm IPAexfont00301.zip \
#     && fc-cache -fv \

# 環境変数 LANG を設定
ENV LANG ja_JP.UTF-8

# 原の味フォントのダウンロードと設置
# RUN mkdir -p /usr/share/fonts/truetype/haranoaji \
#     && curl -L https://github.com/trueroad/HaranoAjiFonts/releases/download/20220731/HaranoAjiGothic-20220731.zip -o HaranoAjiGothic.zip \
#     && curl -L https://github.com/trueroad/HaranoAjiFonts/releases/download/20220731/HaranoAjiMincho-20220731.zip -o HaranoAjiMincho.zip \
#     && unzip HaranoAjiGothic.zip -d /usr/share/fonts/truetype/haranoaji \
#     && unzip HaranoAjiMincho.zip -d /usr/share/fonts/truetype/haranoaji \
#     && rm HaranoAjiGothic.zip HaranoAjiMincho.zip \
#     && fc-cache -fv

RUN git config --global user.email "figarofuga@gmail.com" && \
    git config --global user.name "figarofuga"

# 環境変数の設定
# ENV TYPST_FONT_PATHS=/usr/share/fonts/truetype/haranoaji

# 作業ディレクトリを設定
WORKDIR /workspace

# コンテナ起動時に実行されるコマンド
CMD ["typst", "--help"]
