//
//  Temps.swift
//  Chrono
//
//  Created by Andre Mulaja on 2022-04-29.
//

import Foundation

class Temps{
    private var heure:Int
    private var minute:Int
    private var seconde:Int
    
    init(){
        self.heure = 0
        self.minute = 0
        self.seconde = 0
    }
    public func setTemps(heure:Int, minute:Int, seconde:Int){
        self.heure = heure
        self.minute = minute
        self.seconde = seconde
    }
    public func Seconde()->Int{
        return (((heure * 60) + minute) * 60) + seconde
        
    }
}
