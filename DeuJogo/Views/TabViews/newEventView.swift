//
//  newEventView.swift
//  deuTime
//
//  Created by Turma02-10 on 18/03/24.
//

import SwiftUI

struct newEventView: View {
    @State private var nome = ""
    @State private var hora_inicio = ""
    @State private var modalidade : M = M.Outros
    @State private var quadra : Quadra?
    @State private var dataI = Date()
    @State private var evento : Evento?
    @State private var privateEvent = false
    @State private var idregiao : Int = 0
    @State private var vagas: Int = 1
    
    @State var idQuadra = -1
    @State var idRegiao = -1
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        ScrollView{
            VStack{
                HStack{
                    Text("Novo Evento")
                        .font(.system(size: 42, weight: .bold, design: .none))
                        .padding()
                    Spacer()
                }
            }.frame(width: 360,height: 100)
                .padding(.leading, 30.0)
            VStack{
                HStack{
                    Circle()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.mainBlue)
                        .overlay(Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80))
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    Text("Imagem \n      do \n Evento")
                        .font(.system(size: 25, weight: .bold, design: .none))
                        .padding()
                    
                    
                }
            }
            
            VStack{ // bg
            VStack{
                VStack(alignment: .center){
                    HStack{
                        Text("Nome")
                            .font(.system(size: 25, weight: .bold, design: .none))
                            .bold()
                            .offset(CGSize(width: 10.0, height: 0))
                        Spacer()
                    }
                    
                    // NOME DO EVENTO
                    TextField("     Insira o nome do evento", text: $nome)
                        .frame(width: 340, height: 50)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                }.frame(width: 360, height: 100)
                
                
                // PICKER QUADRA
                // idQuadra
                // idRegiao <- Quadra
                HStack(alignment: .center){
                    //List {
                    Text("Espaço")
                        .font(.system(size: 25, weight: .bold, design: .none))
                        .padding()
                    Spacer()
                    Picker("Quadra", selection: $idQuadra) {
                        Text("Selecione")
                        ForEach(viewModel.quadras, id: \.idQuadra){ q in
                            Text("\(q.nome)")
                        }
                        
                    }.onChange(of: idQuadra){
                        
                        idRegiao = viewModel.get_idRegiao_by_idQuadra(idQuadra: idQuadra)
                        quadra = viewModel.get_quadra_id(idQuadra: idQuadra).first
                    }
                    .pickerStyle(.menu)
                    // }
                }.frame(width: 360, height: 50)
                
                
                // PICKER MODALIDADE
                // modalidade
                // arrumar
                HStack(alignment: .center){
                    //                    List {
                    Text("Modalidade")
                        .font(.system(size: 25, weight: .bold, design: .none))
                        .padding()
                    
                    Spacer()
                    Picker("Modalidade", selection: $modalidade) {
                        //Text("Selecione")
                        ForEach(M.allCases) { m in
                            Text(m.rawValue.capitalized)
                        }
                    }
                    //                         .pickerStyle(.wheel)
                    // .background(RoundedRectangle(cornerRadius:0)
                    // .fill(.orange))
                    // .padding()
                    // .accentColor(.red)
                    .pickerStyle(.menu)
                    //                    }
                    
                    
                }.frame(width: 360, height: 50)
            }
            
            HStack{
                Text("Evento privado")
                    .font(.system(size: 25, weight: .bold, design: .none))
                    .padding()
                    .offset(CGSize(width: 15, height: 0))
                
                
                Toggle("", isOn: $privateEvent).frame(width: 150)
                    .toggleStyle(SwitchToggleStyle(tint:.darkBlue))
                Spacer()
            }.frame(height: 50)
            
            // DATA E HORA
            // data: data.formatted(date: .abbreviated, time: .omitted) -> 21 Mar 2024
            // hora: data.formatted(date: .omitted, time: .standard) -> 17:06:38
            VStack{
                VStack(spacing: 20){
                    Section(header:Text("Data e Hora")
                        .font(.system(size: 25, weight: .bold, design: .none))
                        .bold()){
                            DatePicker("", selection: $dataI)
                                .frame(width: 200)
                        }
                }.frame(width: 360, height: 100)
            }
            
            // NÚMERO DE VAGAS
            VStack {
                HStack {
                    Text("Número de Vagas")
                        .font(.system(size: 25, weight: .bold, design: .none))
                        .bold()
                        .frame(width: 360)
                    Spacer()
                }
                Picker("Número de vagas", selection: $vagas) {
                    ForEach(1...50, id: \.self) { number in
                        Text("\(number)")
                    }
                }.pickerStyle(.wheel)
            }
            .frame(width: 360, height: 100)
            }
                
            
            
            Spacer()
            
            Button {
                evento = Evento(_id: nil,
                                _rev: nil,
                                idEvento: 8,
                                idQuadra: idQuadra,
                                idRegiao: idRegiao,
                                modalidade: modalidade,
                                nome: nome,
                                lat: quadra!.lat,
                                lon: quadra!.lon,
                                data: dataI.formatted(date: .abbreviated, time: .omitted),
                                hora_inicio: dataI.formatted(date: .omitted, time: .standard),
                                num_vagas: vagas,
                                num_participantes: 0,
                                imagem: quadra!.imagem
                )
                
                print(evento!.imagem)
                viewModel.post_evento(evento!)
                
            } label: {
                Text("Criar evento")
                    .textCase(.uppercase)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.darkBlue
                        .cornerRadius(7)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/))
                
            }.frame(height: 80)
            
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
    newEventView()
}
