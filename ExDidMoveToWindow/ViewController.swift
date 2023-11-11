//
//  ViewController.swift
//  ExDidMoveToWindow
//
//  Created by 김종권 on 2023/11/11.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = VC2()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.present(vc, animated: true)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismiss(animated: true)
        }
    }
}

class VC2: UIViewController {
    let someView = SomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(someView)
        
        someView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            someView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            someView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            someView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            someView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
}

class SomeView: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = .gray.withAlphaComponent(0.3)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        if window == nil {
            print("제거됨")
        } else {
            print("추가됨")
        }
        
    }
}
