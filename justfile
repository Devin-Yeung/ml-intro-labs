STUID := env_var_or_default('STUID', "")

lab2-1:
    mkdir -p submit/2.1-Exercise_{{STUID}}
    cp "lab2/2.1-Exercise.csv" "submit/2.1-Exercise_{{STUID}}"
    jupytext "lab2/exercise-holdout.ipynb" --to py:nomarker -o "submit/2.1-Exercise_{{STUID}}/2.1 exercise-holdout.py"
    jupytext "lab2/exercise-k-fold.ipynb" --to py:nomarker -o "submit/2.1-Exercise_{{STUID}}/2.2 exercise-k-fold.py"
    jupytext "lab2/exercise-leave-p-out.ipynb" --to py:nomarker -o "submit/2.1-Exercise_{{STUID}}/2.3 exercise-leave-p-out.py"

lab2-2:
    mkdir -p submit/2.2-Exercise_{{STUID}}
    cp "lab2/2.2-Exercise.csv" "submit/2.2-Exercise_{{STUID}}"
    jupytext "lab2/linear-regression-lobf.ipynb" --to py:nomarker -o "submit/2.2-Exercise_{{STUID}}/2.2-Exercise-linear_regression_lobf.py"
