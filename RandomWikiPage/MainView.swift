//
//  MainView.swift
//  RandomWikiPage
//
//  Created by user on 27/06/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
                  wikiApiView()
                       .tabItem {
                           Label("QrCodeGenerator", systemImage: "qrcode")
                       }

                  infosView()
                       .tabItem {
                           Label("Infos", systemImage: "info.circle")
                       }
    }
}
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
