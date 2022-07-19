//
//  Miniteur.swift
//  Chrono
//
//  Created by Andre Mulaja on 2022-04-30.
//

import SwiftUI

struct Miniteur: View {
    @State private var setTimer:Bool = false
    @State private var terminate:Bool = false
    @State private var demarrer:Bool = false
    
    @State private var sliderH:Double = 0
    @State private var sliderM:Double = 0
    @State private var sliderS:Double = 0
    
    @State private var hh:Double = 0
    @State private var mm:Double = 0
    @State private var ss:Double = 0
    
    @State private var seconde = 0
    private var temps:Temps = Temps()
    
    @State var countDowntimer = 3
    @State var timerRunning = true
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {

        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                
                HStack{
                    Button("reinitialiser"){
                        terminate = false
                        sliderH = 0
                        sliderM = 0
                        sliderS = 0
                        demarrer = false
                        seconde = 0
                        hh = 0
                        mm = 0
                        ss = 0
                    }
                    .foregroundStyle(.yellow)
                    Spacer()
                    Button("Temps"){
                        setTimer = true
                        demarrer = false
                    }
                        .foregroundStyle(.green)
                        .sheet(isPresented: $setTimer){
                           
                            
                            ZStack{
                                Color.black.ignoresSafeArea().opacity(0.9)
                                    .background(BackgroundClearView())
                                VStack{
                                    Spacer()
                                    Text(
                                        (hh<10 ? "0\(Int(hh)):" : "\(Int(hh)):") +
                                        (mm<10 ? "0\(Int(mm)):" : "\(Int(mm)):") +
                                        (ss<10 ? "0\(Int(ss))" : "\(Int(ss))")
                                    )
                                    .bold()
                                    .padding()
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 40))
         
                                    
                                    HStack{
                                        Text("HH")
                                            .bold()
                                            .padding()
                                            .foregroundColor(.gray)
                                            .font(.system(size: 35))
                                        Slider(value: $hh, in: 0...23)
                                        Text("0-23")
                                            .bold()
                                            .padding()
                                            .foregroundColor(.gray)
                                            .font(.system(size: 35))
                            
                                    }
                                    .padding()
                                    
                                    HStack{
                                        Text("MM")
                                            .bold()
                                            .padding()
                                            .foregroundColor(.gray)
                                            .font(.system(size: 35))
                                        Slider(value: $mm, in: 0...59)
                                        Text("0-59")
                                            .bold()
                                            .padding()
                                            .foregroundColor(.gray)
                                            .font(.system(size: 35))
                            
                                    }
                                    .padding()
                                    
                                    HStack{
                                        Text("SS ")
                                            .bold()
                                            .padding()
                                            .foregroundColor(.gray)
                                            .font(.system(size: 35))
                                        Slider(value: $ss, in: 0...59)
                                        Text("0-59")
                                            .bold()
                                            .padding()
                                            .foregroundColor(.gray)
                                            .font(.system(size: 35))
                            
                                    }
                                    .padding()
                                    
                                    Spacer()
                                    Button(action: {
                                        sliderH = hh
                                        sliderM = mm
                                        sliderS = ss
                                        setTimer = false
                                        terminate = true;
                                        
                                        
                                    }){
                                        Text("Terminer")
                                            .bold()
                                            .padding()
                                            .font(.system(size: 20))
                                            .background(.green)
                                            .foregroundStyle(.white)
                                            .cornerRadius(8)
                                    }
                                    Spacer()
                                    

                                }
                                                            }
                            
                            
                        }
                    
                }
                Spacer()
                Spacer()
                Text("temps en sec \(seconde)")
                    .padding()
                    .foregroundColor(.gray)
                ZStack{
                  
                    Circle()
                        .trim(from:0, to:10)
                        .stroke(lineWidth: 14)
                        .frame(width: 300, height: 300, alignment: .center)
                        .foregroundStyle(.linearGradient(colors: [.green, .gray, .yellow], startPoint: .leading, endPoint: .trailing))
                        .rotationEffect(.degrees(demarrer ? 300 : 0))
                        
                        
                    
                    
                    if terminate {
                        Text(
                            (sliderH<10 ? "0\(Int(sliderH)):" : "\(Int(sliderH)):") +
                            (sliderM<10 ? "0\(Int(sliderM)):" : "\(Int(sliderM)):") +
                            (sliderS<10 ? "0\(Int(sliderS))" : "\(Int(sliderS))")
                        )
                        .bold()
                        .padding()
                        .foregroundColor(.green)
                        .font(.system(size: 40))
                    }else{
                        Text("HH:MM:SS")
                            .bold()
                            .padding()
                            .foregroundColor(.green)
                            .font(.system(size: 40))
                    }
                }
                
                Spacer()
                if demarrer{
                    HStack{
              
                        Button(action: {
                        
                            demarrer = false
                            timerRunning = false
                        }){
                            Text("Pause")
                                .bold()
                                .padding()
                                .font(.system(size: 20))
                                .background(.gray)
                                .foregroundStyle(.white)
                                .cornerRadius(8)
                                .onReceive(timer){_ in
                                    if seconde > 0 && timerRunning{
                                        seconde-=1
                                        sliderH = Double(seconde) / 3600
                                        let reste = seconde % 3600
                                        sliderM = Double(reste / 60)
                                        sliderS = Double(reste % 60)

                                    }else{
                                        timerRunning = false
                                        demarrer = false
                                    }
                                }
                            
                        }
                       
                    }
                }
                else {
                    Button(action: {
                        
                        if terminate{
                            temps.setTemps(heure: Int(sliderH), minute: Int(sliderM), seconde: Int(sliderS))
                            seconde = temps.Seconde()
                            demarrer = true
                            timerRunning = true
                        }


                        
                    }){
                        Text("Demarrer")
                            .bold()
                            .padding()
                            .font(.system(size: 20))
                            .background(.green)
                            .foregroundStyle(.white)
                            .cornerRadius(8)
                    }
                }
                
                Spacer()
                
                
            }
        }
        .padding()
        .background(.black)
        
        
    }
    
    
}

struct Miniteur_Previews: PreviewProvider {
    static var previews: some View {
        Miniteur()
    }
}

//https://stackoverflow.com/questions/63745084/how-can-i-make-a-background-color-with-opacity-on-a-sheet-view

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
