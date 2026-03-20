import json
import csv
from pathlib import Path

base_dir = Path(__file__).resolve().parent.parent
input_file = base_dir / "data" / "spotify_liked_songs.json"
output_file = base_dir / "data" / "spotify_liked_songs_athena.csv"

with input_file.open("r", encoding="utf-8") as f:
    records = json.load(f)

with output_file.open("w", encoding="utf-8", newline="") as f:
    writer = csv.DictWriter(
        f,
        fieldnames=["added_at", "track_name", "artists", "album", "track_id", "spotify_url"]
    )
    writer.writeheader()
    writer.writerows(records)

print(f"Wrote {len(records)} rows to {output_file}")