//
//  MainMenuController.swift
//  PPFApplier
//
//  Created by Victor Maia Aldecoa on 05/03/17.
//  Copyright © 2017 victoraldecoa. All rights reserved.
//

import Cocoa

class MainMenuController: NSWindowController {
    
    override func awakeFromNib() {
        super.windowDidLoad()
    }

    @IBAction func findIso(_ sender: NSButton) {
        NSLog("Pressed find iso");
    }
    
    @IBAction func findPpf(_ sender: NSButton) {
        NSLog("Pressed find ppf");
    }
    @IBAction func apply(_ sender: NSButton) {
        NSLog("Pressed apply");
//        ApplyPatch("", "");
    }
}
