from pytube import YouTube

ytObject = YouTube(
    'https://youtu.be/',
    use_oauth=True,
    allow_oauth_cache=True
)
ytObject = ytObject.streams.get_highest_resolution()
ytObject.download()
print("Downloaded!")