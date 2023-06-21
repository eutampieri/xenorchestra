#!/bin/bash

xo_branch="master"
xo_server="https://github.com/vatesfr/xen-orchestra"
xo_server_dir="/opt/xen-orchestra"
systemd_service_dir="/lib/systemd/system"
xo_service="xo-server.service"

cd /opt

/usr/bin/git clone -b $xo_branch $xo_server

cd $xo_server_dir
/usr/bin/yarn
/usr/bin/yarn build

cd packages/xo-server
cp sample.config.toml .xo-server.toml

dest=/usr/local/lib/node_modules/
#Create node_modules directory if doesn't exist
mkdir -p $dest

# Plugins to ignore
ignoreplugins=("xo-server-test")

# Symlink all plugins
for source in $(ls -d /opt/xen-orchestra/packages/xo-server-*); do
  plugin=$(basename $source)
  if [[ "${ignoreplugins[@]}" =~ $plugin ]]; then
      echo "Ignoring $plugin plugin"
  else
      ln -s "$source" "$dest"
    fi
done

echo ""
echo ""
echo "Installation complete, open a browser to:" && hostname -I && echo "" && echo "Default Login:"admin@admin.net" Password:"admin"" && echo "" && echo "Don't forget to change your password!"

