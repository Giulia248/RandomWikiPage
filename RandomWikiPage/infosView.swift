//
//  infosView.swift
//  RandomWikiPage
//
//  Created by user on 27/06/22.
//

import SwiftUI

struct infosView: View {
    var body: some View {
        ScrollView{
            Spacer()
            
            VStack{
                Spacer()
                Text("°°")
                Text("This app let you generate random QrCodes based on wikipedia articles")
                Text("You can also generate a cusom Qrode that you write on a textField")
            }.padding()
            
        }.background(
            LinearGradient(gradient: Gradient(colors: [.blue, .cyan, .white]), startPoint: .top, endPoint: .bottom)
        ).ignoresSafeArea()
        
    }
}

struct infosView_Previews: PreviewProvider {
    static var previews: some View {
        infosView()
    }
}
