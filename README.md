# RandomWikiPage

IOS App based on Qrcode generation and web scraping 
Collaboration with 	@stefanospin7

Made with [contributors-img]([https://contrib.rocks](https://github.com/stefanospin7)).

## Screenshots

![1](https://user-images.githubusercontent.com/106954791/175944813-f9afa2be-066d-41f5-a8bb-b36ba3614104.png)

![2](https://user-images.githubusercontent.com/106954791/175944816-09ae4516-d6ad-4697-96d2-f541b75211eb.png)

## Functions used

### Web Scraping Function
'
     
    func viewDesc() {

        let wikipedia = Wikipedia()
        WikipediaNetworking.appAuthorEmailForAPI = "myMail@gmail.com" //put your email here
        
        let language = WikipediaLanguage("en")
        
        Wikipedia.shared.requestRandomArticles(language: language, maxCount: 1, imageWidth: 640) {
            (articlePreviews, language, error) in

            guard let articlePreviews = articlePreviews else { return }

           
            
            for article in articlePreviews {

                contatore += 1
                article1.append(article.displayTitle)
                article2.append(article.description)
  
            }
        }
    }
'

### generateQrCodeFromString

'
     
     func generateQrCodeFromString(string:String) -> UIImage{
        
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            
            if let cgImage = context.createCGImage(outputImage , from: outputImage.extent){
                
                return UIImage(cgImage:  cgImage)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
        
    }
'

## Package Repository
https://github.com/Raureif/WikipediaKit.git




