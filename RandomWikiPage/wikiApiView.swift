//
//  wikiApiView.swift
//  RandomWikiPage
//
//  Created by user on 27/06/22.
//

import SwiftUI
import WikipediaKit
import CoreImage
import CoreImage.CIFilterBuiltins




struct wikiApiView: View {
    @State var article1 : [String] = ["click 'next' to start"]
    @State var article2 : [String] = ["..."]
    @State var contatore = 0
    
    func viewDesc() {

        let wikipedia = Wikipedia()
        WikipediaNetworking.appAuthorEmailForAPI = "giuliafloris88@gmail.com"
        
        let language = WikipediaLanguage("en")
        
        Wikipedia.shared.requestRandomArticles(language: language, maxCount: 1, imageWidth: 640) {
            (articlePreviews, language, error) in

            guard let articlePreviews = articlePreviews else { return }

            //print(articlePreviews)
            
            for article in articlePreviews {
                
                print("article : \(article.displayTitle) ")
                print("desc : \(article.description) ")
                print("divider°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°")
                contatore += 1
                article1.append(article.displayTitle)
                article2.append(article.description)
                
                
            }
        }
    }
    
    
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        
        ScrollView{
            VStack{
                
                Text("Random Wikipedia page generator")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.cyan)
                
                Image(uiImage: generateQrCodeFromString(string: "Title : \(article1[contatore]) Description: \(article1[contatore])"))
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 250, height: 250, alignment: .center)
                
                
                }
                
                DisclosureGroup(
                    content: {
                        // Date and Note
                        HStack{
                            Text("Description:").lineLimit(nil).multilineTextAlignment(.leading)
                 
                            Spacer()
                        }
                        
                        HStack{
                        Text("\(article2[contatore])")
                            .font(.body)
                            .bold()
                            //.lineLimit(1)
                            
                            Spacer()
                        }
                        
                    },
                    label: {
                        Text("\(article1[contatore])")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                       
                        
                    }
                ).padding()
            
          
        }
        
        Spacer()
        Button("Next") {
            
            
            viewDesc()
            
        }
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

struct wikiApiView_Previews: PreviewProvider {
    static var previews: some View {
        wikiApiView()
       
    }
}

/*
struct Article : Codable, Identifiable{
    let id = UUID()
    let title: String
    let description : String
}
*/

