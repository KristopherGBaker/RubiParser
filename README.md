# RubiParser
Swift [Ruby character](https://en.wikipedia.org/wiki/Ruby_character) parser for NHK Easy News flavored HTML.

[![Build Status](https://travis-ci.org/KristopherGBaker/RubiParser.svg?branch=master)](https://travis-ci.org/KristopherGBaker/RubiParser)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/RubiParser.svg)](https://img.shields.io/cocoapods/v/RubiParser.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/RubiParser.svg?style=flat)](http://cocoadocs.org/docsets/RubiParser)

## Installation

### CocoaPods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

use_frameworks!

pod 'RubiParser'
```

## Examples

### Parsing

```swift
import RubiParser

let html = "<p><span class='colorL'>スウェーデン</span>の<span class='colorL'>ストックホルム</span>で<ruby>１０日<rt>とおか</rt></ruby>、<ruby>今年<rt>ことし</rt></ruby>の<a href='javascript:void(0)' class='dicWin' id='id-0000'><span class=\"under\">ノーベル</span><ruby><span class=\"under\">賞</span><rt>しょう</rt></ruby></a>を<ruby>渡<rt>わた</rt></ruby>す<ruby>式<rt>しき</rt></ruby>がありました。</p>"

let parser = RubiScannerParser()
let doc = parser.parse(html)

print(doc.kanjiString)
print(doc.kanaString)

doc.items.forEach { printNode(node: $0) }
    
func printNode(node: RubiNode) {
    if case RubiNode.ruby(let kanji, let reading) = node {
        print("Kanji: \(kanji) \(reading)")
    }
    else if case RubiNode.word(let text) = node {
        print(text)
    }
    else if case RubiNode.text(let text) = node {
        print(text)
    }
    else if case RubiNode.image(let url) = node {
        print(url)
    }
    else if case RubiNode.paragraph(let children) = node {
        children.forEach { printNode(node: $0) }
    }
}

```

### Example RubiDocument structure

```
▿ RubiDocument
  ▿ items : 6 elements
    ▿ 0 : RubiNode
      ▿ paragraph : 15 elements
        ▿ 0 : RubiNode
          - word : "スウェーデン"
        ▿ 1 : RubiNode
          - text : "の"
        ▿ 2 : RubiNode
          - word : "ストックホルム"
        ▿ 3 : RubiNode
          - text : "で"
        ▿ 4 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "１０日"
            - reading : "とおか"
        ▿ 5 : RubiNode
          - text : "、"
        ▿ 6 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "今年"
            - reading : "ことし"
        ▿ 7 : RubiNode
          - text : "の"
        ▿ 8 : RubiNode
          - word : "ノーベル"
        ▿ 9 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "賞"
            - reading : "しょう"
        ▿ 10 : RubiNode
          - text : "を"
        ▿ 11 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "渡"
            - reading : "わた"
        ▿ 12 : RubiNode
          - text : "す"
        ▿ 13 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "式"
            - reading : "しき"
        ▿ 14 : RubiNode
          - text : "がありました。"
    ▿ 1 : RubiNode
      ▿ paragraph : 32 elements
        ▿ 0 : RubiNode
          - text : "まず、"
        ▿ 1 : RubiNode
          - word : "ノーベル"
        ▿ 2 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "賞"
            - reading : "しょう"
        ▿ 3 : RubiNode
          - text : "の"
        ▿ 4 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "団体"
            - reading : "だんたい"
        ▿ 5 : RubiNode
          - text : "が「"
        ▿ 6 : RubiNode
          - word : "アメリカ"
        ▿ 7 : RubiNode
          - text : "や"
        ▿ 8 : RubiNode
          - word : "ヨーロッパ"
        ▿ 9 : RubiNode
          - text : "で"
        ▿ 10 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "科学"
            - reading : "かがく"
        ▿ 11 : RubiNode
          - text : "を"
        ▿ 12 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "否定"
            - reading : "ひてい"
        ▿ 13 : RubiNode
          - text : "するような"
        ▿ 14 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "政治"
            - reading : "せいじ"
        ▿ 15 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "家"
            - reading : "か"
        ▿ 16 : RubiNode
          - text : "に"
        ▿ 17 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "賛成"
            - reading : "さんせい"
        ▿ 18 : RubiNode
          - text : "する"
        ▿ 19 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "人"
            - reading : "ひと"
        ▿ 20 : RubiNode
          - text : "が"
        ▿ 21 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "増"
            - reading : "ふ"
        ▿ 22 : RubiNode
          - text : "えています。"
        ▿ 23 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "今"
            - reading : "いま"
        ▿ 24 : RubiNode
          - text : "、"
        ▿ 25 : RubiNode
          - word : "ノーベル"
        ▿ 26 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "賞"
            - reading : "しょう"
        ▿ 27 : RubiNode
          - text : "がとても"
        ▿ 28 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "大事"
            - reading : "だいじ"
        ▿ 29 : RubiNode
          - text : "になっています」と"
        ▿ 30 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "話"
            - reading : "はな"
        ▿ 31 : RubiNode
          - text : "しました。"
    ▿ 2 : RubiNode
      ▿ paragraph : 36 elements
        ▿ 0 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "今年"
            - reading : "ことし"
        ▿ 1 : RubiNode
          - text : "の"
        ▿ 2 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "医学"
            - reading : "いがく"
        ▿ 3 : RubiNode
          - text : "・"
        ▿ 4 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "生理学"
            - reading : "せいりがく"
        ▿ 5 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "賞"
            - reading : "しょう"
        ▿ 6 : RubiNode
          - text : "は"
        ▿ 7 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "日本"
            - reading : "にっぽん"
        ▿ 8 : RubiNode
          - text : "の"
        ▿ 9 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "大隅"
            - reading : "おおすみ"
        ▿ 10 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "良典"
            - reading : "よしのり"
        ▿ 11 : RubiNode
          - text : "さんです。"
        ▿ 12 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "大隅"
            - reading : "おおすみ"
        ▿ 13 : RubiNode
          - text : "さんは、"
        ▿ 14 : RubiNode
          - word : "リサイクル"
        ▿ 15 : RubiNode
          - text : "する"
        ▿ 16 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "細胞"
            - reading : "さいぼう"
        ▿ 17 : RubiNode
          - text : "の"
        ▿ 18 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "働"
            - reading : "はたら"
        ▿ 19 : RubiNode
          - word : "き"
        ▿ 20 : RubiNode
          - text : "「オートファジー」を"
        ▿ 21 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "研究"
            - reading : "けんきゅう"
        ▿ 22 : RubiNode
          - text : "しました。"
        ▿ 23 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "式"
            - reading : "しき"
        ▿ 24 : RubiNode
          - text : "では"
        ▿ 25 : RubiNode
          - word : "スウェーデン"
        ▿ 26 : RubiNode
          - text : "の"
        ▿ 27 : RubiNode
          - word : "グスタフ"
        ▿ 28 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "国王"
            - reading : "こくおう"
        ▿ 29 : RubiNode
          - text : "が"
        ▿ 30 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "大隅"
            - reading : "おおすみ"
        ▿ 31 : RubiNode
          - text : "さんに"
        ▿ 32 : RubiNode
          - word : "メダル"
        ▿ 33 : RubiNode
          - text : "などを"
        ▿ 34 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "渡"
            - reading : "わた"
        ▿ 35 : RubiNode
          - text : "しました。"
    ▿ 3 : RubiNode
      ▿ paragraph : 32 elements
        ▿ 0 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "今年"
            - reading : "ことし"
        ▿ 1 : RubiNode
          - text : "の"
        ▿ 2 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "文学賞"
            - reading : "ぶんがくしょう"
        ▿ 3 : RubiNode
          - text : "は"
        ▿ 4 : RubiNode
          - word : "アメリカ"
        ▿ 5 : RubiNode
          - text : "の"
        ▿ 6 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "歌手"
            - reading : "かしゅ"
        ▿ 7 : RubiNode
          - text : "の"
        ▿ 8 : RubiNode
          - word : "ボブ・ディラン"
        ▿ 9 : RubiNode
          - text : "さんですが、"
        ▿ 10 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "式"
            - reading : "しき"
        ▿ 11 : RubiNode
          - text : "には"
        ▿ 12 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "来"
            - reading : "き"
        ▿ 13 : RubiNode
          - text : "ませんでした。"
        ▿ 14 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "式"
            - reading : "しき"
        ▿ 15 : RubiNode
          - text : "では"
        ▿ 16 : RubiNode
          - word : "ディラン"
        ▿ 17 : RubiNode
          - text : "さんの"
        ▿ 18 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "友達"
            - reading : "ともだち"
        ▿ 19 : RubiNode
          - text : "の"
        ▿ 20 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "歌手"
            - reading : "かしゅ"
        ▿ 21 : RubiNode
          - text : "の"
        ▿ 22 : RubiNode
          - word : "パティ・スミス"
        ▿ 23 : RubiNode
          - text : "さんが、"
        ▿ 24 : RubiNode
          - word : "ディラン"
        ▿ 25 : RubiNode
          - text : "さんが"
        ▿ 26 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "作"
            - reading : "つく"
        ▿ 27 : RubiNode
          - text : "った"
        ▿ 28 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "歌"
            - reading : "うた"
        ▿ 29 : RubiNode
          - text : "を"
        ▿ 30 : RubiNode
          ▿ ruby : 2 elements
            - kanji : "歌"
            - reading : "うた"
        ▿ 31 : RubiNode
          - text : "いました。"
    ▿ 4 : RubiNode
      - paragraph : 0 elements
    ▿ 5 : RubiNode
      - paragraph : 0 elements
```
