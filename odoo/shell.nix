{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
    name = "odoo-env";
    targetPkgs = pkgs: (with pkgs; [
        fish
        git
        tig
        gcc
        python310
        python310Packages.pip
        python310Packages.virtualenv
        python310Packages.wheel
        postgresql
        openldap.dev
        cyrus_sasl.dev
    ]);
    profile = ''
        python -m venv --prompt odoo ~/.venv/odoo
    '';
    runScript = ''
        fish --init-command="source ~/.venv/odoo/bin/activate.fish"
    '';
}).env
