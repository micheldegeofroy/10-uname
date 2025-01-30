#!/bin/sh

if [ `whoami` != "root" ]; then
  echo "Run as sudo to update your motd."
  exit 1
fi

MOTD_DIR=/etc/update-motd.d/

mkdir -p "${MOTD_DIR}"
wget -qN 'https://gist.githubusercontent.com/micheldegeofroy/18b23955d3785c5b9e3754fc3dd37f49/raw/c9ebf744372325e8b5c42f271fb046a6eebcaf14/10-uname' -P "${MOTD_DIR}"
wget -qN 'https://gist.githubusercontent.com/micheldegeofroy/18b23955d3785c5b9e3754fc3dd37f49/raw/1a8a69a826aef454ebf38c838f3b06e0c98b16b9/20-raspberry-bitcoin' -P "${MOTD_DIR}"
#wget -qN 'https://gist.githubusercontent.com/micheldegeofroy/18b23955d3785c5b9e3754fc3dd37f49/raw/682b00c5c7703fb2d0db2012773ac2bc0b4782a5/23-raspberry-lnd' -P "${MOTD_DIR}"
#wget -qN 'https://gist.githubusercontent.com/micheldegeofroy/18b23955d3785c5b9e3754fc3dd37f49/raw/682b00c5c7703fb2d0db2012773ac2bc0b4782a5/26-raspberry-lightning' -P "${MOTD_DIR}"
wget -qN 'https://gist.githubusercontent.com/micheldegeofroy/18b23955d3785c5b9e3754fc3dd37f49/raw/682b00c5c7703fb2d0db2012773ac2bc0b4782a5/30-swap-warning' -P ${MOTD_DIR}

chmod +x "${MOTD_DIR}10-uname" "${MOTD_DIR}20-raspberry-bitcoin" "${MOTD_DIR}30-swap-warning"
#chmod +x "${MOTD_DIR}10-uname" "${MOTD_DIR}20-raspberry-bitcoin" "${MOTD_DIR}23-raspberry-lnd" "${MOTD_DIR}26-raspberry-lightning" "${MOTD_DIR}30-swap-warning"

run-parts --lsbsysinit /etc/update-motd.d
