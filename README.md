<p align="center"><img height="250" src="https://github.com/davidmogar/ok/blob/resources/ok-min.png?raw=true"></p>

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
    <tr>
      <td>alacritty<a href="roles/alacritty"></a></td>
      <td>Installs <a href="https://github.com/alacritty/alacritty">Alacritty</a>.</td>
    </tr>
    <tr>
      <td>aur<a href="roles/aur"></a></td>
      <td>Manages the installation of <a href="https://aur.archlinux.org/">AUR</a> packages.</td>
    </tr>
    <tr>
      <td>bspwm<a href="roles/bspwm"></a></td>
      <td>Installs <a href="https://github.com/baskerville/bspwm">bspwm</a> and set up the wallpaper by using <a href="https://github.com/derf/feh">feh</a>.</td>
    </tr>
    <tr>
      <td>chromium<a href="roles/chromium"></a></td>
      <td>Installs <a href="https://www.chromium.org/">Chromium</a>.</td>
    </tr>
    <tr>
      <td>cht-sh<a href="roles/cht-sh"></a></td>
      <td>Installs <a href="https://github.com/chubin/cheat.sh">cheat.sh</a>'s CLI.</td>
    </tr>
    <tr>
      <td>cli-utilities<a href="roles/cli-utilities"></a></td>
      <td>Installs a curated <a href="roles/cli-utilities/vars/main.yml">list</a> of CLI utilities.</td>
    </tr>
    <tr>
      <td>cursor<a href="roles/cursor"></a></td>
      <td>Installs and configures the default cursor.</td>
    </tr>
    <tr>
      <td>fonts<a href="roles/fonts"></a></td>
      <td>Installs a curated <a href="roles/fonts/vars/main.yml">list</a> of fonts.</td>
    </tr>
    <tr>
      <td>gtk<a href="roles/gtk"></a></td>
      <td>Installs <a href="">gtk3</a> and the default theme.</td>
    </tr>
    <tr>
      <td>mirrorlist<a href="roles/mirrorlist"></a></td>
      <td>Configures pacman's mirrorlist by using <a href="https://wiki.archlinux.org/index.php/Reflector">Reflector</a>.</td>
    </tr>
    <tr>
      <td>neovim<a href="roles/neovim"></a></td>
      <td>Installs <a href="https://neovim.io/">Neovim</a>.</td>
    </tr>
    <tr>
      <td>notifications<a href="roles/notifications"></a></td>
      <td>Configures system notifications to use <a href="https://github.com/dunst-project/dunst">dunst</a>. The flag <a href="chrome://flags/#enable-native-notifications">enable-native-notifications</a> is required to get native notifications with Chromium.</td>
    </tr>
    <tr>
      <td>picom<a href="roles/picom"></a></td>
      <td>Installs <a href="https://github.com/yshui/picom">picom</a> compositor.</td>
    </tr>
    <tr>
      <td>polybar<a href="roles/polybar"></a></td>
      <td>Installs <a href="https://github.com/polybar/polybar">polybar</a>.</td>
    </tr>
    <tr>
      <td>rofi<a href="roles/rofi"></a></td>
      <td>Installs <a href="https://github.com/davatorium/rofi"></a>.</td>
    </tr>
    <tr>
      <td>spotify<a href="roles/spotify"></a></td>
      <td>Installs <a href="https://www.spotify.com/">Spotify</a>.</td>
    </tr>
    <tr>
      <td>sudo<a href="roles/sudo"></a></td>
      <td>Configures sudoers file.</td>
    </tr>
    <tr>
      <td>sxhkd<a href="roles/sxhkd"></a></td>
      <td>Installs <a href="https://github.com/baskerville/sxhkd">sxhkd</a> and sets key bindings.</td>
    </tr>
    <tr>
      <td>user<a href="roles/user"></a></td>
      <td>Manages the creation of users.</td>
    </tr>
    <tr>
      <td>vscode<a href="roles/vscode"></a></td>
      <td>Installs <a href="https://code.visualstudio.com/">VS Code</a>.</td>
    </tr>
    <tr>
      <td>xdg-user-dirs<a href="roles/xdg-user-dirs"></a></td>
      <td>Configures default directories, allowing to point them to external volumes.</td>
    </tr>
    <tr>
      <td>xorg<a href="roles/xorg"></a></td>
      <td>Installs <a href="https://www.x.org/wiki">Xorg</a>.</td>
    </tr>
  </tbody>
</table>

## License

This project is under the GNU General Public License v3.0. Check [LICENSE](https://github.com/davidmogar/dotfiles/blob/master/LICENSE) file to see the full text full text.
