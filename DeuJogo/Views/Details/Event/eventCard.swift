//
//  eventCard.swift
//  DeuJogo
//
//  Created by Turma02-20 on 15/03/24.
//

import SwiftUI

struct eventCard: View {
    var idEventoR : Int
    var idQuadraR : Int
    var idRegiaoR : Int
    var modalidadeR : M
    var nomeR : String
    var dataR : String
    var hora_inicioR : String
    //var hora_fimR : String
    var num_vagasR : Int
    var num_participantesR : Int
    var imagemR : String
    @State private var isActive = false
    @State private var scale = 1.0
    @State private var subscribe:String = "Participar do Evento"
    @State private var unsubscribe:String = "Cancelar Participação"
    @State private var subbed:String = "Participar do Evento"
    @State private var vm = ViewModel()
    @State private var subcolor : Color = .mainBlue
    @State private var unsubcolor : Color = .gray
    @State private var subbedcolor : Color = .mainBlue
    
    
    var body: some View {
        
        HStack{
            AsyncImage(url: URL(string: imagemR )) { image in
                image.resizable()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
            } placeholder: {
                ProgressView()
            }.frame(width: 170, height: 170)
                .cornerRadius(15)
        }
                    

        VStack{
            Text(nomeR)
                .font(.system(size: 30, weight: .bold, design: .none))
            
        }.frame(width: 280, height: 40)
            .offset(CGSize(width: 0, height: 0))
        
        HStack{
            Text(dataR + " - ")
            Text(vm.extractHora(from: hora_inicioR)!)
        }
        
        Divider()
        
        HStack{
            Text("Participantes")
                .font(.system(size: 25, weight: .semibold, design: .none))
                .padding()
            Spacer()
            
            
            Rectangle()
                .frame(width: 70, height: 30)
                .cornerRadius(7)
                .foregroundColor(.mainBlue)
                .overlay(Text("\(vm.usuarios.count) / \(num_vagasR)")
                    .font(.system(size: 19, weight: .bold, design: .none))
                    .foregroundColor(.white))
                .padding()
            
            
        }.frame(height: 30)
        
        NavigationStack{
            ScrollView{
                VStack(spacing: -25){
                    ForEach(vm.usuarios) { item in
                        NavigationLink(destination: profileCard(usuFake: item)) {
                            ZStack{
                                Rectangle()
                                    .frame(width: 340, height: 80)
                                    .zIndex(0)
                                    .opacity(0.1)
                                    .cornerRadius(7)
                                
                                HStack{
                                    
                                    AsyncImage(url: URL(string: item.avatar)) { image in
                                        image.resizable()
                                        
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 70, height: 70)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                    .offset(CGSize(width: 20, height: 0))
                                    
                                    Rectangle()
                                        .frame(width: 220)
                                        .opacity(0)
                                        .overlay(VStack(alignment:.leading){Text(item.nome)
                                                .foregroundColor(.mainBlue)
                                                .font(.system(size: 22, weight: .bold, design: .none))
                                            
                                            Text(item.telefone)
                                                .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .bold, design: .none))})
                                    
                                    Spacer()
                                }.frame(width: 340, height: 80)
                                    .foregroundColor(.black)
                                    .padding()
                                
                            }
                        }
                        .foregroundColor(.black)
                  
                        
                    }
                    
                    Button(action: {
                        self.isActive.toggle()
                        
                        if !isActive{
                            subbed = subscribe
                            subbedcolor = subcolor
                            //self.tempPlayers-=1
                            vm.usuarios.remove(at: 3)
                            
                            
                        }
                        
                        if isActive{
                            // self.tempPlayers+=1
                            vm.usuarios.append(userFake(id: 3, nome: "Felipe Costa", avatar: "https://superblog.supercdn.cloud/site_cuid_clilou76g4798113tmf1lw59vru/images/instagram-man-ideas-3-1687868963182-compressed.PNG", telefone: "(49)99990-8427", modalidades: "Basquete"))
                            subbed = unsubscribe
                            subbedcolor = unsubcolor
                            
                        }
                    },
                           label: {
                        Text(subbed)
                            .frame(width: 250, height: 50)
                            .font(.system(size: 20,weight: .semibold,design: .default))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(subbedcolor
                                .cornerRadius(4))
                        
                        
                    }).padding(.vertical,20)
                    
                    
                }
            }
        }
    }
}




//#Preview {
//    eventCard(
//        idEventoR : 1,
//        idQuadraR : 1,
//        idRegiaoR : 1,
//        modalidadeR : .Basquete,
//        nomeR : "Teste",
//        dataR : "20 March",
//        hora_inicioR : "00:00",
//     //   hora_fimR: "00:00",
//        num_vagasR : 10,
//        num_participantesR : 5,
//        imagemR : "url"
//    )
//}
