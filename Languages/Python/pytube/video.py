from pytube import YouTube
from pytube.innertube import _default_clients

# https://i.ytimg.com/vi//maxresdefault.jpg

_default_clients["ANDROID_MUSIC"] = _default_clients["ANDROID_CREATOR"]

yt = YouTube(
    "http://www.youtube.com/watch?v=", use_oauth=False, allow_oauth_cache=True
)
stream = yt.streams.get_highest_resolution()
stream.download()
print("Downloaded!")
