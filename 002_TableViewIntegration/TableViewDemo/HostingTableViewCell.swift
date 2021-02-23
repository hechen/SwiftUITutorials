//
//  HostingTableViewCell.swift
//  TableViewDemo
//
//  Created by chen on 2021/1/29.
//

import SwiftUI

/*
 Create a UIHostingController object when you want to integrate SwiftUI views into a UIKit view hierarchy.
 At creation time, specify the SwiftUI view you want to use as the root view for this view controller;
 */
class HostingTableViewCell<Content: View>: UITableViewCell {
    
    private weak var controller: UIHostingController<Content>?
    
    func host(_ view: Content, parent: UIViewController) {
        if let controller = controller {
            controller.rootView = view
            controller.view.layoutIfNeeded()
        } else {
            // Integrate a swift ui view using a UIHostingController
            // then we use UIHostingController to represent original swiftUI
            let swiftUICellViewController = UIHostingController(rootView: view)
            controller = swiftUICellViewController
            swiftUICellViewController.view.backgroundColor = .clear
            
            layoutIfNeeded()
            
            parent.addChild(swiftUICellViewController)
            contentView.addSubview(swiftUICellViewController.view)
            swiftUICellViewController.view.translatesAutoresizingMaskIntoConstraints = false
            
            
            NSLayoutConstraint.activate(
                [
                    contentView.leadingAnchor.constraint(equalTo: swiftUICellViewController.view.leadingAnchor),
                    contentView.trailingAnchor.constraint(equalTo: swiftUICellViewController.view.trailingAnchor),
                    contentView.topAnchor.constraint(equalTo: swiftUICellViewController.view.topAnchor),
                    contentView.bottomAnchor.constraint(equalTo: swiftUICellViewController.view.bottomAnchor),
                ]
            )
            
            swiftUICellViewController.didMove(toParent: parent)
            swiftUICellViewController.view.layoutIfNeeded()
        }
    }
}
