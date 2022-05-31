//
//  Calculator.swift
//  Tips
//
//  Created by MA SHAO I on 2022/3/3.
//

import Foundation

struct Tip {
    var total: Float = 0.0
    var tip: Float = 0.10
    var split: Int = 1
    var tipTotal: Float = 0.0
    
    mutating func calculateTheTip(total: Float, split: Int){
        self.split = split
        self.total = total
        self.tipTotal = (self.total + (self.total*self.tip))/Float(self.split)
    }
    func getDescription()->String{
        if(split == 1 ){
            return "Total amount to pay after \(Int(tip*100))% tip."
        }
        return "Split between \(split) people with \(Int(tip*100))% tip"
    }
}
