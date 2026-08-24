import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import (
    accuracy_score,
    precision_score,
    recall_score,
    f1_score,
    confusion_matrix
)
# Load dataset
data = pd.read_csv("student_performance.csv")
# Input features
X = data[
    [
        "Attendance",
        "Internal_Marks",
        "Assignment_Score",
        "Study_Hours",
        "Previous_Performance"
    ]
]
# Target
y = data["Result"]
# Convert Pass/Fail to numerical values
y = y.map({
    "Pass": 1,
    "Fail": 0
})

# Split data
X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.20,
    random_state=42,
    stratify=y
)

# Create inductive learning model
model = DecisionTreeClassifier(
    max_depth=4,
    random_state=42
)

# Train model
model.fit(X_train, y_train)

# Predict test data
y_pred = model.predict(X_test)

# Evaluation
accuracy = accuracy_score(y_test, y_pred)
precision = precision_score(y_test, y_pred)
recall = recall_score(y_test, y_pred)
f1 = f1_score(y_test, y_pred)

print("Accuracy:", accuracy)
print("Precision:", precision)
print("Recall:", recall)
print("F1 Score:", f1)

print("Confusion Matrix:")
print(confusion_matrix(y_test, y_pred))
