//
//  FuncModalidades.swift
//  DeuJogo
//
//  Created by Turma02-11 on 19/03/24.
//

import SwiftUI


struct FuncModalidades: View {
    @StateObject var viewModel = ViewModel()
    var body: some View{
        NavigationStack{
            ScrollView(.horizontal){
                HStack{
                    ForEach(viewModel.quadras, id:\._id){ item in
                        NavigationLink(destination: FuncQuadra(
                            quadra : item
                        ), label: {
                            VStack{
                                AsyncImage(url: URL(string: item.imagem)) { image in
                                    image.resizable()
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                Text(item.nome)
                                    .font(.caption)
                                    .foregroundColor(.darkBlue)
                            }.frame(width: 200, height: 200)
                                .padding(.horizontal,-20)
                        })}
                }.padding(.horizontal)
            }
            
            
            
        }.onAppear(){
            viewModel.fetch_eventos()
            viewModel.fetch_quadras()
            viewModel.fetch_regioes()
            viewModel.fetch_modalidades()
        }
    }
}


#Preview {
    FuncModalidades()
}
