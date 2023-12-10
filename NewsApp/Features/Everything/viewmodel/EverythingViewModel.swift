


import Foundation

protocol EverythingDelegate {
    func getEveryData(articles:[Article])
}

class EverythingViewModel{
    
    var delegate : EverythingDelegate?
    
    func createRequest(q:String?,language:String?,from:String? = nil,to:String? = nil){
        let myEndpoint = Endpoint.getEverything(q: q, from: from, to: to)
        
        let res = RequestService.shared.getArticles(endpoint: myEndpoint) { response in
            switch response{
            case .success(let data):
                DispatchQueue.main.async{
                    self.delegate?.getEveryData(articles: data.articles)
                }
            case .failure(let err):
                print(err)
            }
        }
        
    }
}
