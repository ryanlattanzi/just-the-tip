#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Dec  6 11:43:39 2018

@author: ryanlattanzi
"""
import pandas as pd
import numpy as np
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.svm import SVC
from sklearn.naive_bayes import GaussianNB, BernoulliNB
from random import randint
from sklearn.model_selection import GridSearchCV
from xgboost import XGBClassifier
#import warnings
#warnings.filterwarnings("ignore")

def cleandat(train,test):
    
    x_train = train.loc[:, train.columns != "tip_amount"]
    x_train.drop(['tip_class'], axis=1, inplace=True)
    y_train = train.loc[:, train.columns == "tip_class"]
    
    x_test = test.loc[:, test.columns != "tip_amount"]
    x_test.drop(['tip_class'], axis=1, inplace=True)
    
    y_test = test.loc[:, test.columns == "tip_class"]
    y = y_test['tip_class'].values.tolist()
    
    return x_train,y_train,x_test,y


def accuracies(classifiers,parameters,x_train,x_test,y_train,y):
    
    accuracies = []
    results = np.zeros(shape=(len(y),len(classifiers)))
    
    # Gathering predictions and accuracies for each model
    j = 0
    for model in classifiers:
        print(j)
        # Training
        mod = model
        
        clf = GridSearchCV(mod, parameters[j])
        
        print("fitting model")
        clf.fit(x_train,y_train.values.ravel())
        print("Best parameter: ",clf.best_params_)
        
        # Test
        print("predicting")
        res = clf.predict(x_test)
        print(res[0:10])
        res = [c for c in res]
        results[:, j] = res
        j += 1
        
        # Compute Accuracies
        print("computing accuracies")
        acc = 0
        i = 0
        for item in res:
            if (res[i] == y[i]):
                acc += 1
            i += 1
                
        acc = acc/len(res)
        accuracies.append(acc)
    
    
    return results, y, accuracies

def NB(x_train,x_test,y_train,y):
    

    gau = GaussianNB()
    ber = BernoulliNB()
    
    ctstrain = x_train.iloc[:,0:11]
    ctstest = x_test.iloc[:,0:11]
    
    cattrain = x_train.iloc[:,11:30]
    cattest = x_test.iloc[:,11:30]
    
    gau.fit(ctstrain,y_train.values.ravel())
    ber.fit(cattrain,y_train.values.ravel())
    
    predprobs = gau.predict_proba(ctstest)
    predprobss = ber.predict_proba(cattest)
    
    probs = np.multiply(predprobs,predprobss)
    
    preds = []
    
    for i in probs:
        i.tolist()
        index_min = np.argmax(i)
        preds.append(index_min+1)

    acc = 0
    i = 0
    for item in preds:
        if (preds[i] == y[i]):
            acc += 1
        i += 1
            
    acc = acc/len(preds)
    print("NB Accuracy: ",acc)
    
    
        
def Ensemble(results,y):
    # Ensemble Part
    print("ensemble part")
    
    ensemble_res = []
    for row in results:
        cl1 = 0
        cl2 = 0
        cl3 = 0
        cl4 = 0
        for item in row:
            if (item == 1):
                cl1 += 1
            elif (item == 2):
                cl2 += 1
            elif (item == 3):
                cl3 += 1
            elif (item == 4):
                cl4 += 1
                
        classes = [cl1,cl2,cl3,cl4]
        temp = set(classes)
        if len(temp) == 1:
            r = randint(1,4)
            vote = r
            ensemble_res.append((vote))
        else:
            vote = classes.index(max(classes))
            ensemble_res.append((vote+1))
    
    # Accuracy of ensemble
    
    accur = 0
    for k in range(len(ensemble_res)):
        if (ensemble_res[k] == y[k]):
            accur += 1
            
    accur = accur/len(ensemble_res)
    print("Ensemble accuracy: " + str(accur))
    

classifier1 = KNeighborsClassifier()
param1 = {'n_neighbors':[3,5,7]}

classifier2 = DecisionTreeClassifier()
param2 = {}

classifier3 = SVC(gamma = "scale")
param3 = {'C':[1,10],'kernel':('linear','rbf')}

classifier4 = XGBClassifier()
param4 = {}

classifiers = [classifier1, classifier2, classifier3, classifier4]
parameters = [param1,param2,param3,param4]


trai = pd.read_csv("Training.csv")
tes = pd.read_csv("Testing.csv")
train = trai.drop(['Unnamed: 0'], axis=1)
test = tes.drop(['Unnamed: 0'], axis=1)


x_train,y_train,x_test,y = cleandat(train,test)
results, y, accuracies = accuracies(classifiers,parameters,x_train,x_test,y_train,y)
print("Accuracies for classifiers: ",accuracies)
Ensemble(results,y)
NB(x_train,x_test,y_train,y)


    
    
    
    
    