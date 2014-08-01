expenv.sh - Expand environment variables (shell script)
======
Expenv.sh evaluates shell expressions, e.g. ${var}, $var, $(cmd), reading from a file or stdin. Supports stdout or inplace replacement.

Download and Installation
-----

Simply download the [expenv.sh](expenv.sh) file or use a one-liner:
```bash
# Download
$ curl -o expenv.sh -- https://raw.githubusercontent.com/blang/expenv.sh/master/expenv.sh && chmod +x ./expenv.sh
# Download and install
$ curl -o expenv.sh -- https://raw.githubusercontent.com/blang/expenv.sh/master/expenv.sh && chmod +x ./expenv.sh && mv ./expenv.sh /usr/bin/
```

Usage
-----

```bash
$ cat inputfile | expenv.sh > outputfile
$ expenv.sh -f inputfile > outputfile
$ expenv.sh < inputfile > outputfile
$ expenv.sh -i -f inputfile // Replace inplace
```

Example input:
```
My PWD is $PWD
Whoami: ${USER}
I'm using $TERM
Supporting $(echo commands) now!
```

Motivation
-----

I need to make config files more dynamic using environment variables. In a docker environment this is a big issue for me. I wrote a small golang project ([expenv](https://github.com/blang/expenv)) to solve this, until Reddit-User `vanwho` pointed out a shell one-liner which i adopted in this script.

Contribution
-----

Feel free to make a pull request. For bigger changes create a issue first to discuss about it.


License
-----

See [LICENSE](LICENSE) file.