import pandas as pd
import numpy as np
import math
import random

# Splitter for the dataset
def train_test_split(data, test_size=0.1, random_state=None):
    if random_state is not None:
        random.seed(random_state)
    data_len = len(data)
    test_data_len = int(data_len * test_size)
    test_indices = random.sample(range(data_len), test_data_len)
    test_data = data.iloc[test_indices]
    train_data = data.drop(test_indices)
    return train_data, test_data

# Implementing the modified Nearest Neighbor classifier
def cosine_distance(a, b):
    dot_product = np.dot(a, b)
    norm_a = np.linalg.norm(a)
    norm_b = np.linalg.norm(b)
    return 1 - dot_product / (norm_a * norm_b)

def nn_modified(test_sample, train_data):
    distances = []
    for index, row in train_data.iterrows():
        distance = cosine_distance(test_sample[:-3], row[:-3])
        distances.append((index, distance))

    nearest_neighbor = min(distances, key=lambda x: x[1])
    return np.argmax(train_data.loc[nearest_neighbor[0], 'variety_Setosa':])

# Loading the dataset
data = pd.read_csv('iris.csv')

# Preprocessing the dataset
data = pd.get_dummies(data, columns=['variety'])

# Printing the columns after one-hot encoding for debug 
print(data.columns)

# Splitting the dataset into training and testing sets
train_data, test_data = train_test_split(data, test_size=0.1, random_state=42)

# Testing the classifier on the testing set
predictions = []
for _, row in test_data.iterrows():
    predicted_class = nn_modified(row, train_data)
    predictions.append(predicted_class)

# Calculating the accuracy of the classifier
correct = 0
for i, prediction in enumerate(predictions):
    if prediction == np.argmax(test_data.iloc[i, -3:].values):
        correct += 1

accuracy = correct / len(predictions) * 100
print(f'The accuracy of the Nearest Neighbor classifier is {accuracy:.2f}%')
