//
//  ViewController.swift
//  appearing_messages
//
//  Created by Sasha Myshkina on 18.06.2020.
//  Copyright © 2020 Sasha Myshkina. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scroll: ScrollableTextView!
    @IBOutlet weak var message1: MessageView!
    @IBOutlet weak var message2: MessageView!
    @IBOutlet weak var message3: MessageView!
    @IBOutlet weak var message4: MessageView!
    @IBOutlet weak var message5: MessageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.delegate = self
        scroll.startScrollingText()
        configureMessages()
    }
    
    
    private func configureMessages() {
        message1.messageTextLabel.text = K.message1
        message2.messageTextLabel.text = K.message2
        message3.messageTextLabel.text = K.message3
        message4.messageTextLabel.text = K.message4
        message5.messageTextLabel.text = K.message5
    }
    
}

class ScrollableTextView: UIScrollView {
    
    var timer: Timer!
    var initialTopOffset: CGFloat = 200
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var heightBottomViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightTopViewConstraint: NSLayoutConstraint!
    
    
    var subviewIndex = 1
    var yOffset: CGFloat = 0
    let height = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func startScrollingText(){
        
        heightBottomViewConstraint.constant = height - self.initialTopOffset - self.content.subviews[0].frame.height
        
        timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { timer in
            
            if self.subviewIndex > 0 && self.subviewIndex < self.content.subviews.count {
                
                DispatchQueue.main.async {
                    self.yOffset += (self.content.subviews[self.subviewIndex-1].frame.height)

                    self.setContentOffset(CGPoint(x: 0, y: self.yOffset), animated: true)
                    
                    UIView.animate(withDuration: 0.1, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                        self.updateConstraints()
                    }, completion: { _ in
                        self.subviewIndex += 1
                    })
                }
            } else {
                self.scrollToTop(animated: true)
                self.bottomView.isHidden = true
                self.topView.isHidden = true
                timer.invalidate()
            }
        })
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        updateHeightConstraint(forViewIndex: subviewIndex)

    }
    
    private func updateHeightConstraint(forViewIndex: Int) {
        heightBottomViewConstraint.constant = height - self.initialTopOffset - self.content.subviews[forViewIndex].frame.height
    }
    
    
    
}
