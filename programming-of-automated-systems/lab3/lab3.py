import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from pandas.plotting import scatter_matrix
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import GridSearchCV

# Load data from file
data = pd.read_csv('Glass.csv', sep=',')

# Dictionary with colors for glass types
colorsMap = {1: 'red', 2: 'blue', 3: 'green', 4: 'orange', 5: 'purple', 6: 'pink', 7: 'brown'}

# Create a list of colors for each data row
colors = data['Type'].map(colorsMap)

# Display data as scatter matrix
scatter_matrix(data, figsize=(12, 12), alpha=0.7, diagonal='hist', c=colors)
plt.show()

# Predict class
y = data['Type']

# Features for prediction
X = data.drop('Type', axis=1)

# Split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create classifier
dt = DecisionTreeClassifier()

# Train classifier
dt.fit(X_train, y_train)

# Apply classifier to test data
y_pred = dt.predict(X_test)

# Evaluate classifier
print("Classification Report:")
print(classification_report(y_test, y_pred))

print("Confusion Matrix:")
print(confusion_matrix(y_test, y_pred))

# Scale features
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

# Train classifier on scaled data
dt.fit(X_train_scaled, y_train)

# Apply classifier to scaled test data
y_pred_scaled = dt.predict(X_test_scaled)

# Evaluate classifier on scaled data
print("Classification Report (Scaled):")
print(classification_report(y_test, y_pred_scaled))

print("Confusion Matrix (Scaled):")
print(confusion_matrix(y_test, y_pred_scaled))

# Tune hyperparameters
param_grid = {'max_depth': range(1, 21), 'min_samples_split': range(2, 21), 'min_samples_leaf': range(1, 21)}
grid = GridSearchCV(DecisionTreeClassifier(), param_grid, scoring='accuracy', cv=5)
grid.fit(X_train_scaled, y_train)

# Print best hyperparameters
print("Best Parameters:")
print(grid.best_params_)

# Print best score
print("Best Score:")
print(grid.best_score_)

# Apply best classifier to test data
best_dt = grid.best_estimator_
y_pred_best = best_dt.predict(X_test_scaled)

# Evaluate best classifier on test data
print("Classification Report (Best Parameters):")
print(classification_report(y_test, y_pred_best, zero_division=1))

print("Confusion Matrix (Best Parameters):")
print(confusion_matrix(y_test, y_pred_best))

# Evaluate accuracy of best classifier on test data
print("Accuracy Score (Best Parameters):")
print(accuracy_score(y_test, y_pred_best))