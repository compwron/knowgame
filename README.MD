[![Code Climate](https://codeclimate.com/github/compwron/knowgame/badges/gpa.svg)](https://codeclimate.com/github/compwron/knowgame)
[![Test Coverage](https://codeclimate.com/github/compwron/knowgame/badges/coverage.svg)](https://codeclimate.com/github/compwron/knowgame)
[![Build Status](https://travis-ci.org/compwron/knowgame.svg)](https://travis-ci.org/compwron/knowgame)
[![Dependency Status](https://gemnasium.com/compwron/knowgame.png)](https://gemnasium.com/compwron/knowgame)


A commandline game for developers to play against their own codebase.

Basic idea: Pick a line from the most X% often updated files. Try to identify the file that contains the line. If you fail, show options for filename. If fail, show more lines.


````
git clone https://github.com/compwron/knowgame.git
cd knowgame
bundle install
bin/knowgame # for demo
bin/knowgame -h # for help
bin/knowgame -r path_to_my_codebase
```

````
Options:
        --root, -r <s>:   Folder in which .git folder is (default: .)
       --after, -a <s>:   Date since which you want to get commits, in yyyy-mm-dd format (default: 0-1-1)
  --file-count, -f <i>:   Number of files to play the game with; smaller numbers are easier (default: 10)
            --help, -h:   Show this message
````


````
export GEMNASIUM_TESTSUITE="bundle exec rake"
export GEMNASIUM_PROJECT_SLUG="compwron/knowgame"
gemnasium --token 22aeed0ba11d9ec037fc1840004f6716 autoupdate
````