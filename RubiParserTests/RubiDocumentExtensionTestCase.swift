//
//  RubiDocumentExtensionTestCase.swift
//  RubiParser
//
//  Created by Kris Baker on 12/19/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

@testable import RubiParser
import XCTest

/// Tests for RubiDocument extension properties/methods.
class RubiDocumentExtensionTestCase: XCTestCase {

    /// The kanji version of the document.
    // swiftlint:disable line_length
    private let kanjiString = "スウェーデンのストックホルムで１０日、今年のノーベル賞を渡す式がありました。まず、ノーベル賞の団体が「アメリカやヨーロッパで科学を否定するような政治家に賛成する人が増えています。今、ノーベル賞がとても大事になっています」と話しました。今年の医学・生理学賞は日本の大隅良典さんです。大隅さんは、リサイクルする細胞の働き「オートファジー」を研究しました。式ではスウェーデンのグスタフ国王が大隅さんにメダルなどを渡しました。今年の文学賞はアメリカの歌手のボブ・ディランさんですが、式には来ませんでした。式ではディランさんの友達の歌手のパティ・スミスさんが、ディランさんが作った歌を歌いました。"

    /// The kana version of the document.
    // swiftlint:disable line_length
    private let kanaString = "スウェーデンのストックホルムでとおか、ことしのノーベルしょうをわたすしきがありました。まず、ノーベルしょうのだんたいが「アメリカやヨーロッパでかがくをひていするようなせいじかにさんせいするひとがふえています。いま、ノーベルしょうがとてもだいじになっています」とはなしました。ことしのいがく・せいりがくしょうはにっぽんのおおすみよしのりさんです。おおすみさんは、リサイクルするさいぼうのはたらき「オートファジー」をけんきゅうしました。しきではスウェーデンのグスタフこくおうがおおすみさんにメダルなどをわたしました。ことしのぶんがくしょうはアメリカのかしゅのボブ・ディランさんですが、しきにはきませんでした。しきではディランさんのともだちのかしゅのパティ・スミスさんが、ディランさんがつくったうたをうたいました。"

    /// The parser.
    private var parser: RubiParser!

    /// The document.
    private var doc: RubiDocument!

    /// Parse the example into the document.
    override func setUp() {
        super.setUp()

        guard let html = loadExample(name: "EasyNews1") else {
            XCTFail("unable to load EasyNews1 example")
            return
        }

        parser = RubiScannerParser()
        doc = parser.parse(html)
    }

    /// Tests the kanji string.
    func testKanjiString() {
        XCTAssert(doc.kanjiString == kanjiString)
    }

    /// Tests the kana string.
    func testKanaString() {
        XCTAssert(doc.kanaString == kanaString)
    }

}
