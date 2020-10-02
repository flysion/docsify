DIR=$(cd `dirname $0`; pwd)

ps -ef | grep "docsify serve --port=$1" | awk '{print $2}' | xargs kill -9
python3 "$DIR/build.py" "$2"

if [ ! -d "$DIR/node_modules" ]; then
    cd "$DIR"
    npm install
    cd -
fi

"$DIR/node_modules/.bin/docsify" serve --port=$1