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
        
      
        ZStack{
            
          
//            Image("a")
//                .ignoresSafeArea()
             
                     
         
            VStack{
       
         
                
                Text("Random Wikipedia page generator")  .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(CustomColor.bluScuro)
                    .padding()
                

        
                      Image(uiImage: generateQrCodeFromString(string: "Title : \(article1[contatore]) Description: \(article1[contatore])"))
                          .resizable()
                          .interpolation(.none)
                          .scaledToFit()
                          .frame(width: 250, height: 250, alignment: .center)
                          .padding()
                      
                VStack{
                    HStack{
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
                                .foregroundColor(CustomColor.bluScuro)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                
                           
                            
                        }
                    )
                    
                    }.padding()
                    
                }.padding()
                      
                      

                Spacer()
                      
                      
                    
//                      Button {
//
//                                      viewDesc()
//
//                              }label :{
//                                  Text("Next")
//
//
//                                      .padding().foregroundColor(.black).font(.system(size: 30)).overlay(RoundedRectangle(cornerRadius:50).stroke(Color.black, lineWidth: 5))
//
//                              }
//
                Button("Next") {
                    viewDesc()
                        }
                        .buttonStyle(BlueButton())
                
                
                          
            }
             
//            .offset(x: 0, y: -350)
            
            
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

struct wikiApiView_Previews: PreviewProvider {
    static var previews: some View {
        wikiApiView()
       
    }
}

struct CustomColor {
  static let bluScuro = Color("bluScuro")
  // Add more here...
}

