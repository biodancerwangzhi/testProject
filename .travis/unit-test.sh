#!/bin/bash

set -e
errors=0

# Run unit tests
python testProject/testProject_test.py || {
    echo "'python python/testProject/testProject_test.py' failed"
    let errors+=1
}

# Check program style
pylint -E testProject/*.py || {
    echo 'pylint -E testProject/*.py failed'
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : Python specific tests"
