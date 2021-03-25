//
//  TabBarView.swift
//  iCoComics
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/03/2021.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            ComicsModule().navigation().tabItem {
                VStack{
                    Image(systemName: "tv")
                    Text("Comics")
                }
            }.tag(0)
        }.environment(\.colorScheme, .dark)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
