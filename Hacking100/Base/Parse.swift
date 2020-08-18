import Foundation

class JsonParse{
    func parseMap(of url: String, complitionHandler: (([String: Any])->())?){
        guard let url = URL(string: url) else{return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
           guard let data = data else{return}
           if let json = try? JSONSerialization.jsonObject(with: data,
                                                           options: []) as? [[String: Any]]{
                for annotation in json{
                    complitionHandler?(annotation)
                    guard let title = annotation["title"] as? String else{return}
                    honoluluPlace.append(title)
                }
            }
        }.resume()
    }
}
