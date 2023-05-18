import csv
import random
import math

def load_data(filename):
    dataset = []
    with open(filename, 'r') as file:
        csv_reader = csv.reader(file)
        next(csv_reader)  # Skipping headers
        for row in csv_reader:
            if len(row) > 0:
                dataset.append([float(row[0]), float(row[1]), float(row[2]), float(row[3]), row[4]])
    return dataset

def euclidean_distance(point1, point2):
    sum_squared_distance = 0
    for i in range(len(point1) - 1):  # Exclude label
        sum_squared_distance += math.pow(point1[i] - point2[i], 2)
    return math.sqrt(sum_squared_distance)

def create_clusters(dataset, centroids, k):
    clusters = [[] for _ in range(k)]
    for point in dataset:
        shortest_distance = euclidean_distance(point, centroids[0])
        index = 0
        for i in range(1, k):
            distance = euclidean_distance(point, centroids[i])
            if distance < shortest_distance:
                shortest_distance = distance
                index = i
        clusters[index].append(point)
    return clusters

def calculate_centroids(clusters, k):
    centroids = [[] for _ in range(k)]
    for i in range(k):
        length = len(clusters[i])
        if length == 0:
            return []
        sum_points = [0 for _ in range(len(clusters[i][0]) - 1)]
        for point in clusters[i]:
            for j in range(len(point) - 1):
                sum_points[j] += point[j]
        for j in range(len(sum_points)):
            centroids[i].append(sum_points[j] / length)
    return centroids

def kmeans(dataset, k, max_iterations=100):
    centroids = random.sample(dataset, k)
    for _ in range(max_iterations):
        clusters = create_clusters(dataset, centroids, k)
        previous_centroids = centroids
        centroids = calculate_centroids(clusters, k)
        if centroids == previous_centroids:
            break
    return clusters, centroids

def count_varieties(clusters):
    variety_counts = []
    for cluster in clusters:
        variety_count = {}
        for point in cluster:
            variety = point[-1]
            if variety not in variety_count:
                variety_count[variety] = 0
            variety_count[variety] += 1
        variety_counts.append(variety_count)
    return variety_counts

dataset = load_data('iris.csv')
k = 3
clusters, centroids = kmeans(dataset, k)
variety_counts = count_varieties(clusters)
for i in range(k):
    print(f'Cluster {i + 1}: {variety_counts[i]}')
