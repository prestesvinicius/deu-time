//
//  infoView.swift
//  deuTime
//
//  Created by Turma02-10 on 18/03/24.
//

import SwiftUI

struct infoView: View {
    var body: some View {
        
        ScrollView{
        VStack{
            Text("")
                .frame(height: 30)
            VStack{
                ZStack{
                    AsyncImage(url: URL(string: "https://superblog.supercdn.cloud/site_cuid_clilou76g4798113tmf1lw59vru/images/instagram-man-ideas-3-1687868963182-compressed.PNG")) { image in
                        image.resizable()
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.mainBlue, lineWidth: 8))
                    Circle()
                        .foregroundColor(.mainBlue)
                        .frame(width: 30, height: 30)
                        .overlay(Image(systemName: "pencil")
                            .foregroundColor(.white))
                        .offset(CGSize(width: 70, height: 60))
                }
                
                Text("Felipe Costa")
                    .font(.system(size: 30, weight: .bold, design: .none))
                    .padding(.horizontal)
                Text("(45) 9 9999-0000")
                    .font(.system(size: 15, weight: .bold, design: .none))
                    .padding(.horizontal)
                    .foregroundColor(.gray)
                
                
                HStack{
                    Text("Futebol")
                        .font(.headline)
                        .foregroundColor(.mainBlue)
                        .italic()
                        .bold()
                        .padding(.horizontal, 15)
                        .padding(.vertical,4)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.mainBlue, lineWidth: 2))
                    
                    Text("Volei")
                        .font(.headline)
                        .foregroundColor(.mainBlue)
                        .italic()
                        .bold()
                        .padding(.horizontal, 15)
                        .padding(.vertical,4)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.mainBlue, lineWidth: 2))
                }
                
            }
            
        }.frame(width: 360, height: 270)
        
        Text("")
                .frame(height: 20)
            HStack{
                Text("Proximos Eventos")
                    .font(.system(size: 26, weight: .bold, design: .none))
                    .padding(.horizontal)
                    .frame(height: 60)
                Spacer()
            }
            VStack{
                ZStack{
                    Rectangle()
                        .frame(width: 340, height: 80)
                        .zIndex(0)
                        .opacity(0.1)
                        .cornerRadius(7)
                    HStack{
                        AsyncImage(url: URL(string: "https://istoe.com.br/wp-content/uploads/2023/05/64520564_303.jpg")) { image in
                            image.resizable()
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        
                        Rectangle()
                            .frame(width: 180)
                            .opacity(0)
                            .overlay(VStack{Text("Futzin da Firma")
                                    .foregroundColor(.mainBlue)
                                    .font(.system(size: 20, weight: .bold, design: .none))
                                
                                Text("8 / 10 participantes")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .bold, design: .none))
                                
                                Text("Flamenguinho")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .bold, design: .none))
                            })
                        
                        Rectangle()
                            .frame(width: 70)
                            .opacity(0)
                            .overlay(VStack(spacing: -8){
                                Text("25")
                                    .font(.system(size: 36, weight: .bold, design: .none))
                                    .foregroundColor(.mainBlue)
                                Text("mar")
                                    .textCase(.uppercase)
                                    .font(.system(size: 20, weight: .bold, design: .none))
                                    .foregroundColor(.mainBlue)
                            }
                            )}
                    
                }
            }

            HStack{
                Text("Eventos Passados")
                    .font(.system(size: 26, weight: .bold, design: .none))
                    .padding(.horizontal)
                    .frame(height: 60)
                Spacer()
            }
            VStack{
                ZStack{
                    Rectangle()
                        .frame(width: 340, height: 80)
                        .zIndex(0)
                        .opacity(0.1)
                        .cornerRadius(7)
                    HStack{
                        AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeFG5vJgnPioxxmyYP0r5otMYMK6Syz2IreDMjAr3cQg&s")) { image in
                            image.resizable()
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        
                        Rectangle()
                            .frame(width: 180)
                            .opacity(0)
                            .overlay(VStack{Text("Pelada do Bairro")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 20, weight: .bold, design: .none))
                                                            
                                Text("Costa Cavalcantti")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .bold, design: .none))
                            })
                        
                        Rectangle()
                            .frame(width: 70)
                            .opacity(0)
                            .overlay(VStack(spacing: -8){
                                Text("08")
                                    .font(.system(size: 36, weight: .bold, design: .none))
                                    .foregroundColor(.gray)
                                Text("mar")
                                    .textCase(.uppercase)
                                    .font(.system(size: 20, weight: .bold, design: .none))
                                    .foregroundColor(.gray)
                            }
                            )}
                    
                }
            }.opacity(0.6)
            
            VStack{
                ZStack{
                    Rectangle()
                        .frame(width: 340, height: 80)
                        .zIndex(0)
                        .opacity(0.1)
                        .cornerRadius(7)
                    HStack{
                        AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKDZX-4I9qMsKTSr7SkA0pPoLGSwSaZPdHfhrSMI2LqA&s")) { image in
                            image.resizable()
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        
                        Rectangle()
                            .frame(width: 180)
                            .opacity(0)
                            .overlay(VStack{Text("Treino Joia")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 20, weight: .bold, design: .none))
                            
                                
                                Text("Flamenguinho")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .bold, design: .none))
                            })
                        
                        Rectangle()
                            .frame(width: 70)
                            .opacity(0)
                            .overlay(VStack(spacing: -8){
                                Text("17")
                                    .font(.system(size: 36, weight: .bold, design: .none))
                                    .foregroundColor(.gray)
                                Text("fev")
                                    .textCase(.uppercase)
                                    .font(.system(size: 20, weight: .bold, design: .none))
                                    .foregroundColor(.gray)
                            }
                            )}
                    
                }
            }.opacity(0.6)
            
            VStack{
                ZStack{
                    Rectangle()
                        .frame(width: 340, height: 80)
                        .zIndex(0)
                        .opacity(0.1)
                        .cornerRadius(7)
                    HStack{
                        AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsKL9obvYUh6dOkPz8zjuX6oBA1AavGiAp0BnuZgDqlg&s")) { image in
                            image.resizable()
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        
                        Rectangle()
                            .frame(width: 180)
                            .opacity(0)
                            .overlay(VStack{Text("Volei Familia")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 20, weight: .bold, design: .none))
                                
                                Text("Quadra Terra Nova")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .bold, design: .none))
                            })
                        
                        Rectangle()
                            .frame(width: 70)
                            .opacity(0)
                            .overlay(VStack(spacing: -8){
                                Text("10")
                                    .font(.system(size: 36, weight: .bold, design: .none))
                                    .foregroundColor(.gray)
                                Text("fev")
                                    .textCase(.uppercase)
                                    .font(.system(size: 20, weight: .bold, design: .none))
                                    .foregroundColor(.gray)
                            }
                            )}
                    
                }
            }.opacity(0.7)
        
        
        
        } // fim scroll
    }
            
        }

#Preview {
    infoView()
}
