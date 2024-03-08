from pytube import YouTube

# https://i.ytimg.com/vi//maxresdefault.jpg

ytObject = YouTube(
    "http://youtube.com/watch?v=", use_oauth=False, allow_oauth_cache=True
)
stream = ytObject.streams.get_highest_resolution()
stream.download()
print("Downloaded!")
