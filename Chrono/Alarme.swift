//
//  Alarme.swift
//  Chrono
//
//  Created by Andre Mulaja on 2022-04-30.
//

import SwiftUI

struct Alarme: View {
    @State var isOn = false
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading){
                HStack{
                    Button("Reinitialiser"){
                       
                    }
                    .foregroundStyle(.yellow)
                    Spacer()
                   
                    Button("Ajouter"){
                    }
                    .foregroundStyle(.green)
                    
                }
                .padding(.horizontal, 18.0)
                
                
                ScrollView{
                    
                    VStack {
                        HStack{
                            VStack{
                                Text("00:00")
                                    .font(.system(size: 40))
                                    .foregroundColor(.yellow)
                                Text("commentaire")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            
                            Toggle(isOn: $isOn) {
                                
                            }
                        }
                        Divider()
                    }
                    .padding([.top, .leading, .trailing])
                    .background(Color(red: 0.1, green: 0.1, blue: 0.1))
                    .cornerRadius(10)
                    .padding(.bottom)
                    

                   
                }
            }
        }
    }
}

struct Alarme_Previews: PreviewProvider {
    static var previews: some View {
        Alarme()
    }
}
