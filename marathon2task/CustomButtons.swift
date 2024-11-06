//
//  CustomButtons.swift
//  marathon2task
//
//  Created by Vika on 05.11.24.
//

import UIKit

class CustomButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        configure(with: title)
        setupActions()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure(with: "")
        setupActions()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configure(with title: String) {
        var config = UIButton.Configuration.filled()
        config.title = title
        config.image = UIImage(systemName: "arrow.right.circle.fill")
        config.imagePadding = 8
        config.imagePlacement = .trailing
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        self.configuration = config
        self.tintColorDidChange() // Установка начальных цветов
    }
    
    private func setupActions() {
        self.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        self.addTarget(self, action: #selector(buttonReleased), for: [.touchUpInside, .touchUpOutside, .touchCancel])
    }
    
    @objc private func buttonPressed() {
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    @objc private func buttonReleased() {
        UIView.animate(withDuration: 0.1) {
            self.transform = .identity
        }
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        
        var config = self.configuration ?? UIButton.Configuration.filled()
        config.baseBackgroundColor = tintColor
        config.baseForegroundColor = tintColor == .systemGray2 ? .systemGray3 : .white
        self.configuration = config
    }
}
