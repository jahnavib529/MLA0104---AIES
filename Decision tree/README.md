START

IMPORT pandas
IMPORT matplotlib
IMPORT LabelEncoder
IMPORT DecisionTreeClassifier
IMPORT plot_tree
IMPORT accuracy_score


CREATE the Play Tennis dataset

CREATE a DataFrame from the dataset

DISPLAY the dataset


FOR each column in the dataset:
    Create a Label Encoder
    Convert categorical values into numerical values
    Store the encoder


SEPARATE the dataset into:

    X = input attributes
        Outlook
        Temperature
        Humidity
        Wind

    y = target attribute
        Play_Tennis


CREATE a Decision Tree Classifier

SET the splitting criterion to ENTROPY


TRAIN the Decision Tree using X and y


USE the trained tree to predict values

DISPLAY the predicted values

DISPLAY the actual values


CALCULATE the accuracy

DISPLAY the accuracy


CREATE a graph of the Decision Tree

DISPLAY:
    Feature names
    Class names
    Decision nodes
    Child nodes
    Yes/No leaf nodes


END
