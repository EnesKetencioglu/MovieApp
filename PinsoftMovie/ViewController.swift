//
//  ViewController.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 30.05.2023.
//

import UIKit
import Reachability

class ViewController: UIViewController {
    var reachability: Reachability?

    override func viewWillAppear(_ animated: Bool) {
        
        reachability = try? Reachability()

        if reachability?.connection != .unavailable {
            print("no network")
         
              // Create and configure the alert controller
              let alertController = UIAlertController(title: "No Network", message:  "Please check your ethernet connection and try again.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: { _ in
                UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                   exit(EXIT_SUCCESS)
                }
            })
              alertController.addAction(okAction)
              // Present the alert controller
            DispatchQueue.main.async {
                self.present(alertController, animated: true, completion: nil)
            }
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
//    https://www.omdbapi.com/?t=fast&apikey=afab0e87
    }

}

