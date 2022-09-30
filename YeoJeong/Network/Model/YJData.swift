//
//  YJData.swift
//  YeoJeong
//
//  Created by Yu ahyeon on 2022/09/30.
//

import Foundation

struct YJData: Codable{
    var country: String
    var image: String
    var date: String
    var title: String
    var friend: [String?]
}

var tempYJData: [YJData] = [
    YJData(country: "미국", image: "testImage", date: "22.08.07 - 08.25", title: "나노챌린지 여행",
           friend: ["브라운", "다온", "노엘", "키"]),
    YJData(country: "영국", image: "testImage", date: "22.08.10 - 08.15", title: "영국 여행", friend: ["브라운", "다온"]),
    YJData(country: "프랑스", image: "testImage", date: "22.08.13 - 08.16", title: "프랑스 여행", friend: []),
    YJData(country: "이탈리아", image: "testImage", date: "22.08.18 - 08.20", title: "맛의 도시 이탈리아 여행", friend: [])
]
