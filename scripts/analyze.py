import json
from collections import Counter

with open("../data/spotify_liked_songs.json", encoding="utf-8") as f:
    tracks = json.load(f)

print("Type:", type(tracks))
print("Total tracks:", len(tracks))
print("First item:", tracks[0])

artists = []

for t in tracks:
    artist_field = t.get("artists", "")
    split_artists = [a.strip() for a in artist_field.split(",") if a.strip()]
    artists.extend(split_artists)

print("\nTop 10 artists:")
print(Counter(artists).most_common(10))