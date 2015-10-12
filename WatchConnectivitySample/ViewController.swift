//
//  ViewController.swift
//  WatchConnectivitySample
//
//  Created by akio0911 on 2015/10/13.
//  Copyright © 2015年 akio0911. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if WCSession.isSupported() {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : WCSessionDelegate
{
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        print("didReceiveMessage")
        
        let reply = ["From":"Phone", "To":"Watch"]
        replyHandler(reply)
    }
}
