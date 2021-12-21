# EZFile

This is a simple class that wraps the process of saving or loading a struct or class into a single file in the documents sandbox.



# To use...

struct MyStruct : Codable { ... }  //mark your struct or class as Codable

let a = MyStruct()

EZFile.storeObject(a)   //write object to file

if let b = {jj
 blah
} else {
damn
    }

if let b = EZFile.retrieveObject(MyStruct.self) {   //attempt to read object from file 
    //Success! Now use b
} else {
    //failed :(
}



# Operation...

Data is read and written to a single file in the users documents directory. Edit var filename to specify the file name.

To store an object a JSONEncoder is used to convert your Codable object into a Data object, then the Data can be written to a file.
