//
//  SplashScreenViewController.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//  
//

import UIKit
import Reachability

class SplashScreenViewController: UIViewController {
    var presenter: ViewToPresenterSplashScreenProtocol?
    
    @IBOutlet weak var image: UIImageView!
    var reachability: Reachability?

    override func viewDidLoad() {
        super.viewDidLoad()
        reachability = try? Reachability()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if reachability?.connection == .unavailable {
            showNoNetworkAlert()
        } else {
            // Proceed with presenting the main view
            let vc = MainRouter.createModule()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
        }
    }

    private func showNoNetworkAlert() {
        let alertController = UIAlertController(title: "No Network", message: "Please check your ethernet connection and try again.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                exit(EXIT_SUCCESS)
            }
        }
        alertController.addAction(okAction)
        
        DispatchQueue.main.async {
            self.image.image = UIImage(named: "noNetwork")
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

extension SplashScreenViewController: PresenterToViewSplashScreenProtocol{
}
