from pytube import YouTube
import os

ytObject = YouTube(
    "http://youtube.com/watch?v=", use_oauth=False, allow_oauth_cache=True
)
stream = ytObject.streams.filter(only_audio=True).first()
out_file = stream.download()
base, ext = os.path.splitext(out_file)
new_file = base + ".mp3"
os.rename(out_file, new_file)
print("Downloaded!")
