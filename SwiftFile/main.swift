//
//  main.swift
//  SwiftFile
//
//  Created by pengyunchou on 14-8-25.
//  Copyright (c) 2014年 swift. All rights reserved.
//

import Foundation


var f:File = File()
f.open(path: "a.txt", mode: "w+")
f.write(str: "hello world")
f.seek(offset: 0, mode: SEEK_SET)
var data=f.read(100)
println(String.stringWithUTF8String(data!)!)
f.close()
