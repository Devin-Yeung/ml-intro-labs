STUID := env_var_or_default('STUID', "")

LAB2-1_SUBMIT := "submit" / "2.1-Exercise" + "_" + STUID
LAB2-2_SUBMIT := "submit" / "2.2-Exercise" + "_" + STUID
LAB6-1_SUBMIT := "submit" / "6.1-Exercise" + "_" + STUID
LAB6-2_SUBMIT := "submit" / "6.2-Exercise" + "_" + STUID

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

clean-submit:
    rm -rf submit/*