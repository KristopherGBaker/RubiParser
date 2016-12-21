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
    if case RubiNode.Ruby(let kanji, let reading) = node {
        print("Kanji: \(kanji) \(reading)")
    }
    else if case RubiNode.Word(let text) = node {
        print(text)
    }
    else if case RubiNode.Text(let text) = node {
        print(text)
    }
    else if case RubiNode.Paragraph(let children) = node {
        children.forEach { printNode(node: $0) }
    }
}

```

### Example RubiDocument structure

```
▿ 6 elements
  ▿ 0 : RubiNode
    ▿ Paragraph : 15 elements
      ▿ 0 : RubiNode
        - Word : "スウェーデン"
      ▿ 1 : RubiNode
        - Text : "の"
      ▿ 2 : RubiNode
        - Word : "ストックホルム"
      ▿ 3 : RubiNode
        - Text : "で"
      ▿ 4 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "１０日"
          - .1 : "とおか"
      ▿ 5 : RubiNode
        - Text : "、"
      ▿ 6 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "今年"
          - .1 : "ことし"
      ▿ 7 : RubiNode
        - Text : "の"
      ▿ 8 : RubiNode
        - Word : "ノーベル"
      ▿ 9 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "賞"
          - .1 : "しょう"
      ▿ 10 : RubiNode
        - Text : "を"
      ▿ 11 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "渡"
          - .1 : "わた"
      ▿ 12 : RubiNode
        - Text : "す"
      ▿ 13 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "式"
          - .1 : "しき"
      ▿ 14 : RubiNode
        - Text : "がありました。"
  ▿ 1 : RubiNode
    ▿ Paragraph : 32 elements
      ▿ 0 : RubiNode
        - Text : "まず、"
      ▿ 1 : RubiNode
        - Word : "ノーベル"
      ▿ 2 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "賞"
          - .1 : "しょう"
      ▿ 3 : RubiNode
        - Text : "の"
      ▿ 4 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "団体"
          - .1 : "だんたい"
      ▿ 5 : RubiNode
        - Text : "が「"
      ▿ 6 : RubiNode
        - Word : "アメリカ"
      ▿ 7 : RubiNode
        - Text : "や"
      ▿ 8 : RubiNode
        - Word : "ヨーロッパ"
      ▿ 9 : RubiNode
        - Text : "で"
      ▿ 10 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "科学"
          - .1 : "かがく"
      ▿ 11 : RubiNode
        - Text : "を"
      ▿ 12 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "否定"
          - .1 : "ひてい"
      ▿ 13 : RubiNode
        - Text : "するような"
      ▿ 14 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "政治"
          - .1 : "せいじ"
      ▿ 15 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "家"
          - .1 : "か"
      ▿ 16 : RubiNode
        - Text : "に"
      ▿ 17 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "賛成"
          - .1 : "さんせい"
      ▿ 18 : RubiNode
        - Text : "する"
      ▿ 19 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "人"
          - .1 : "ひと"
      ▿ 20 : RubiNode
        - Text : "が"
      ▿ 21 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "増"
          - .1 : "ふ"
      ▿ 22 : RubiNode
        - Text : "えています。"
      ▿ 23 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "今"
          - .1 : "いま"
      ▿ 24 : RubiNode
        - Text : "、"
      ▿ 25 : RubiNode
        - Word : "ノーベル"
      ▿ 26 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "賞"
          - .1 : "しょう"
      ▿ 27 : RubiNode
        - Text : "がとても"
      ▿ 28 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "大事"
          - .1 : "だいじ"
      ▿ 29 : RubiNode
        - Text : "になっています」と"
      ▿ 30 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "話"
          - .1 : "はな"
      ▿ 31 : RubiNode
        - Text : "しました。"
  ▿ 2 : RubiNode
    ▿ Paragraph : 36 elements
      ▿ 0 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "今年"
          - .1 : "ことし"
      ▿ 1 : RubiNode
        - Text : "の"
      ▿ 2 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "医学"
          - .1 : "いがく"
      ▿ 3 : RubiNode
        - Text : "・"
      ▿ 4 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "生理学"
          - .1 : "せいりがく"
      ▿ 5 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "賞"
          - .1 : "しょう"
      ▿ 6 : RubiNode
        - Text : "は"
      ▿ 7 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "日本"
          - .1 : "にっぽん"
      ▿ 8 : RubiNode
        - Text : "の"
      ▿ 9 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "大隅"
          - .1 : "おおすみ"
      ▿ 10 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "良典"
          - .1 : "よしのり"
      ▿ 11 : RubiNode
        - Text : "さんです。"
      ▿ 12 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "大隅"
          - .1 : "おおすみ"
      ▿ 13 : RubiNode
        - Text : "さんは、"
      ▿ 14 : RubiNode
        - Word : "リサイクル"
      ▿ 15 : RubiNode
        - Text : "する"
      ▿ 16 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "細胞"
          - .1 : "さいぼう"
      ▿ 17 : RubiNode
        - Text : "の"
      ▿ 18 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "働"
          - .1 : "はたら"
      ▿ 19 : RubiNode
        - Word : "き"
      ▿ 20 : RubiNode
        - Text : "「オートファジー」を"
      ▿ 21 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "研究"
          - .1 : "けんきゅう"
      ▿ 22 : RubiNode
        - Text : "しました。"
      ▿ 23 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "式"
          - .1 : "しき"
      ▿ 24 : RubiNode
        - Text : "では"
      ▿ 25 : RubiNode
        - Word : "スウェーデン"
      ▿ 26 : RubiNode
        - Text : "の"
      ▿ 27 : RubiNode
        - Word : "グスタフ"
      ▿ 28 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "国王"
          - .1 : "こくおう"
      ▿ 29 : RubiNode
        - Text : "が"
      ▿ 30 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "大隅"
          - .1 : "おおすみ"
      ▿ 31 : RubiNode
        - Text : "さんに"
      ▿ 32 : RubiNode
        - Word : "メダル"
      ▿ 33 : RubiNode
        - Text : "などを"
      ▿ 34 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "渡"
          - .1 : "わた"
      ▿ 35 : RubiNode
        - Text : "しました。"
  ▿ 3 : RubiNode
    ▿ Paragraph : 32 elements
      ▿ 0 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "今年"
          - .1 : "ことし"
      ▿ 1 : RubiNode
        - Text : "の"
      ▿ 2 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "文学賞"
          - .1 : "ぶんがくしょう"
      ▿ 3 : RubiNode
        - Text : "は"
      ▿ 4 : RubiNode
        - Word : "アメリカ"
      ▿ 5 : RubiNode
        - Text : "の"
      ▿ 6 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "歌手"
          - .1 : "かしゅ"
      ▿ 7 : RubiNode
        - Text : "の"
      ▿ 8 : RubiNode
        - Word : "ボブ・ディラン"
      ▿ 9 : RubiNode
        - Text : "さんですが、"
      ▿ 10 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "式"
          - .1 : "しき"
      ▿ 11 : RubiNode
        - Text : "には"
      ▿ 12 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "来"
          - .1 : "き"
      ▿ 13 : RubiNode
        - Text : "ませんでした。"
      ▿ 14 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "式"
          - .1 : "しき"
      ▿ 15 : RubiNode
        - Text : "では"
      ▿ 16 : RubiNode
        - Word : "ディラン"
      ▿ 17 : RubiNode
        - Text : "さんの"
      ▿ 18 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "友達"
          - .1 : "ともだち"
      ▿ 19 : RubiNode
        - Text : "の"
      ▿ 20 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "歌手"
          - .1 : "かしゅ"
      ▿ 21 : RubiNode
        - Text : "の"
      ▿ 22 : RubiNode
        - Word : "パティ・スミス"
      ▿ 23 : RubiNode
        - Text : "さんが、"
      ▿ 24 : RubiNode
        - Word : "ディラン"
      ▿ 25 : RubiNode
        - Text : "さんが"
      ▿ 26 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "作"
          - .1 : "つく"
      ▿ 27 : RubiNode
        - Text : "った"
      ▿ 28 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "歌"
          - .1 : "うた"
      ▿ 29 : RubiNode
        - Text : "を"
      ▿ 30 : RubiNode
        ▿ Ruby : 2 elements
          - .0 : "歌"
          - .1 : "うた"
      ▿ 31 : RubiNode
        - Text : "いました。"
  ▿ 4 : RubiNode
    - Paragraph : 0 elements
  ▿ 5 : RubiNode
    - Paragraph : 0 elements
```
