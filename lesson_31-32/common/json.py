import json

json_sting = json.dumps([{'docker': '/lib/docker'}, {'docker_env': {'runtime': 'nvidia', 'cpu_limit': 2}}], sort_keys=True, indent=4)
type(json_sting)
json_sting[0]
print(json_sting)
py_obj = json.loads(json_sting)
type(py_obj)
py_obj[0]['docker']
