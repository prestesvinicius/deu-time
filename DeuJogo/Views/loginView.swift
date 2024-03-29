//
//  loginView.swift
//  deuTime
//
//  Created by Turma02-10 on 18/03/24.
//

import SwiftUI

struct loginView: View {
    var body: some View {
        NavigationStack{
            
            ZStack{
                Rectangle()
                    .frame(width: 800, height: 1200)
                    .foregroundColor(.mainBlue)
                    .zIndex(0)
                
                VStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 270, height: 110)
                    
                    Rectangle()
                        .frame(width: 250, height: 50)
                        .opacity(0)
                    
                    VStack{
                        NavigationLink(destination: MyTabView()){
                            Text("Login")
                                .foregroundColor(.black)
                                .frame(width: 270, height: 50)
                                .background(Color(.white))
                                .font(.title2)
                                .border(Color.white)
                                .cornerRadius(7.0)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                        NavigationLink{
                            MyTabView()
                        }label: {
                            Text("Cadastrar")
                                .frame(width: 270, height: 50)
                                .background(Color(.darkBlue))
                                .foregroundColor(.white)
                                .font(.title2)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                .cornerRadius(7.0)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                        
                    }
                }
            }
            
        }
    }
}


#Preview {
    loginView()
}

