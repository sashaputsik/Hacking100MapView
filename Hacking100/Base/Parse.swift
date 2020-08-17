import Foundation

class ParsingMap{
    func parseMap(of url: String, complitionHandler: (([String: Any])->())?){
        guard let url = URL(string: url) else{return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
           guard let data = data else{return}
           if let json = try? JSONSerialization.jsonObject(with: data,
                                                           options: []) as? [[String: Any]]{
            for annotation in json{
                if let lati = annotation["latitude"] as? NSString, let long = annotation["longitude"] as? NSString{
                    complitionHandler?(annotation)
                    guard let title = annotation["title"] as? String else{return}
                    honoluluPlace.append(title)
                }
            }
        }
        }.resume()
        }
}
