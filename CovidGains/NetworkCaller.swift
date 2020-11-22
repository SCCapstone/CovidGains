//api.edamam.com/search?q=chicken&app_id=$6a6b1468&app_key=$9c866b0c3c7c3889dcd8fb7159babc5d"

final class NetworkCaller {

  func searchRecipes() {
    //Put ingredients concatenation here
    let url = URL();
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data,response,error} in
      if let error = error {
        print ("Error")
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
        print("Error with the response, unexpected status code: \(response)")
        return
      }

      if let data = data,
        let recipe = try? JSONDecoder().decode(recipe.self, from: data) {
          completionHandler(recipe.results ?? [])
      }

    })
    //task.resume()
    
  }

}
