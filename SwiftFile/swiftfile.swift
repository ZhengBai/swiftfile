//
//  swiftfile.swift
//  SwiftFile
//
//  Created by pengyunchou on 14-8-25.
//  Copyright (c) 2014年 swift. All rights reserved.
//

import Foundation

class File{
    var _file:UnsafePointer<FILE>?
    var path:String?
    init(){}
    func open(path p:String,mode m:String){
        self.path=p
        self._file=fopen(p, m)
    }
    func write(str s:String)->Int{
        var len=strlen(s)
        if let f=self._file{
            return Int(fwrite(s, 1, len, f))
        }else{
            return -1
        }
    }
    func write(data d:[Int8])->Int{
        var len=UInt(d.count)
        if let f=self._file{
           return Int(fwrite(d, 1, len, f))
        }else{
            return -1
        }
    }
    func read(expectlen:Int)->[Int8]?{
        if let f=self._file{
            var buff:[Int8]=[Int8](count:expectlen,repeatedValue:0x0)
            var readlen=fread(&buff, 1,  UInt(expectlen), f)
            var rs=buff[0...Int(readlen)]
            return Array(rs)
        }
        return nil
    }
    func seek(offset o:Int,mode m:Int32)->Bool{
        if let f=self._file{
            if fseek(f, o, m)==0{
                return true
            }
        }
        return false
    }
    func tell()->Int{
        if let f=self._file{
           return ftell(f)
        }
        return -1
    }
    func close()->Bool{
        if let f=self._file{
            if fclose(f)==0{
                return true
            }
        }
        return false
    }
}