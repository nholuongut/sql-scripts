#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$srcdir"

if ! type -P mysql_test_scripts.sh &>/dev/null ||
   ! type -P mariadb_test_scripts.sh &>/dev/null ||
   ! type -P postgres_test_scripts.sh &>/dev/null; then
    # downloads and builds DevOps-Bash-tools repo in $PWD/bash-tools - this is where the postgres/mysql/mariadb boot + test scripts are
    curl https://raw.githubusercontent.com/HariSekhon/DevOps-Bash-tools/master/setup/bootstrap.sh | sh
fi

export PATH="$PATH:$srcdir/bash-tools"

# if this exists it means we bootstrapped above because the tools weren't in the $PATH
if [ -d "bash-tools" ]; then
    pushd bash-tools
    make update2
    popd
    echo
fi

hr(){
    echo
    echo "# ============================================================================ #"
    echo
}

echo
if [ $# -eq 0 ] || [[ "$*" =~ mysql ]]; then
    mysql_test_scripts.sh
    hr
fi
if [ $# -eq 0 ] || [[ "$*" =~ postgres ]]; then
    postgres_test_scripts.sh
    hr
fi
if [ $# -eq 0 ] || [[ "$*" =~ maria ]]; then
    mariadb_test_scripts.sh
    hr
fi
