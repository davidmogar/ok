<p align="center"><img height="250" src="https://github.com/davidmogar/ok/blob/resources/ok-min.png?raw=true"></p>

<p align="center"><strong>An Ansible playbook to configure an Arch Linux workstation</strong></p>
<p align="center">
  <a href="#usage">Usage</a> •
  <a href="#roles">Roles</a> •
  <a href="#roles">Theming</a> •
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
      <td><a href="roles/alacritty">alacritty</a></td>
      <td>Installs <a href="https://github.com/alacritty/alacritty">Alacritty</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/aur">aur</a></td>
      <td>Manages the installation of <a href="https://aur.archlinux.org/">AUR</a> packages.</td>
    </tr>
    <tr>
      <td><a href="roles/bspwm">bspwm</a></td>
      <td>Installs <a href="https://github.com/baskerville/bspwm">bspwm</a> and set up the wallpaper by using <a href="https://github.com/derf/feh">feh</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/chromium">chromium</a></td>
      <td>Installs <a href="https://www.chromium.org/">Chromium</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/cht-sh">cht-sh</a></td>
      <td>Installs <a href="https://github.com/chubin/cheat.sh">cheat.sh</a>'s CLI.</td>
    </tr>
    <tr>
      <td><a href="roles/cli-utilities">cli-utilities</a></td>
      <td>Installs a curated <a href="roles/cli-utilities/vars/main.yml">list</a> of CLI utilities.</td>
    </tr>
    <tr>
      <td><a href="roles/cursor">cursor</a></td>
      <td>Installs and configures the default cursor.</td>
    </tr>
    <tr>
      <td><a href="roles/dunst">dunst</a></td>
      <td>Configures system notifications to use <a href="https://github.com/dunst-project/dunst">dunst</a>. The flag <a href="chrome://flags/#enable-native-notifications">enable-native-notifications</a> is required to get native notifications with Chromium.</td>
    </tr>
    <tr>
      <td><a href="roles/fonts">fonts</a></td>
      <td>Installs a curated <a href="roles/fonts/vars/main.yml">list</a> of fonts.</td>
    </tr>
    <tr>
      <td><a href="roles/gtk">gtk</a></td>
      <td>Installs <a href="">gtk3</a> and the default theme.</td>
    </tr>
    <tr>
      <td><a href="roles/lastpass">lastpass</a></td>
      <td>Installs <a href="https://github.com/lastpass/lastpass-cli">lastpass-cli</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/mirrorlist">mirrorlist</a></td>
      <td>Configures pacman's mirrorlist by using <a href="https://wiki.archlinux.org/index.php/Reflector">Reflector</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/neofetch">neofetch</a></td>
      <td>Installs <a href="https://github.com/dylanaraps/neofetch">neofetch</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/neovim">neovim</a></td>
      <td>Installs <a href="https://neovim.io/">Neovim</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/picom">picom</a></td>
      <td>Installs <a href="https://github.com/yshui/picom">picom</a> compositor.</td>
    </tr>
    <tr>
      <td><a href="roles/polybar">polybar</a></td>
      <td>Installs <a href="https://github.com/polybar/polybar">polybar</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/qutebrowser">qutebrowser</a></td>
      <td>Installs <a href="https://qutebrowser.org/">qutebrowser</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/rofi">rofi</a></td>
      <td>Installs <a href="https://github.com/davatorium/rofi">rofi</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/sound">sound</a></td>
      <td>Installs packages to manage system's sound.</td>
    </tr>
    <tr>
      <td><a href="roles/spotify">spotify</a></td>
      <td>Installs <a href="https://www.spotify.com/">Spotify</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/sudo">sudo</a></td>
      <td>Configures sudoers file.</td>
    </tr>
    <tr>
      <td><a href="roles/sxhkd">sxhkd</a></td>
      <td>Installs <a href="https://github.com/baskerville/sxhkd">sxhkd</a> and sets key bindings.</td>
    </tr>
    <tr>
      <td><a href="roles/user">user</a></td>
      <td>Manages the creation of users.</td>
    </tr>
    <tr>
      <td><a href="roles/vifm">vifm</a></td>
      <td>Installs <a href="https://vifm.info/">vifm</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/vscode">vscode</a></td>
      <td>Installs <a href="https://code.visualstudio.com/">VS Code</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/xdg-user-dirs">xdg-user-dirs</a></td>
      <td>Configures default directories, allowing to point them to external volumes.</td>
    </tr>
    <tr>
      <td><a href="roles/xorg">xorg</a></td>
      <td>Installs <a href="https://www.x.org/wiki">Xorg</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/zathura">zathura</a></td>
      <td>Installs <a href="https://pwmt.org/projects/zathura/">zathura</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/zsh">zsh</a></td>
      <td>Installs <a href="https://www.zsh.org/">zsh</a> along with <a href="https://github.com/zsh-users/zsh-autosuggestions">autosuggestions</a> and <a href="https://github.com/zsh-users/zsh-syntax-highlighting">syntax-highlighting</a> plugins.</td>
    </tr>
  </tbody>
</table>

## Theming

Some of the roles defined above allow to change their theme, affecting the look of the installed applications. This theme can be selected by defining an existing value for the `theme` variable:

```yaml1
theme: dmg_blue
```

The list of available themes can be checked by listing the files inside the `files/themes` directory in any customizable role such as <a href="roles/alacritty">alacritty</a>.

## License

This project is under the GNU General Public License v3.0. Check [LICENSE](https://github.com/davidmogar/ok/blob/master/LICENSE) file to see the full text full text.
