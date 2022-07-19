//
//  Chronometre.swift
//  Chrono
//
//  Created by Andre Mulaja on 2022-04-30.
//

import SwiftUI

struct Chronometre: View {
    @State var demarrer = false
    @State var stop = true;
    
    @State var seconde = 0
    @State var countDowntimer = 3
    @State var timerRunning = true
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var sliderH:Double = 0
    @State private var sliderM:Double = 0
    @State private var sliderS:Double = 0
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Spacer()
                Spacer()
                if demarrer {
                    Text(
                        (sliderH<10 ? "0\(Int(sliderH)):" : "\(Int(sliderH)):") +
                        (sliderM<10 ? "0\(Int(sliderM)):" : "\(Int(sliderM)):") +
                        (sliderS<10 ? "0\(Int(sliderS))" : "\(Int(sliderS))")
                    )
                        .bold()
                        .padding()
                        .foregroundColor(.green)
                        .font(.system(size: 60))
                }else{
                    Text(
                        (sliderH<10 ? "0\(Int(sliderH)):" : "\(Int(sliderH)):") +
                        (sliderM<10 ? "0\(Int(sliderM)):" : "\(Int(sliderM)):") +
                        (sliderS<10 ? "0\(Int(sliderS))" : "\(Int(sliderS))")
                    )
                        .bold()
                        .padding()
                        .foregroundColor(.yellow)
                        .font(.system(size: 60))
                }
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        timerRunning = false
                        demarrer = false
                        sliderH = 0
                        sliderM = 0
                        sliderS = 0
                        seconde = 0
                        
                    }){
                        
                        Text("Effacer")
                            .bold()
                            .padding()
                            .font(.system(size: 20))
                            .background(.gray)
                            .foregroundStyle(.white)
                            .cornerRadius(8)
                    }
                    Spacer()
                    
                    if demarrer{
                        Button(action: {
                            timerRunning = false
                            demarrer = false
                            
                        }){
                            Text("Arreter")
                                .bold()
                                .padding()
                                .frame(width: 120)
                                .font(.system(size: 20))
                                .background(.yellow)
                                .foregroundStyle(.white)
                                .cornerRadius(8)
                        }
                        .onReceive(timer){_ in
                            
                            if seconde < 360000 && timerRunning{
                                seconde+=1
                                sliderH = Double(seconde) / 3600
                                let reste = seconde % 3600
                                sliderM = Double(reste / 60)
                                sliderS = Double(reste % 60)

                            }else{
                                timerRunning = false
                            }
                            
                            
                        }
                    }else{
                        Button(action: {
                            timerRunning = true
                            demarrer = true
                           
                        }){
                            Text("Demarrer")
                                .bold()
                                .padding()
                                .frame(width: 120)
                                .font(.system(size: 20))
                                .background(.green)
                                .foregroundStyle(.white)
                                .cornerRadius(8)
                        }
         
                    }
                    

                    Spacer()
                }
                Spacer()
            }
        }
    }
        
}

struct Chronometre_Previews: PreviewProvider {
    static var previews: some View {
        Chronometre()
    }
}
