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
    private let kanjiString = "アメリカ軍のオスプレイ５機が５日、東京にあるアメリカ軍の横田基地に来ました。オスプレイはヘリコプターのように上下に飛ぶことができる飛行機です。オスプレイはこれから横田基地から出発して、いろいろな場所で訓練をします。アメリカ軍は今年の夏ごろから、正式にオスプレイを横田基地に置く予定です。日本にあるアメリカ軍の基地にオスプレイを置くのは、沖縄県以外で初めてです。横田基地の周りでは、市民のグループが大きな声で「オスプレイ来るな」と言って反対していました。横田基地の近くに住んでいる女性は「オスプレイは落ちるとよく聞くので心配です」と話していました。東京都の小池知事は「基地の周りの市や町と一緒にオスプレイを安全に使うように国に言います」と話しました。"

    /// The kana version of the document.
    // swiftlint:disable line_length
    private let kanaString = "アメリカぐんのオスプレイ５きがいつか、とうきょうにあるアメリカぐんのよこたきちにきました。オスプレイはヘリコプターのようにじょうげにとぶことができるひこうきです。オスプレイはこれからよこたきちからしゅっぱつして、いろいろなばしょでくんれんをします。アメリカぐんはことしのなつごろから、せいしきにオスプレイをよこたきちにおくよていです。にっぽんにあるアメリカぐんのきちにオスプレイをおくのは、おきなわけんいがいではじめてです。よこたきちのまわりでは、しみんのグループがおおきなこえで「オスプレイくるな」といってはんたいしていました。よこたきちのちかくにすんでいるじょせいは「オスプレイはおちるとよくきくのでしんぱいです」とはなしていました。とうきょうとのこいけちじは「きちのまわりのしやまちといっしょにオスプレイをあんぜんにつかうようにくににいいます」とはなしました。"

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
