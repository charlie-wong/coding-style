#!/usr/bin/env bash
# This script is used for release, make it automaically and simple.

release_version=""

# This is some thing wrong, to exit
function die_with_error()
{
    printf "[$(date +'%Y-%m-%d %H:%M:%S%z')]: $@\n" >&2
    exit 1;
}

# check version info before release
function check_version_info()
{
    if [[ ! -f "conf.py" ]]; then
        die_with_error "sphinx configuration file not exist: conf.py"
    fi

    local release=$(cat conf.py | grep 'release = u') # release = u'x.x.x'
    local version=$(cat conf.py | grep 'version = u') # version = u'x.x.x'

    release=${release:12} # x.x.x'
    version=${version:12}

    release=${release/\'/''} # x.x.x
    version=${version/\'/''}

    if [[ "${release}" != "${version}" ]]; then
        die_with_error "Version error: release=${release}, version=${version}"
    fi

    if [[ -z "${release}" ]]; then
        die_with_error "Version error: version info not set."
    fi

    release_version=${release}
}

# build release of html & pdf
function release_build()
{
    make clean    # clean up project

    make html     # build html version
    if [[ "$?" != "0" ]]; then
        die_with_error "Release build error: make html"
    fi

    make latexpdf # build pdf  version
    if [[ "$?" != "0" ]]; then
        die_with_error "Release build error: make latexpdf"
    fi
}

function do_git_commit()
{

    local is_cur_repo_clean=$(git diff)

    if [[ ! -z "${is_cur_repo_clean}" ]]; then
        git reset HEAD
        die_with_error "Current git repo is not clean."
    fi

    local commit_msg="Release Version: v${release_version}"
    local tag_name="v${release_version}"

    git tag -a "${tag_name}" -m "${commit_msg}"
    if [[ "$?" != "0" ]]; then
        die_with_error "Release tag error: ${tag_name}"
    fi

    clear
    echo ""
    echo ""
    echo "Release Version: ${release_version}"
    echo "    Release tag: ${tag_name}"
    echo "         Update: Read the Docs"
}

# the entry point of this script
function main()
{
    check_version_info
    release_build
    do_git_commit
}

main "$@"
