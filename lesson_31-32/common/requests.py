import requests

response = requests.get('https://api.github.com')

response.status_code
response.content
response.text
json_response = response.json()
type(json_response)
json_response.keys()
json_response['authorizations_url']

response = requests.get('https://api.github.com/search/repositories', params={'q': 'requests+language:python'})
json_response = response.json()
repository = json_response['items'][0]
print('Repository name: ' + repository["name"])   # Python 3.6+
print(f'Repository description: {repository["description"]}')  # Python 3.6+
