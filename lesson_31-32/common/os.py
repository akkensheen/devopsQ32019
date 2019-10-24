import os

print('OS: ' + os.name)
print('OS full: ' + os.uname())
print('user: ' + os.getlogin())
print('PID: ' + str(os.getpid()))
print('listdir:\n')
os.listdir()
print('system:\n')
os.system('ls')
import os

print('OS: ' + os.name)
print('OS full: ' + str(os.uname()))
print('user: ' + os.getlogin())
print('PID: ' + str(os.getpid()))
print('listdir:')
os.listdir()
print('system:')
os.system('ls')

os.getcwd()
os.path.abspath('folder')
os.path.basename('/home/amuratov/pipenv')
os.path.exists('/home/amuratov/pipenv')

os.access('/home/amuratov/devopsQ32019/README.md', os.W_OK)
os.chmod('/home/amuratov/',400)
os.access('/home/amuratov/devopsQ32019/README.md', os.W_OK)
