# Bash properties file reader

A bash snippet that reads properties files with the typical format:


```properties
# This is a comment and will be ignored

app.name = MyApp
app.version = 1.0
app.description = This is my application # Not a comment (this will be part of the value)

app.server.url = http://127.0.0.1
app.server.port = 78

# A few empty lines below; they will be ignored just like this comment



# The next line contains only spaces and will be ignored
        
```

---

## How to use it


Place the path to your properties file in the variable `FILENAME` at the beginning of the script. E.g:

```bash
FILENAME="app.properties"
# or
FILENAME="./../config/app.properties"
```

Alteratively you can also pass the filename as an argument

```shell
> ./properties-reader-snippet.sh app.properties
```

and the script will operate on this one and ignore the variable `FILENAME`

Since `bash` does not allow variables to have dots `.` within the name, the script will turn keys like `app.name` into `appname`

E.g:

    var name in .properties             var name in bash script
    ------------------------------------------------------------------------------
    app                                 app
    app.name                            appname
    app.server.url                      appserverurl


The script **does not** (yet) parse multi-line back-slashed strings like this one:

```properties
# The following is not yet implemented
text.multiline = This text \
    ends \
    here. 
```