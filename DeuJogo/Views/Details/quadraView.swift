//
//  quadraView.swift
//  deuTime
//
//  Created by Turma02-10 on 19/03/24.
//

import SwiftUI
import MapKit

struct quadraView: View {
    @StateObject var viewModel = ViewModel()
    @State private var showSheet = true
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: 0)))

    var quadra : Quadra
    var dia : String?
    var mes : String?
    
    var body: some View {

        
        VStack{
            Map(position: $position){
                     Annotation(quadra.nome, coordinate: CLLocationCoordinate2D(latitude: quadra.lat, longitude: quadra.lon)){
                         Image("pin")
                             .resizable()
                             .frame(width: 35, height: 45)
                             .foregroundColor(.black)}
                 }.frame(width: 380, height: 250)
            
            Rectangle()
                .frame(width: 380)
                .opacity(0)

            
        }.sheet(isPresented: $showSheet, content: {
            
            VStack{
                NavigationStack{
                    ZStack{
                        
                        AsyncImage(url: URL(string: quadra.imagem )) { image in
                            image.resizable()
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                        } placeholder: {
                            ProgressView()
                        }.frame(width: 170, height: 170)
                            .cornerRadius(15)
                            .padding(.top,30)
                    }
                    
                    
                    Text(quadra.nome)
                    .font(.system(size: 30, weight: .bold, design: .none))
                
                    Text(quadra.endereco)
                    .foregroundColor(.gray)
                
                Button() {} label: {
                    Text("Agende um horário")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.mainBlue
                            .cornerRadius(4))
                    
                }.frame(height: 50)
                        .padding(.top,-10)
                
                    HStack{
                        ForEach(quadra.modalidade, id: \.self){ item in
                            Text(viewModel.modalidadeToString(m: item))
                                .font(.headline)
                                .foregroundColor(.mainBlue)
                                .italic()
                                .bold()
                                .padding(.horizontal, 15)
                                .padding(.vertical,4)
                                .background(
                                  RoundedRectangle(cornerRadius: 10)
                                    .stroke(.mainBlue, lineWidth: 2)
                                )
                        }
                    }

                    
                Divider()
                        .padding()
                    HStack{
                        Text("Proximos Eventos")
                            .font(.system(size: 26, weight: .bold, design: .none))
                            .padding(.horizontal)
                        Spacer()
                    }
                ScrollView{
                    VStack{
                        
                        ForEach(viewModel.filtrar_eventos_quadra(idQuadra: quadra.idQuadra), id:\._id){ item in
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
                                                            .font(.system(size: 36, weight: .bold, design: .none))
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
            
        }).onAppear(perform: {
            position = MapCameraPosition.region(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: quadra.lat, longitude: quadra.lon),
                span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)))
            
            viewModel.fetch_eventos()
        })
        
        
        
    }
}

//#Preview {
//    quadraView(quadra: Quadra(
//        idR:1,
//        nomeR:"Costa",
//        latR: -25.5183663,
//        lonR: -54.5542561,
//        modaR: ["Basquete","Futebol"],
//        endR: "Sasdelli, 123",
//        teleR: "link",
//        imgR: "https://fastly.4sqi.net/img/general/600x600/39903400_ymSPo_QbSr4_GdwMQPMOjrLiWgOn3XWelN8Kv8WMKvs.jpg"
//    )
//               )
//}
