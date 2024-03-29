//
//  FuncQuadra.swift
//  DeuJogo
//
//  Created by Turma02-11 on 19/03/24.
//

import SwiftUI

struct FuncQuadra: View {
    var quadra : Quadra

    @StateObject var vm = ViewModel()
    
    var body: some View {
        Text(quadra.nome)
        HStack{
            ForEach(quadra.modalidade, id: \.self){ item in
                Text(vm.modalidadeToString(m: item))
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
    }
}
//
//#Preview {
//    FuncQuadra(
//        idR:1,
//        nomeR:"Costa",
//        latR: 0.00,
//        lonR: 0.00,
//        modaR: ["Basquete","Futebol"],
//        endR: "Sasdelli, 123",
//        teleR: "link"
//    )
//}
