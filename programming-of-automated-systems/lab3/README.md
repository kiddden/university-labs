# Project Title: Decision Tree Classifier on Glass Dataset

## Task Description

The goal of this project is to develop a Decision Tree classifier on the Glass dataset. The classifier will predict the type of glass based on its refractive index and other attributes. The implementation will use the scikit-learn library and follow a standard machine learning workflow, including data preprocessing, model training, and model evaluation. The performance of the model will be measured using classification metrics such as accuracy, precision, recall, and F1-score.

## Project Structure
- **Data**: The dataset used in this project is the Glass dataset, which contains 214 samples of different types of glass. The dataset has 10 attributes, including the refractive index and the amounts of various chemical elements such as sodium, magnesium, aluminum, and silicon. The dataset is available in a CSV file named `Glass.csv`.

- **Implementation**: The implementation of the Decision Tree classifier is provided in a Python script named `lab3.py`. It includes functions for data preprocessing, model training, model evaluation, and hyperparameter tuning. The implementation also includes data visualization using the Matplotlib library.

- **Results**: The performance of the model is evaluated using classification metrics such as accuracy, precision, recall, and F1-score. The model achieves an accuracy of 75.58% on the test set with default hyperparameters. Hyperparameter tuning using the GridSearchCV method improves the accuracy to 80.23% by selecting the best values for the `max_depth`, `min_samples_split`, and `min_samples_leaf` hyperparameters. The analysis shows that the accuracy of the model is sensitive to the choice of hyperparameters and the scaling of the input features. In general, a Decision Tree classifier is a simple and interpretable model that can achieve reasonable performance on small and medium-sized datasets.
