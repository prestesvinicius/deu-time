//
//  Structs.swift
//  DeuJogo
//
//  Created by Turma02-1 on 15/03/24.
//

import Foundation
import MapKit

//// Modificável
//struct Usuario : Decodable {
//    var _id : String
//    var idUsuario : Int
//    var nome : String
//    var senha : String
//    foto
//    modalidades
////    localizacao
////    whatsapp
//}



enum M : String, Decodable, Encodable, CaseIterable, Identifiable {
    case Futebol = "Futebol",
         Basquete = "Basquete",
         Voleibol = "Voleibol",
         Handebol = "Handebol",
         Outros = "Outros"
    var id: Self { self }
}

// Modificável
struct Evento : Codable {
    var _id : String?
    var _rev : String?
    var idEvento : Int
    var idQuadra : Int
    var idRegiao : Int
    var modalidade : M
    var nome : String
    var lat : Double
    var lon :  Double
    var data : String
    var hora_inicio : String
    var num_vagas : Int
    var num_participantes : Int
    var imagem : String
}

// Pré-cadastrado
struct Quadra : Decodable, Hashable {
    var _id : String?
    var idQuadra : Int
    var idRegiao : Int
    
    var nome : String
    var lat : Double
    var lon : Double
    var modalidade : [M]
    var imagem : String
    var endereco : String
    var telefone : String
}

// Pré-cadastrado
struct Regiao : Decodable {
    var _id : String
    var idRegiao : Int
    
    var nome : String
    var foto : String
    var lat : Double
    var lon : Double
}

// Pré-cadastrado
struct Modalidade : Decodable {
    var _id : String
    var idModalidade : Int
    
    var nome : String
    var imagem : String
    var capa : String
}

struct userFake : Identifiable{
    var id : Int
    var nome : String
    var avatar : String
    var telefone : String
    var modalidades : String
}
