import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

np.set_printoptions(precision=3, suppress=True)

import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
# from tensorflow.compat.v2.keras.layers.experimental import preprocessing


column_names = ["ratio",        # label is the output predicted
                "maximum",      # S+PGW maximum simultaneously active bearers (number)s
                "success",      # S+PGW successful bearer creations (times)
                "uplink",       # S1-U uplink user traffic in KB (kB)
                "downlink"]     # S1-U downlink user traffic in KB (kB)


raw_dataset = pd.read_csv("final_ds.csv",
                            names=column_names)

dataset = raw_dataset.copy()
# print(len(dataset["ratio"].unique().tolist()))
dataset = pd.get_dummies(dataset, prefix='', prefix_sep='')
print(dataset.tail())

# split dataset into train and test set
train = dataset.sample(frac=0.8, random_state=0)
test = dataset.drop(train.index)

# inspectation of data
df = train[['maximum', "success", "uplink", "downlink"]]

sns.pairplot(df)
