# This is an unsupported method of redirecting urls in Qutebrowser.

import operator, re, typing
from urllib.parse import urljoin
from qutebrowser.api import interceptor, message
from PyQt5.QtCore import QUrl

# Any return value other than a literal 'False' means we redirected
REDIRECT_MAP = {
        "reddit.com": operator.methodcaller('setHost', 'libreddit.spike.codes'),
        "www.reddit.com": operator.methodcaller('setHost', 'libreddit.spike.codes'),

        "twitter.com": operator.methodcaller('setHost', 'nitter.net'),
        "www.twitter.com": operator.methodcaller('setHost', 'nitter.net'),

        # "youtube.com": operator.methodcaller('setHost', 'yewtu.be'),
        # "www.youtube.com": operator.methodcaller('setHost', 'yewtu.be'),

        # "youtube.com": operator.methodcaller('setHost', 'piped.kavin.rocks'),
        # "www.youtube.com": operator.methodcaller('setHost', 'piped.kavin.rocks'),

        "youtube.com": operator.methodcaller('setHost', 'vid.puffyan.us'),
        "www.youtube.com": operator.methodcaller('setHost', 'vid.puffyan.us'),

} # type: typing.Dict[str, typing.Callable[..., typing.Optional[bool]]]

# Exact urls to block
EXACT_LIST = [
	# "https://libreddit.spike.codes/",
	# "https://libredd.it/",
	# "https://vid.puffyan.us/",
	# "https://vid.puffyan.us/feed/popular",
	"https://youtube.com",
	"https://youtube.com/feed/popular",
	"https://yewtu.be/",
	"https://www.twitch.tv/",
	"https://yewtu.be/feed/popular",
	"https://piped.kavin.rocks/",
	"https://piped.kavin.rocks/feed/popular",
        "https://www.twitch.tv/directory/game/Just Chatting",
        "https://www.twitch.tv/directory"
]

def int_fn(info: interceptor.Request):
	# """Block the given request if necessary."""
	# if (info.resource_type != interceptor.ResourceType.main_frame or
	# 		info.request_url.scheme() in {"data", "blob"}):
	#	return

	url = info.request_url
	urlstr = info.request_url.toString()

	# Block exact url
	for exactUrl in EXACT_LIST:
		if exactUrl == urlstr:
			message.info("Blocking: " + url.toString())
			info.block()

        # Redirect url
	redir = REDIRECT_MAP.get(url.host())
	if redir is not None and redir(url) is not False:
		message.info("Redirecting to " + url.toString())
		info.redirect(url)


interceptor.register(int_fn)
