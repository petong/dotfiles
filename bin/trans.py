import os
from pydub import AudioSegment
import speech_recognition as sr
from ollama import Llama

# Set up Ollama
model_path = "path/to/ollama/model"
llama = Llama(model_path=model_path)

# Transcribe the MP3 file
mp3_path = "path/to/your/audio.mp3"
audio = AudioSegment.from_mp3(mp3_path)
audio.export("audio.wav", format="wav")

recognizer = sr.Recognizer()
with sr.AudioFile("audio.wav") as source:
    audio = recognizer.record(source)
    transcript = recognizer.recognize_llama(audio, llama)

# Process the transcript
bullet_items = llama.generate_bullet_items(transcript)
summary = llama.generate_summary(transcript)

# Print the results
print("Transcript:")
print(transcript)
print("\nBullet Items:")
for item in bullet_items:
    print("- " + item)
print("\nSummary:")
print(summary)

# Clean up temporary files
os.remove("audio.wav")
