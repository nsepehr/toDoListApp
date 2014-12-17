//
//  XYZAppData.swift
//  ToDoList
//
//  Created by Nima Sepehr on 12/14/14.
//  Copyright (c) 2014 Nima Sepehr. All rights reserved.
//

import UIKit

class XYZAppData: NSObject {
    
    // This class defines all the necessary functions 
    // needed for accessing data files for the app
    
    let homeDir: String = NSHomeDirectory()
    let taskFile: String = "myTasks.txt"
    
    func applicationDataDir() -> NSURL {
        // Grab the application data dir
        var myDataDir: NSURL! = nil
        var dataDir: NSFileManager = NSFileManager.defaultManager()
        let searchPath: NSSearchPathDirectory = NSSearchPathDirectory.DocumentDirectory
        let domainMask: NSSearchPathDomainMask = NSSearchPathDomainMask.UserDomainMask
        var possbileDirs: NSArray = dataDir.URLsForDirectory(searchPath, inDomains: domainMask)
        println("possbile dirs \(possbileDirs) ")
        
        if possbileDirs.count >= 1 {
            myDataDir = possbileDirs[0] as NSURL
            //var myBundleID: String! = NSBundle.mainBundle().bundleIdentifier!
            //println("My bundle id is: \(myBundleID) ")
            //myDataDir = myDataDir.URLByAppendingPathComponent(myBundleID!)
        }
        
        return myDataDir
    }
    
    func applicationDataFile(dataDir: NSURL!) -> NSURL {
        // Add the application data file name to the url
        var myDataFile: NSURL! = nil
        if dataDir == nil {
            return myDataFile
        }
        myDataFile = dataDir.URLByAppendingPathComponent(taskFile, isDirectory: false)
        println("My datafile is: \(myDataFile.path) ")
        return myDataFile
    }
    
    func writeToDataFile(dataFile: NSURL) {
        var error: NSError? = nil
        var documentHandler = NSFileManager.defaultManager()
        var thisString: String = "Write this to file and read"
        thisString.writeToFile(dataFile.path!, atomically: false, encoding: NSStringEncodingConversionOptions.AllowLossy.rawValue, error: &error)
//        thisString.writeToURL(dataFile, atomically: true, encoding: NSStringEncoding(), error: &error)
        if (error != nil) {
            println("Unable to write to file: \(error?.localizedDescription)")
        }
        //if documentHandler {
        //    println("File successfully created at \(dataFile.path) ")
        //}
        
    }
    
    func printHomeDir() {
        println("My home dir is: \(self.homeDir) ")
        var myDataDir: NSURL = self.applicationDataDir()
        println("My application data dir is: \(myDataDir.path) ")
        var myDataFile: NSURL = self.applicationDataFile(myDataDir)
        println("My application data file is: \(myDataFile.path) ")
        self.writeToDataFile(myDataFile)
    }
    
   
}
