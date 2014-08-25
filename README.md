swiftfile
=========

simple file api wrapper

#sample  
``` swfit
var f:File = File()
f.open(path: "a.txt", mode: "w+")
f.write(str: "hello world") // or you can write binary data like this: f.write(data:bindata)
f.seek(offset: 0, mode: SEEK_SET)
var data=f.read(100)
println(String.stringWithUTF8String(data!)!)
f.close()
```
