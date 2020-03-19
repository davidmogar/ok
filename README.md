<p align="center"><img height="250" src="https://github.com/davidmogar/ok/blob/resources/ok.png?raw=true"></p>

<p align="center"><strong>An Ansible playbook to configure an Arch Linux workstation</strong></p>
<p align="center">
  <a href="#usage">Usage</a> •
  <a href="#roles">Roles</a> •
  <a href="#license">License</a>
</p>
<h1></h1>

This Ansible playbook installs and maintain all the packages and dotfiles I use in my development environment. It is based on roles and prepared to work over a fresh Arch Linux installation.

## Usage

The following command is all you need to have it ready to roll:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/davidmogar/ok/master/ok.sh)"
```

And in case of using wget:

```sh
sh -c "$(wget -O- https://raw.githubusercontent.com/davidmogar/ok/master/ok.sh)"
```

### Applying a specific profile and/or tag

A specific profile can be applied by setting the `PROFILE` variable before the bootstraping commands. The definition of these profiles can be found in the `host_vars` directory. If no profile is specified, the [generic profile](host_vars/generic.yml) will be applied. The following example shows how to use this variable:

```sh
PROFILE=zoidberg sh -c "$(curl -fsSL https://raw.githubusercontent.com/davidmogar/ok/master/ok.sh)"
```

It is also possible to run only specifc parts by using the `--tags` options. For example, the following command will only run the bootstrap tasks, which will prepare the repositories and install some required packages:

```sh
PROFILE=zoidberg TAGS=bootstrap sh -c "$(curl -fsSL https://raw.githubusercontent.com/ok/dotfiles/master/ok.sh)"
```

### Running the playbook manually

Once the system has been bootstrapped, a copy of the git repository will be placed in `${HOME}/.ansible/dotfiles`. To apply the playbook manually from that repository, execute the following commands:

```sh
cd ~/.ansible/dotfiles
git pull origin master
ansible-playbook -i inventory playbook.yml --diff [--limit PROFILE] [--tags TAGS] --ask-become-pass
```

Note that both, limit and tags, are optional arguments.

## Roles

<table>
  <thead>
    <tr>
      <th align="left" width="200">Name</th>
      <th align="left">Description</th>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>

## License

This project is under the GNU General Public License v3.0. Check [LICENSE](https://github.com/davidmogar/dotfiles/blob/master/LICENSE) file to see the full text full text.
