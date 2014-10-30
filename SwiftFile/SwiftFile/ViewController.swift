//
//  ViewController.swift
//  SwiftFile
//
//  Created by pengyunchou on 14-9-30.
//  Copyright (c) 2014年 swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var filepath=NSHomeDirectory().stringByAppendingPathComponent("Documents/test.txt")
        var f:File=File()
        f.open(path: filepath, mode: "a+")
        f.write(str: "hello world")//写字符串
        f.write(data: [65,66,67])//写字节流ABC
        f.seek(offset: 0, mode: SEEK_SET)
        let readdata=f.read(1024)
        let str=String(CString: readdata!, encoding: NSUTF8StringEncoding)
        println(str!)
        f.close()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

