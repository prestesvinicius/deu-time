//
//  homeView.swift
//  deuTime
//
//  Created by Turma02-10 on 18/03/24.
//

import SwiftUI

struct homeView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View{
        
        NavigationStack{
            
//            HStack{
//                Text("Todos os eventos")
//                    .font(.system(size: 32, weight: .bold, design: .none))
//                    .foregroundColor(.mainBlue)
//                    .padding(.horizontal,20)
//                Spacer()
//            }
            
            HStack{
                Text("Modalidades")
                    .font(.system(size: 26, weight: .bold, design: .none))
                    .padding(.horizontal,20)
                    .padding(.top,10)
                Spacer()
            }.padding(.top)
            
            
            ScrollView(.horizontal){
                
                HStack{
                    ForEach(viewModel.modalidades, id:\._id){ item in
                        NavigationLink(destination: modalidadeView(
                            modalidade: item
                        ), label: {
                            VStack{
                                AsyncImage(url: URL(string: item.imagem)) { image in
                                    image.resizable()
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                .cornerRadius(15)
                                Text(item.nome)
                                    .bold()
                                    .font(.caption)
                                    .foregroundColor(.darkBlue)
                            }.frame(width: 70, height: 70)
                                .padding(.horizontal,-5)
                        })}
                    
                }.padding(.horizontal)
            }.scrollIndicators(.hidden)
            
            
            HStack{
                Text("Espaços")
                    .font(.system(size: 26, weight: .bold, design: .none))
                    .padding(.horizontal,20)
                    .padding(.top,10)
                Spacer()
            }
            ScrollView(.horizontal){
                
                HStack{
                    ForEach(viewModel.quadras, id:\._id){ item in
                        NavigationLink(destination: quadraView(
                            quadra: item
                        ), label: {
                            VStack{
                                AsyncImage(url: URL(string: item.imagem)) { image in
                                    image.resizable()
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 136, height: 136)
                                .overlay( /// apply a rounded border
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.mainBlue, lineWidth: 4)
                                )
                                Text(item.nome)
                                    .bold()
                                    .font(.caption)
                                    .foregroundColor(.darkBlue)
                            }.frame(width: 200, height: 200)
                                .padding(.horizontal,-20)
                        })}
                    
                }.padding(.horizontal)
                    
            }.scrollIndicators(.hidden)
            .padding(.top,-20)
            
            
            
            HStack{
                Text("Regiões")
                    .font(.system(size: 26, weight: .bold, design: .none))
                    .padding(.horizontal,20)
                    .padding(.top,-10)
                
                Spacer()
            }
            ScrollView(.horizontal){
                
                HStack{
                    ForEach(viewModel.regioes, id:\._id){ item in
                        NavigationLink(destination: regiaoView(
                            regiao: item
                        ), label: {
                            VStack{
                                AsyncImage(url: URL(string: item.foto)) { image in
                                    image.resizable()
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 136, height: 136)
                                .overlay( /// apply a rounded border
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.mainBlue, lineWidth: 4)
                                )
                                Text(item.nome)
                                    .bold()
                                    .font(.caption)
                                    .foregroundColor(.darkBlue)
                            }.frame(width: 200, height: 200)
                                .padding(.horizontal,-20)
                        })}
                }.padding(.horizontal)
            }.scrollIndicators(.hidden)
            .padding(.top,-20)
            
            
            
            
            
        }
        .onAppear(){
            viewModel.fetch_eventos()
            viewModel.fetch_quadras()
            viewModel.fetch_regioes()
            viewModel.fetch_modalidades()
            
            
        }
    }
}



#Preview {
    homeView()
}
