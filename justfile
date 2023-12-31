STUID := env_var_or_default('STUID', "")

LAB2-1_SUBMIT := "submit" / "2.1-Exercise" + "_" + STUID
LAB2-2_SUBMIT := "submit" / "2.2-Exercise" + "_" + STUID
LAB6-1_SUBMIT := "submit" / "6.1-Exercise" + "_" + STUID
LAB6-2_SUBMIT := "submit" / "6.2-Exercise" + "_" + STUID
LAB7-1_SUBMIT := "submit" / "7.1-Exercise" + "_" + STUID
LAB7-2_SUBMIT := "submit" / "7.2-Exercise" + "_" + STUID
LAB7-3_SUBMIT := "submit" / "7.3-Exercise" + "_" + STUID
LAB8-1_SUBMIT := "submit" / "8.1-Exercise" + "_" + STUID
LAB8-2_SUBMIT := "submit" / "8.2-Exercise" + "_" + STUID
LAB9_SUBMIT := "submit" / "9.1-Exercise" + "_" + STUID
LAB10-1_SUBMIT := "submit" / "10.1-MLP Exercise" + "_" + STUID

lab2-1:
    mkdir -p {{LAB2-1_SUBMIT}}
    rm -rf {{LAB2-1_SUBMIT}}/*
    cp "lab2/2.1-Exercise.csv" "{{LAB2-1_SUBMIT}}"
    jupytext "lab2/exercise-holdout.ipynb" --to py:nomarker -o "{{LAB2-1_SUBMIT}}/2.1 exercise-holdout.py"
    jupytext "lab2/exercise-k-fold.ipynb" --to py:nomarker -o "{{LAB2-1_SUBMIT}}/2.2 exercise-k-fold.py"
    jupytext "lab2/exercise-leave-p-out.ipynb" --to py:nomarker -o "{{LAB2-1_SUBMIT}}/2.3 exercise-leave-p-out.py"
    cd submit && zip -r 2.1-Exercise_{{STUID}}.zip 2.1-Exercise_{{STUID}}

lab2-2:
    mkdir -p {{LAB2-2_SUBMIT}}
    rm -rf {{LAB2-2_SUBMIT}}/*
    cp "lab2/2.2-Exercise.csv" "{{LAB2-2_SUBMIT}}"
    jupytext "lab2/linear-regression-lobf.ipynb" --to py:nomarker -o "{{LAB2-2_SUBMIT}}/2.2-Exercise-linear_regression_lobf.py"
    cd submit && zip -r 2.2-Exercise_{{STUID}}.zip 2.2-Exercise_{{STUID}}

lab6-1:
    mkdir -p {{LAB6-1_SUBMIT}}
    rm -rf {{LAB6-1_SUBMIT}}/*
    jupytext "lab6/logistic-regression.ipynb" --to py:nomarker -o "{{LAB6-1_SUBMIT}}/6.1-Exercise-Logistic-Regression.py"
    cd submit && zip -r 6.1-Exercise_{{STUID}}.zip 6.1-Exercise_{{STUID}}

lab6-2:
    mkdir -p {{LAB6-2_SUBMIT}}
    rm -rf {{LAB6-2_SUBMIT}}/*
    cp "lab6/diabetes.csv" "{{LAB6-2_SUBMIT}}"
    jupytext "lab6/decision-tree.ipynb" --to py:nomarker -o "{{LAB6-2_SUBMIT}}/6.2-Exercise-Decision-Tree.py"
    cd submit && zip -r 6.2-Exercise_{{STUID}}.zip 6.2-Exercise_{{STUID}}

lab7:
    mkdir -p {{LAB7-1_SUBMIT}}
    mkdir -p {{LAB7-2_SUBMIT}}
    mkdir -p {{LAB7-3_SUBMIT}}
    cp "lab7/consumer_record.csv" "{{LAB7-1_SUBMIT}}"
    cp "lab7/basketball.csv" "{{LAB7-2_SUBMIT}}"
    cp "lab7/svm_dataset.csv" "{{LAB7-3_SUBMIT}}"
    jupytext "lab7/knn.ipynb" --to py:nomarker -o "{{LAB7-1_SUBMIT}}/7.1-Exercise-Knn.py"
    jupytext "lab7/naive-bayes.ipynb" --to py:nomarker -o "{{LAB7-2_SUBMIT}}/7.2-Exercise-NB.py"
    jupytext "lab7/svm.ipynb" --to py:nomarker -o "{{LAB7-3_SUBMIT}}/7.3-Exercise-linear-SVM.py"
    cd submit && zip -r 7-Exercise_{{STUID}}.zip 7.1-Exercise_{{STUID}} 7.2-Exercise_{{STUID}}
    cd submit && zip -r 7.3-Exercise_{{STUID}}.zip 7.3-Exercise_{{STUID}}

lab8:
    mkdir -p {{LAB8-1_SUBMIT}}
    mkdir -p {{LAB8-2_SUBMIT}}
    cp "lab8/hierarchical-shopping-data.csv" "{{LAB8-1_SUBMIT}}"
    jupytext "lab8/cluster.ipynb" --to py:nomarker -o "{{LAB8-1_SUBMIT}}/8.1.Exercise-hierarchical-clustering.py"
    cp "lab8/iris.data" "{{LAB8-2_SUBMIT}}"
    jupytext "lab8/pca.ipynb" --to py:nomarker -o "{{LAB8-2_SUBMIT}}/8.2.Exercise-PCA.py"
    cd submit && zip -r 8.1-Exercise_{{STUID}}.zip 8.1-Exercise_{{STUID}}
    cd submit && zip -r 8.2-Exercise_{{STUID}}.zip 8.2-Exercise_{{STUID}}

lab9:
    mkdir -p {{LAB9_SUBMIT}}
    rm -rf {{LAB9_SUBMIT}}/*
    cp "lab9/mnist.ipynb" "{{LAB9_SUBMIT}}/IML#Lab9.1 tensorflow minist.ipynb"
    cd submit && zip -r 9.1-Exercise_{{STUID}}.zip 9.1-Exercise_{{STUID}}

lab10-1:
    mkdir -p "{{LAB10-1_SUBMIT}}"
    rm -rf "{{LAB10-1_SUBMIT}}/*"
    cp "lab10/fashion-mnist.ipynb" "{{LAB10-1_SUBMIT}}/IML#Lab10.1 tensorflow fashion minist.ipynb"
    cd submit && zip -r "10.1-MLP Exercise_{{STUID}}.zip" "10.1-MLP Exercise_{{STUID}}"

clean-submit:
    rm -rf submit/*