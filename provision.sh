#!/usr/bin/env bash

fix_lc_all_for_bash_rc() {
    BASH_RC_PATH="$1"
    if ! grep --quiet "LC_ALL" "$BASH_RC_PATH" ; then
	logger --stderr "Setting LC_ALL=C in ${BASH_RC_PATH}"
	echo "export LC_ALL=C" >> "${BASH_RC_PATH}"
    fi
}

setup_pip() {
    apt-get install -y python-pip
    pip install --upgrade pip
}

install_pips() {
    pip install NumPy
    pip install SciPy
    pip install scikit-learn
}

apt-get update

fix_lc_all_for_bash_rc /root/.bashrc
fix_lc_all_for_bash_rc /home/ubuntu/.bashrc

setup_pip
install_pips

