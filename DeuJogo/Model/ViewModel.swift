//
//  ViewModel.swift
//  DeuJogo
//
//  Created by Turma02-1 on 18/03/24.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var eventos : [Evento] = []
    @Published var quadras : [Quadra] = []
    @Published var regioes : [Regiao] = []
    @Published var modalidades : [Modalidade] = []
    
    
    
//    usuários fake para usar na event card
    @Published var usuarios = [
        userFake(id: 0, nome: "Lebron James", avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/LeBron_James_and_Kevin_Love_%28cropped%29.jpg/640px-LeBron_James_and_Kevin_Love_%28cropped%29.jpg", telefone: "(45)99990-2308", modalidades: "Basquete"),
        userFake(id:1, nome: "Michael Jordan", avatar: "https://sextante.com.br/wp-content/uploads/2019/04/MichaelJordan.png", telefone: "(45)98000-2323", modalidades: "Basquete"),
        userFake(id:2, nome: "Stephen Curry", avatar: "https://hips.hearstapps.com/hmg-prod/images/stephen-curry-gettyimages-1398745379.jpg", telefone: "(45)93333-3030", modalidades: "Basquete")
]
    
//    usuarios = usuarios.append(lebron)
    
    
    // Le o banco de dados eventos
    func fetch_eventos(){
        guard let url = URL(string: "http://192.168.128.47:1880/getE" ) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
            do {
                let jsonDecodificado = try JSONDecoder().decode([Evento].self, from: data)
                
                DispatchQueue.main.async {
                    self?.eventos = jsonDecodificado
                }
            }catch{
                print(error)
            }
            
        } // Decodifica os Dados
        task.resume()
    } // Atualizar o Array eventos
    
    
    // Le o banco de dados quadras
    func fetch_quadras(){
        guard let url = URL(string: "http://192.168.128.47:1880/getQ" ) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
            do {
                let jsonDecodificado = try JSONDecoder().decode([Quadra].self, from: data)
                
                DispatchQueue.main.async {
                    self?.quadras = jsonDecodificado
                }
            }catch{
                print(error)
            }
            
        } // Decodifica os Dados
        task.resume()
    } // Atualizar o Array quadras
    
    
    // Le o banco de dados regioes
    func fetch_regioes(){
        guard let url = URL(string: "http://192.168.128.47:1880/getR" ) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
            do {
                let jsonDecodificado = try JSONDecoder().decode([Regiao].self, from: data)
                
                DispatchQueue.main.async {
                    self?.regioes = jsonDecodificado
                }
            }catch{
                print(error)
            }
            
        } // Decodifica os Dados
        task.resume()
    } // Atualizar o Array regioes
    
    
    // Le o banco de dados modalidades
    func fetch_modalidades(){
        guard let url = URL(string: "http://192.168.128.47:1880/getM" ) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
            do {
                let jsonDecodificado = try JSONDecoder().decode([Modalidade].self, from: data)
                
                DispatchQueue.main.async {
                    self?.modalidades = jsonDecodificado
                }
            }catch{
                print(error)
            }
            
        } // Decodifica os Dados
        task.resume()
    } // Atualizar o Array modalidades
    
    
    // posta um evento no banco de dados eventos
    func post_evento(_ obj : Evento) {
        guard let url = URL(string: "http://192.168.128.47:1880/postE") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Headers must specify that the HTTP request body is JSON-encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        let encoder = JSONEncoder()
        
        do {
            let jsonData = try encoder.encode(obj)
            request.httpBody = jsonData
            print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
            print("Error encoding to JSON: \(error.localizedDescription)")
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error to send resource: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error to send resource: invalid response")
                return
            }
            
            if httpResponse.statusCode == 200 {
                print("Resource POST successfully")
            } else {
                print("Error POST resource: status code \(httpResponse.statusCode)")
            }
        }
        print("DEU")
        task.resume()
    }
    
    
    // busca o evento com determinado id
    // entrada: id do evento
    // saída: evento correspondente ao [id]
    // condicao: nao se pode ter id's repetidos
    // chamada: "evento = viewModel.getEventoId(idEvento: 3).first"
    func getEventoId(idEvento: Int) -> [Evento] {
        return eventos.filter { $0.idEvento == idEvento }
    }
    
    // busca a quadra com determinado id
    // entrada: id da quadra
    // saída: quadra correspondente ao [id]
    // condicao: nao se pode ter id's repetidos
    func getQuadraId(idQuadra: Int) -> [Quadra] {
        return quadras.filter { $0.idQuadra == idQuadra }
    }
    
    // busca a regiao com determinado id
    // entrada: id da regiao
    // saída: regiao correspondente ao [id]
    // condicao: nao se pode ter id's repetidos
    func getRegiaoId(idRegiao: Int) -> [Regiao] {
        
 
        
        return regioes.filter { $0.idRegiao == idRegiao }
    }
    
    // busca a modalidade com determinado id
    // entrada: id da modalidade
    // saída: modalidade correspondente ao [id]
    // condicao: nao se pode ter id's repetidos
    func getModalidadeId(idModalidade: Int) -> [Modalidade] {
        return modalidades.filter { $0.idModalidade == idModalidade }
    }
    
    
    // filtra o array de eventos de acordo com tal quadra
    // entrada: id da quadra
    // saída: array de eventos que são da quadra [id]
    func filtrar_eventos_quadra(idQuadra: Int) -> [Evento] {
        
        
        return eventos.filter { $0.idQuadra == idQuadra }
    }
    
    // filtra o array de eventos de acordo com tal regiao
    // entrada: id da regiao
    // saída: array de eventos que são da regiao [id]
    func filtrar_eventos_regiao(idRegiao: Int) -> [Evento] {
        
        return eventos.filter { $0.idRegiao == idRegiao }
    }
    
    // filtra o array de eventos de acordo com tal modalidade
    // entrada: .nome (enum) da modalidade
    // saída: array de eventos que são da modalidade [enum]
    func filtrar_eventos_modalidade(modalidade: String) -> [Evento] {
        return eventos.filter { $0.modalidade.rawValue == modalidade }
    }
    
    // printa a lista de eventos dentro da leitura do fetch()
    func printarEventos() {
        for evento in eventos {
            print("idEvento: \(evento.idEvento)")
            print("idQuadra: \(evento.idQuadra)")
            print("idRegiao: \(evento.idRegiao)")
            print("modalidade: \(evento.modalidade)")
            print("nome: \(evento.nome)")
            print("\n")
        }
    }
    
    // printa a lista de quadras dentro da leitura do fetch()
    func printarQuadras() {
        for quadra in quadras {
            print("idQuadra: \(quadra.idQuadra)")
            print("idRegiao: \(quadra.idRegiao)")
            print("nome: \(quadra.nome)")
            print("\n")
        }
    }
    
    // printa a lista de regioes dentro da leitura do fetch()
    func printarRegioes() {
        for regiao in regioes {
            print("idRegiao: \(regiao.idRegiao)")
            print("nome: \(regiao.nome)")
            print("\n")
        }
    }
    
    // printa a lista de modalidades dentro da leitura do fetch()
    func printarModalidades() {
        for modalidade in modalidades {
            print("idModalidade: \(modalidade.idModalidade)")
            print("nome: \(modalidade.nome)")
            print("\n")
        }
    }
    
    
    func modalidadeToString(m : M) -> String{
        if (m == M.Basquete) {
            return "Basquete"
        }
        else if(m == M.Futebol) {
            return "Futebol"
        }
        else if(m == M.Handebol) {
            return "Handebol"
        }
        else if(m == M.Voleibol) {
            return "Voleibol"
        }
        else {
            return "Outros"
        }
    }
    
    func extractDayAndMonth(from dateString: String) -> (String, String)? {
        let monthAbbreviations = [
            "Jan": "JAN",
            "Feb": "FEV",
            "Mar": "MAR",
            "Apr": "ABR",
            "May": "MAI",
            "Jun": "JUN",
            "Jul": "JUL",
            "Aug": "AGO",
            "Sep": "SET",
            "Oct": "OUT",
            "Nov": "NOV",
            "Dec": "DEZ"
        ]
        
        let components = dateString.split(separator: " ")
        
        guard components.count == 3 else {
            return nil // Retorna nil se o formato não estiver correto
        }
        
        let day = String(components[0])
        let month = String(components[1])
        
        if let abbreviatedMonth = monthAbbreviations[month] {
            return (day, abbreviatedMonth)
        } else {
            return nil // Retorna nil se o mês não estiver mapeado corretamente
        }
    }
    
    
    func extractHora(from horaString: String) -> String?{
        let components = horaString.split(separator: ":")
        
        guard components.count == 3 else {
            return nil // Retorna nil se o formato não estiver correto
        }
        
        let horario = String(components[0] + ":" + components[1])
        return horario
    }
    
    func get_idRegiao_by_idQuadra(idQuadra: Int) -> Int {
        let q = get_quadra_id(idQuadra: idQuadra)
        return q.first!.idRegiao
    }
    
    // busca a quadra com determinado id
    // entrada: id da quadra
    // saída: quadra correspondente ao [id]
    // condicao: nao se pode ter id's repetidos
    func get_quadra_id(idQuadra: Int) -> [Quadra] {
        return quadras.filter { $0.idQuadra == idQuadra }
    }
    
}

