#
# zaw-src-git-directories
#
# zaw source for changing directory in git repository
#

function zaw-src-git-directories () {
    _dir=$(git rev-parse --show-cdup 2>/dev/null)
    if [ $? -eq 0 ]; then
        candidates=( $(git ls-files ${_dir} | perl -MFile::Basename -nle \
                       '$a{dirname $_}++; END{delete $a{"."}; print for sort keys %a}') )
    fi

    actions=("zaw-src-git-directories-cd")
    act_descriptions=("change directory in git repository")
}

function zaw-src-git-directories-cd () {
    BUFFER="cd $1"
    zle accept-line
}

zaw-register-src -n git-directories zaw-src-git-directories
