//
//  ViewController.swift
//  marathon2task
//
//  Created by Vika on 05.11.24.
//
 
import UIKit

class ViewController: UIViewController {
    
    private var buttons: [CustomButton] = []
    private var isModalPresented = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let button1 = CustomButton(title: "First Button")
        let button2 = CustomButton(title: "Second Medium Button")
        let button3 = CustomButton(title: "Third")
        
        button3.addTarget(self, action: #selector(showModalController(_:)), for: .touchUpInside)
        
        buttons = [button1, button2, button3]
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 8),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 8)
        ])
    }

    @objc private func showModalController(_ sender: CustomButton) {
        guard !isModalPresented else { return }
        isModalPresented = true
        updateButtonsAppearance()
        
        let modalVC = UIViewController()
        modalVC.view.backgroundColor = .white
        modalVC.modalPresentationStyle = .pageSheet
        modalVC.presentationController?.delegate = self
        
        present(modalVC, animated: true) {
            self.updateButtonsAppearance()
        }
    }

    private func updateButtonsAppearance() {
        let newTintColor: UIColor = isModalPresented ? .systemGray2 : .systemBlue
        
        buttons.forEach { button in
            button.tintColor = newTintColor
        }
    }

    @objc private func modalDidDismiss() {
        isModalPresented = false
        updateButtonsAppearance()
    }
}


extension ViewController: UIAdaptivePresentationControllerDelegate {

    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        isModalPresented = false
        updateButtonsAppearance()
    }
}
