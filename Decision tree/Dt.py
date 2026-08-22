import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import LabelEncoder
from sklearn.tree import DecisionTreeClassifier, plot_tree
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
data = {"Outlook": [
        "Sunny", "Sunny", "Overcast", "Rain",
        "Rain", "Rain", "Overcast", "Sunny",
        "Sunny", "Rain", "Sunny", "Overcast",
        "Overcast", "Rain"
    ],
    "Temperature": [
        "Hot", "Hot", "Hot", "Mild",
        "Cool", "Cool", "Cool", "Mild",
        "Cool", "Mild", "Mild", "Mild",
        "Hot", "Mild"
    ],
    "Humidity": [
        "High", "High", "High", "High",
        "Normal", "Normal", "Normal", "High",
        "Normal", "Normal", "Normal", "High",
        "Normal", "High"
    ],

    "Wind": [
        "Weak", "Strong", "Weak", "Weak",
        "Weak", "Strong", "Strong", "Weak",
        "Weak", "Weak", "Strong", "Strong",
        "Weak", "Strong"
    ],

    "Play_Tennis": [
        "No", "No", "Yes", "Yes",
        "Yes", "No", "Yes", "No",
        "Yes", "Yes", "Yes", "Yes",
        "Yes", "No"
    ]
}

df = pd.DataFrame(data)

print("Dataset:")
print(df)
# ---------------------------------------------------
# 2. Convert categorical data into numbers
# ---------------------------------------------------
encoders = {}
for column in df.columns:
    encoder = LabelEncoder()
    df[column] = encoder.fit_transform(df[column])
    encoders[column] = encoder
# ---------------------------------------------------
# 3. Separate input (X) and target (y)
# ---------------------------------------------------
X = df.drop("Play_Tennis", axis=1)
y = df["Play_Tennis"]
# ---------------------------------------------------
# 4. Create Decision Tree using Entropy
# ---------------------------------------------------
model = DecisionTreeClassifier(
    criterion="entropy",
    random_state=42
)
# ---------------------------------------------------
# 5. Train the model
# ---------------------------------------------------
model.fit(X, y)
# ---------------------------------------------------
# 6. Make predictions
# ---------------------------------------------------

y_pred = model.predict(X)
print("\nPredictions:")
print(y_pred)
print("\nActual:")
print(y.values)
# ---------------------------------------------------
# 7. Calculate accuracy
# ---------------------------------------------------
accuracy = accuracy_score(y, y_pred)
print("\nAccuracy:", accuracy)
# ---------------------------------------------------
# 8. Display the Decision Tree
# ---------------------------------------------------

plt.figure(figsize=(15, 8))

plot_tree(
    model,
    feature_names=X.columns,
    class_names=encoders["Play_Tennis"].classes_,
    filled=True
)

plt.title("Decision Tree - Play Tennis")
plt.show()
