import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
from sklearn import metrics
from collections import Counter

def load_and_scale_data(filename):
    # Load data
    data = pd.read_csv(filename)
    
    # Standardize the data (except for 'Type')
    scaler = StandardScaler()
    data_scaled = scaler.fit_transform(data.drop('Type', axis=1))
    
    return data, data_scaled

def perform_kmeans_clustering(data_scaled, num_clusters):
    # Perform KMeans clustering
    kmeans = KMeans(n_clusters=num_clusters, n_init=1, random_state=42)
    kmeans.fit(data_scaled)

    return kmeans

def visualize_clusters(data_scaled, kmeans, data_columns):
    # Visualize clusters
    for i in range(0, len(data_columns) - 2, 2):
        plt.figure(figsize=(10, 7))
        plt.scatter(data_scaled[:, i], data_scaled[:, i+1], c=kmeans.labels_, cmap='rainbow')
        plt.scatter(kmeans.cluster_centers_[:, i], kmeans.cluster_centers_[:, i+1], s=100, c='black', marker='x')
        plt.xlabel(data_columns[i])
        plt.ylabel(data_columns[i+1])
        plt.title('K-Means Clustering')
        plt.show()

def save_and_display_results(data, kmeans, output_filename):
    # Assign the cluster labels to each data point
    data['cluster'] = kmeans.labels_

    # Save results to CSV
    data.to_csv(output_filename, index=False)

    # Display the count of items in each cluster and compare with the true label distribution
    counter = Counter(kmeans.labels_)
    def_counter = Counter(data['Type'])

    print("Counter of the true labels \n", def_counter)
    print("\nCounter of the clusters \n", counter)
    print("\nSilhouette score: ", metrics.silhouette_score(data_scaled, kmeans.labels_, metric='euclidean'))


data, data_scaled = load_and_scale_data('Glass.csv')
kmeans = perform_kmeans_clustering(data_scaled, len(data['Type'].unique()))
visualize_clusters(data_scaled, kmeans, data.columns)
save_and_display_results(data, kmeans, 'result.csv')