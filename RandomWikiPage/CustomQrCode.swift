//
//  CustomQrCode.swift
//  RandomWikiPage
//
//  Created by user on 27/06/22.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct CustomQrCode: View {
    
    
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    @State var myText:String = ""
    
    var body: some View {
  
            VStack{
                
    
        Text("Write your text")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(CustomColor.bluScuro)
                    .padding()
                
                Text("⬇⬇⬇")
                 
            
                Spacer()
              
                TextEditor(text: $myText)
                    .padding()
                    .frame(height: 300)
                    .border(Color.cyan, width: 4)
                    .padding()
                
                Image(uiImage: generateQrCodeFromString(string: myText))
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 250, height: 250, alignment: .center)
                
                
                }.background(
                    LinearGradient(gradient: Gradient(colors: [.blue, .cyan, .white]), startPoint: .top, endPoint: .bottom)
                )

        
      
    }
    func generateQrCodeFromString(string:String) -> UIImage{
        
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            
            if let cgImage = context.createCGImage(outputImage , from: outputImage.extent){
                
                return UIImage(cgImage:  cgImage)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
        
    }
}

struct CustomQrCode_Previews: PreviewProvider {
    static var previews: some View {
        CustomQrCode()
    }
}
