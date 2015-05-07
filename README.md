ランダムにtumblrのpostをピックアップして、slackに流す

# setup

## set env
get slcak incoming webhook url.
get tumblr oauth consumer key.

```
export SLACK_HOOK_URL=YOUR_SLACK_HOOK_URL
export HUBOT_TUMBLR_API_KEY=YOUR_COUNSUMER_KEY
```

## install dependencies
```
npm install
```


# run
```
./node_modules/.bin/coffee randomTumblrToSlack.coffee
```

# メモ
node-slack 0.0.5 を使おうとしたが、うまくいかなかった（バグ？）ので、requestで直接POSTすることにした。
