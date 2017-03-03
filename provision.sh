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

setup_swiss_german_locale() {
    locale-gen de_CH.UTF-8
}

apt-get update

fix_lc_all_for_bash_rc /root/.bashrc
fix_lc_all_for_bash_rc /home/ubuntu/.bashrc

setup_pip
install_pips
setup_swiss_german_locale
