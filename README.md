
**  (c) 2020
# Implementation of LTE traffic network forecasting.
Language used : Python, Javascript and QML
Framework used: Qt
OS: Ubuntu 18.04 LTS.

### Facts
#### Main job: Use traffic property during a month to forecast a next day, week or month traffic behavior. All this, using LTSM, and Artificial neural network.
Normaly this was possible after preprocess the main dataset (PKI data). The properties are uplink user traffic in KB, downlink user traffic in KB, ratio, successful bearer creations, start time and maximum simultaneously active bearers.

### Step to train the forecaster:
#### 1. generate a window
#### 2. split the window into input and label
#### 3. parse the dataset to window:
the output of this operation will separate, train_df, test_df, and val_df. Train_df as training dataset, test_df as testing dataset and val_df as validation set.
#### 4. compmile and fit the model toward the window
#### 5. visualise the output of the forecast.




@author: Bayangmbe Mounmo
