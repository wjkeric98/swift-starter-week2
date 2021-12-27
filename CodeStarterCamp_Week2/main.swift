//
//  main.swift
//  CodeStarterCamp_Week2
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var winningNumbers: Set<Int> = []
var randomNumber: Int?
var myLottoNumbers: [Int] = []
var matchedNumbers: String = ""
var result: String = ""

func createRandomNumber() {
    randomNumber = Int.random(in: 1...45)
}

func createWinningNumbers() -> Set<Int> {
    
    while winningNumbers.count < 6 {
        pickRandomNumber()
        if let lottoNumber = randomNumber {
            winningNumbers.insert(lottoNumber)
        } else {
            print("wrong input")
            break
        }
    }
    print("당첨 번호: \(winningNumbers)")
    return winningNumbers
}

func compareLottoNumbers(_ winningNumbers: Set<Int>, _ myNumbers: [Int]) -> String {
    
    if myNumbers.count < 1 {
        result = "로또 번호를 입력하지 않았습니다."
        return result
    } else {
    
        for i in 0...myNumbers.count-1 {
            if (winningNumbers.contains(myNumbers[i])) {
                matchedNumbers += "\(myNumbers[i]), "
            } else {
                continue
            }
        }
        let lastComma = matchedNumbers.lastIndex(of: ",") ?? matchedNumbers.endIndex
        let removeCommaNumbers = matchedNumbers[..<lastComma]
        if matchedNumbers.count > 0 {
            result = "축하합니다! 겹치는 번호는 \(removeCommaNumbers) 입니다!"
        } else {
            result = "아쉽지만 겹치는 번호가 없습니다."
        }
        
        return result
    }
}

func tryLotto(_ myLottoNumbers: [Int]) {
    print(compareLottoNumbers(pickLottoNumbers(), myNumbers))
}

tryLotto([1, 2, 3, 4, 5, 6])








