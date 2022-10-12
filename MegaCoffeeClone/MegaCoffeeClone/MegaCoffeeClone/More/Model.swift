//
//  Model.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/09/29.
//

import Foundation


class Model {
    var content: String
    
    init(content: String) {
        self.content = content
    }

    // 멤버쉽
    static var dummyData1 = [
        Model(content: "스탬프"),
        Model(content: "쿠폰")
    ]
    
    // 주문
    static var dummyData2 = [
        Model(content: "메가 오더"),
        Model(content: "주문 내역"),
        Model(content: "선물하기"),
        Model(content: "메가선불카드"),
        Model(content: "간편카드 관리"),
        Model(content: "상품권 대량 구매 신청")
    ]
    
    // 새소식
    static var dummyData3 = [
        Model(content: "이벤트"),
        Model(content: "공지사항")
    ]
    
    // 약관 및 정책
    static var dummyData4 = [
        Model(content: "이용약관")
    ]
    
    
    
}
