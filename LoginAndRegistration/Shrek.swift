//
//  Shrek.swift
//  LoginAndRegistration
//
//  Created by Иван Романов on 24.10.2019.
//  Copyright © 2019 Dimka Novikov. All rights reserved.
//

import UIKit

let signInUrl = "http://localhost:8080/SignIn"

class Shrek: UIViewController {
    
    @IBOutlet var shrek: [UITextField]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shrek[0].delegate = self
        self.shrek[1].delegate = self
    }
    
    @IBAction func signInTouchUp(_ sender: Any) {
        
        // POST запрос
        guard let url = URL(string: signInUrl) else { return }
        
        let parameters = ["login": self.shrek[0].text!,
                          "password": self.shrek[1].text!]
        
        let newURL = url.withQueries(parameters)
                
        let session = URLSession.shared
        session.dataTask(with: newURL!) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                
                let fetchedData = try JSONDecoder().decode(UserModel.self, from: data)
                
                print(fetchedData)
            } catch {
                print(error)
            }
            
        }.resume()
    }
}
    
    
    
extension Shrek: UITextFieldDelegate {

}

