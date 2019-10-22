import os

print('OS: ' + os.name)
print('OS full: ' + os.uname())
print('user: ' + os.getlogin())
print('PID: ' + str(os.getpid()))
print('listdir:\n')
os.listdir()
print('system:\n')
os.system('ls')
