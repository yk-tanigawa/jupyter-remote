# Jupyter-remote
This is a helper scripts to connect jupyter-notebook running at a remote server.

Author: Yosuke Tanigawa

# How to use Jupyter notebook at remote

## case 1) there is no log-in server
This is a case where you can directly ssh-into your server and can run jupyter-notebook there.

1. start jupyter notebook at remote
  - `local_computer $ ssh your_server`
  - `your_server $ jupyter notebook`
  - It's better to use GNU screen or tmux on your server
1. open a new terminal window and connect to your server (port transfer)
  - `local_computer $ bash jupyter-remote.sh your_server`
1. open `localhost:18888` in your web browser
  - you can change the port number to other port by passing additional arg to the script

## case 2) there is a log-in server
In this case you are connecting to your server (computing node) through a log-in node

1. start jupyter at computin node
  - `local_computer $ ssh login_node`
  - `login_node $ sdev` or `login_node $ qlogin`
  - `computing_node $ jupyter notebook`
  - Use GNU screen or tmux on log-in node
1. open a new terminal window and connect to your computing node
  - `local_computer $ bash jupyter-remote-login.sh computing_node login_node`
1. open `localhost:18888` in your web browser

