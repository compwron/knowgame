A commandline game for developers to play against their own codebase

Note: This does not actually work yet

````
git clone ...
bundle install
bin/go # for demo
bin/go -r path_to_my_codebase
```

````
Options:
        --root, -r <s>:   Folder in which .git folder is (default: .)
       --after, -a <s>:   Date since which you want to get commits, in yyyy-mm-dd format (default: 0-1-1)
  --file-count, -f <i>:   Number of files to play the game with; smaller numbers are easier (default: 10)
            --help, -h:   Show this message
````
