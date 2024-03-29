//
//  modalidadeView.swift
//  DeuJogo
//
//  Created by Turma02-20 on 15/03/24.
//

import SwiftUI

struct modalidadeView: View {
    @StateObject var viewModel = ViewModel()
    @State private var showSheet = true
    
    var modalidade : Modalidade
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: modalidade.capa)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }.padding(.top,-80)
                .scaledToFill()//fazer map annotation
            
//            Rectangle()
//                .frame(width: 380, height: 800)
//                .opacity(0)

            
        }.sheet(isPresented: $showSheet, content: {
            
            VStack{
                NavigationStack{
                    ZStack{
                        
                        AsyncImage(url: URL(string: modalidade.imagem)) { image in
                            image.resizable()
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                        } placeholder: {
                            ProgressView()
                        }.frame(width: 170, height: 170)
                            .cornerRadius(15)
                            .padding(.top,30)
                    }
                    
                    
                    Text(modalidade.nome)
                    .font(.system(size: 30, weight: .bold, design: .none))
                
                
                Divider()
                    HStack{
                        Text("Proximos Eventos")
                            .font(.system(size: 26, weight: .bold, design: .none))
                            .padding(.horizontal)
                        Spacer()
                    }
                ScrollView{
                    VStack{
                        
                        ForEach(viewModel.filtrar_eventos_modalidade(modalidade: modalidade.nome), id:\._id){ item in
                            NavigationLink(destination: eventCard(
                                idEventoR : item.idEvento,
                                idQuadraR : item.idQuadra,
                                idRegiaoR : item.idRegiao,
                                modalidadeR : item.modalidade,
                                nomeR : item.nome,
                                dataR : item.data,
                                hora_inicioR : item.hora_inicio,
                                //hora_fimR: item.hora_fim,
                                num_vagasR : item.num_vagas,
                                num_participantesR :item.num_participantes,
                                imagemR : item.imagem
                            ), label: {
                                HStack{ // Bloco de informacoes clicavel
                                    ZStack{
                                        Rectangle()
                                            .frame(width: 340, height: 80)
                                            .zIndex(0)
                                            .opacity(0.1)
                                            .cornerRadius(7)
                                        
                                        HStack{
                                            AsyncImage(url: URL(string: item.imagem)) { image in
                                                image.resizable()
                                                
                                            } placeholder: {
                                                ProgressView()
                                            }
                                                .frame(width: 60, height: 60)
                                                .clipShape(Circle())
                                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                            
                                            Rectangle()
                                                .frame(width: 180)
                                                .opacity(0)
                                                .overlay(VStack{Text(item.nome)
                                                        .foregroundColor(.mainBlue)
                                                        .font(.system(size: 20, weight: .bold, design: .none))
                                                    
                                                    Text("\(item.num_participantes)/\(item.num_vagas) participantes")
                                                        .foregroundColor(.gray)
                                                    .font(.system(size: 15, weight: .bold, design: .none))})
                                            
                                            Rectangle()
                                                .frame(width: 70)
                                                .opacity(0)
                                                .overlay(VStack(spacing: -8){
                                                    if let (day, month) = viewModel.extractDayAndMonth(from: item.data){
                                                        Text("\(day)")
                                                            .font(.system(size: 40, weight: .bold, design: .none))
                                                            .foregroundColor(.mainBlue)
                                                        Text("\(month)")
                                                            .textCase(.uppercase)
                                                            .font(.system(size: 20, weight: .bold, design: .none))
                                                            .foregroundColor(.mainBlue)
                                                } else {
                                                    Text("Formato de data inválido.")
                                                }
                                                }
                                                )
                                        }
                                        
                                    }
                                }.frame(width: 340, height: 80)
                                    .foregroundColor(.black)
                            })}
                        
                    }
 }
                
                
                
                    Spacer()}
            }
            .presentationDetents([.height(400), .medium, .large])
                .presentationBackgroundInteraction(.enabled(upThrough: .large))
                .interactiveDismissDisabled()
                .cornerRadius(5)
            
        }).onAppear(){
            viewModel.fetch_modalidades()
            viewModel.fetch_eventos()
        }
        
        
        
    }

}

#Preview {
    modalidadeView(modalidade: Modalidade(_id: "abc", idModalidade: 1, nome: "Futebol", imagem: "url", capa: "https://i.pinimg.com/236x/d7/06/8c/d7068c293843aa740ea16e353b083d9a.jpg"))
}
