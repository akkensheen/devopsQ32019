import docker

client = docker.from_env()
client.containers.run("ubuntu", "echo hello world")
client.containers.run("bfirsh/reticulate-splines", detach=True)

client.containers.list()
container = client.containers.get('')
container.attrs['Config']['Image']
container.logs()
container.stop()

for line in container.logs(stream=True):
    print line.strip()

client.images.pull('nginx')
client.images.list()