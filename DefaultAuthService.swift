//
//  DefaultAuthService.swift
//  nearclientios
//
//  Created by Kevin McConnaughay on 2/17/22.
//

import Foundation
import UIKit
import WebKit

public class DefaultAuthService: ExternalAuthService {
  public static let shared = DefaultAuthService()
  
  var navController: UINavigationController?
  
  public func openURL(_ url: URL, presentingViewController: UIViewController) -> Bool {
    let viewController = UIViewController()
    navController = UINavigationController(rootViewController: viewController)
    let closeButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.dismiss))
    viewController.navigationItem.rightBarButtonItem = closeButton
    let webView = WKWebView()
    webView.translatesAutoresizingMaskIntoConstraints = false
    viewController.view.addSubview(webView)
    webView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor).isActive = true
    webView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor).isActive = true
    webView.topAnchor.constraint(equalTo: viewController.view.topAnchor).isActive = true
    webView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor).isActive = true
    webView.load(URLRequest(url: url))
    presentingViewController.present(navController!, animated: true, completion: nil)
    return true
  }
  
  @objc private func dismiss() {
    navController?.dismiss(animated: true, completion: { [weak self] in
      self?.navController = nil
    })
  }
}
