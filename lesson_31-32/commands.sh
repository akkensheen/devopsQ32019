pip3 list --format=columns

python3 -m venv docker && source docker/bin/activate
pip3 install docker azure
pip3 show docker
pip3 freeze > ~/docker_azure.txt
deactivate

python3 -m venv docker_dev && source docker_dev/bin/activate
pip3 install -r ~/docker_azure.txt
deactivate

pip3 install --user pipenv
PATH=~/.local/bin:$PATH
pip3 show pipenv
mkdir pipenv && cd pipenv && pipenv install requests
cat > curl.py <<EOF
import requests
response = requests.get('https://httpbin.org/ip')
print('Your IP is {0}'.format(response.json()['origin']))
EOF
pipenv run python curl.py
pipenv graph
pipenv shell
pip3 install docker && exit
pipenv clean

cd ~
cp -r pipenv/ pipenv_dev/ && cd pipenv_dev/ && pipenv install
pipenv run python curl.py
pipenv graph