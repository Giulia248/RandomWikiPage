//
//  MainView.swift
//  RandomWikiPage
//
//  Created by user on 27/06/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
        TabView {
                  wikiApiView()
                       .tabItem {
                           Label("QrCodeGenerator", systemImage: "qrcode")
                               .navigationTitle("QrCodeGenerator")
                       }

                  CustomQrCode()
                       .tabItem {
                           Label("CustomQrCode", systemImage: "qrcode.viewfinder").foregroundColor(.black)
                               .navigationTitle("CustomQrCode")
                       }
            
            infosView()
                 .tabItem {
                     Label("About", systemImage: "info.circle")
                         .navigationTitle("About")
                 }
        }
      }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
