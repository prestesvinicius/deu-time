//
//  TabView.swift
//  deuTime
//
//  Created by Turma02-10 on 19/03/24.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            homeView()
                .tabItem {
                    Label("Eventos", systemImage: "flag.fill")
                }
            
            newEventView()
                .tabItem {
                    Label("Novo Evento", systemImage: "plus.app.fill")
                    
                }
            infoView()
                .tabItem {
                    Label("Perfil", systemImage: "person.fill")
                }
        }.accentColor(.darkBlue)
        
.navigationBarBackButtonHidden(true)
    }
}


#Preview {
    MyTabView()
}
