
import Foundation

protocol articlesDelegate {
    func articles(articles: [Article])
}

class TopHeadlinesViewModel {
    
    var delegate : articlesDelegate?
    
    func createRequest(q:String? = nil,country:String? = nil,from:String? = nil,to:String?=nil,category: String? = nil) {
        let myEndPoint = Endpoint.topHeadlines(q: q, country: country, from: from, to: to,category: category)
        
        let result = RequestService.shared.getArticles(endpoint: myEndPoint) { response in
            switch response{
            case .success(let res):
                DispatchQueue.main.async{
                    print(res.articles)
                    self.delegate?.articles(articles: res.articles)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    
}

