//
//  ContentView.swift
//  RandomWikiPage
//
//  Created by user on 24/06/22.
//

import SwiftUI
import SwiftSoup
import WebKit

struct ContentView: View {
    @State var title = " nil "
    @State var title2: [String] = []
    
    var body: some View {
        
        
        ZStack{

            
            Image("a").resizable().frame(width: 800, height: 1000).offset(x: 0, y: 0)
            
            
            Button {
                do{
                    
                    try print(wikiPageTry())
                    print("debug1")
                    try print(wikiPage())
                }catch{
                    print("error1")
                }
      }label :{
Text("Generate").padding().foregroundColor(.black).font(.system(size: 30)).overlay(RoundedRectangle(cornerRadius:50).stroke(Color.black,   lineWidth: 5))
          
      }.offset(x: 0, y: 300)
            
            Text(title).padding().foregroundColor(.black).font(.system(size: 30)).offset(x: 0, y: 0)
            
            
            
        }
    }
}




//°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°



//      https://it.wikipedia.org/wiki/Speciale:PaginaCasuale


/*
 let soup:Document = try! SwiftSoup.parseBodyFragment(html)
 let p : Elements = try! soup.select("p")
 for j in p{
     print(try! j.getChildNodes())

 }}
 */




func wikiPage()  throws -> String {
  
        
    let url = URL(string:"https://it.wikipedia.org/wiki/Speciale:PaginaCasuale")!
    let html = try String(contentsOf: url)
    let document = try SwiftSoup.parse(html)
    print(try document.title())
    
    return try document.title()
    
    
    
    
    
}


func wikiPageTry()   throws -> [Node] {
  
    var text : [Node] = []
    
    var data:Data
    let url = URL(string:"https://it.wikipedia.org/wiki/Speciale:PaginaCasuale")!
    let html = try String(contentsOf: url)
    let document = try SwiftSoup.parse(html)
    print(try document.title())
    
    let soup:Document = try! SwiftSoup.parseBodyFragment(html)
    let p : Elements = try! soup.select("p")
    for j in p{
       
        text.append(try! j.getChildNodes())
    }
    return text
}

