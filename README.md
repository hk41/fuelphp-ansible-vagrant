#fuelphp-ansible-vagrant

## how to use

### common
* ansible/vars/all.yml
blackfire.server_id, blackfire.server_tokenを入力
github.oauth_okenを入力

### mac
* vagrant up

### windows
* Vagrantfile.winをVagrantにリネーム
* smbを利用する場合はansible/development_local.ymlに記載された- sambaを有効にする
* vagrant up
