# File: test_sample.py
# 
# Use pytest command to run tests like this.
# pytest will identify all test_XXX methods and will execute them as part of testing job

def inc(x):
    return x + 1

def test_answer_rigth():
    assert inc(3) == 4

def test_answer_wrong():
    assert inc(3) == 5
