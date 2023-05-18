import re
import locale
import os
import pandas as pd

# Create a set to store unique words
unique_words = set()

# Go through each file
for file_num in range(1, 6):
    # Open file for reading
    with open(f"{file_num}.txt", "r", encoding='utf-8') as file:
        # Read the content of the file
        file_content = file.read()

        # Remove punctuation and formatting
        cleaned_content = re.sub(r'[^\w\s]', '', file_content)

        # Split the text into words and add them to the set of unique words
        for word in cleaned_content.split():
            unique_words.add(word.lower())

# Set the Ukrainian locale
locale.setlocale(locale.LC_ALL, 'uk_UA.UTF-8')

# Sort words alphabetically in Ukrainian
sorted_words = sorted(unique_words, key=locale.strxfrm)

with open('dictionary.txt', 'w', encoding='utf-8') as file:
    # Write each word on a separate line
    for word in sorted_words:
        file.write(word + ', ')

# Create an empty DataFrame with rows - words from the dictionary and columns - file names
dictionary = list(sorted_words)
file_names = [f"{i}.txt" for i in range(1, 6)]
df = pd.DataFrame(index=dictionary, columns=file_names).fillna(0)

# Go through each file and count the occurrence of each word in the file
for file_num, file_name in enumerate(file_names):
    with open(file_name, "r", encoding="utf-8") as file:
        file_content = file.read()
        # Use regular expression to extract words from the text
        words = re.findall(r'\b\w+\b', file_content)
        for word in words:
            word = word.lower()
            if word in unique_words:
                df.at[word, file_name] += 1

# Add a column with the total occurrences of each word for all files
df["SUM"] = df.sum(axis=1)

# Save DataFrame to an Excel file
excel_file = 'word_counts.xlsx'
df.to_excel(excel_file)

# Find all words that occur only in one of the files
unique_words_per_file = {}
for file_num, file_name in enumerate(file_names):
    unique_words = set()
    with open(file_name, "r", encoding="utf-8") as file:
        file_content = file.read()
        # Use regular expression to extract words from the text
        words = re.findall(r'\b\w+\b', file_content)
        for word in words:
            word = word.lower()
            if word not in unique_words and word in unique_words_per_file:
                unique_words.add(word)
                if word not in unique_words_per_file:
                    unique_words_per_file[word] = set()
                unique_words_per_file[word].add(file_name)

# Find and print words in which a certain character occurs more than 4 times
symbol = input("\nEnter a character: ")
print(f"Words that contain the character '{symbol}' more than 4 times:")
for word in df.index:
    if word.count(symbol) > 4:
        print(word)
