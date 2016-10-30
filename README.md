# vagrant-ansible
It's very simple configuration to setup your local development environment on top of vagrant, virtualbox and ansible.

### Getting Started

  1. Download and Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  2. Download and Install [Vagrant](https://www.vagrantup.com/downloads.html)
  3. Create D:\vbox and D:\vbox\data to share some files between guests and host system.
  4. Clone this and cd into the directory containing the `Vagrantfile` (i.e. D:\vbox\vagrant-ansible) 
  5. Type `vagrant up` in command prompt
     Vagrant will create new VM and configure it.

Enjoy. :sparkles: :camel: :boom:

### More Advanced

If you use 'Git for Windows', check below files:

````bash
(host)$ cat ~/.bashrc
export VAGRANT_DETECTED_OS=cygwin

(host)$ cat ~/.bash_profile
if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi
````

To disable auto crlf conversion in windows,
````bash
(host)$ git config --global core.autocrlf false
````

In case you want to create a box image after all are set,
````
(guest)$ sudo apt-get clean
(guest)$ cat /dev/null > ~/.bash_history && history -c && exit
(host)$ vagrant package --output mynew.box
(host)$ vagrant box add --force my-new-box-name mynew.box
````

Troubleshootings,
> Sometimes it is better to `vagrant up` first and do some manual changes (network and provision issues) and then, do `vagrant provision or, vagrant reload --provision` seperately. 

