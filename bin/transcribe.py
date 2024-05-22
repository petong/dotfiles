import ollama
from transformers import pipeline
import spacy
import re

# Load LLaMA model and convert MP3 file to NumPy array
#llama_model = ollama.LLaMAModel()
llama_model = ollama.LLaMAModel()
mp3_file = 'audio.mp3'
audio_array, sr = llama_model.load_audio(mp3_file)

# Split audio array into chunks
chunk_duration = 10  # Adjust this value according to your needs
chunks = []
for i in range(0, len(audio_array), chunk_duration * sr):
    chunk = audio_array[i:i + chunk_duration * sr]
    chunks.append(chunk)

# Generate transcripts for each chunk
transcripts = []
for chunk in chunks:
    output = llama_model.generate_text_from_audio(chunk, 10)  # Adjust this value according to your needs

    transcripts.append(output)

# Summarize transcript in bullet points
summary_pipeline = pipeline('summarization')
summary = summary_pipeline(transcripts[0], max_length=50, min_length=20, do_sample=False)
print("Summary:")
for point in summary['summary_text'].split('.'):
    print(point.strip())

# Provide detailed summary
nlp = spacy.load('en_core_web_sm')

detail_summary = ''
for chunk in chunks:
    output = llama_model.generate_text_from_audio(chunk, 10)  # Adjust this value according to your needs

    detail_summary += output + '\n\n'

print("\nDetailed Summary:")
print(detail_summary)

# Extract action items
action_items = []
for transcript in transcripts:
    actions = re.findall(r'\b(Do|Will)\s+(.*)\b', transcript)
    for action in actions:
        action_items.append(action[1].strip())

print("\nAction Items:")
for item in action_items:
    print(item)

# Write output to a file
with open('output.txt', 'w') as f:
    f.write(f"Summary:\n" + summary['summary_text'] + "\n\nDetailed Summary:\n" + detail_summary + "\n\nAction Items:\n")
    for item in action_items:
        f.write(item + '\n')

