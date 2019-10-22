pip list
pip show
pip install --user

python3 -m venv docker && source docker/bin/activate
pip install docker azure
pip freeze docker_azure.txt
deactivate

python3 -m venv docker_dev && source docker/bin/activate
pip install -r docker_azure.txt

