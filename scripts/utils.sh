#!/usr/bin/env bash

########################
# detect platform type #
########################

function hostSystem()
{
    local uname_output=$(uname);

    local platform="Windows";
    [ "${uname_output}" = "Linux" ]  && platform="Linux";
    [ "${uname_output}" = "Darwin" ] && platform="MacOS";

    echo "${platform}";
}

function hostIsWindows()
{
    test $(hostSystem) = "Windows";
}

function hostIsLinux()
{
    test $(hostSystem) = "Linux";
}

function hostIsMacos()
{
    test $(hostSystem) = "MacOS";
}

# Example Usage
function usage_example_hostAPIs()
{
    hostOS=$(hostSystem);
    echo "Host system is: [${hostOS}]";
    if hostIsWindows; then
        echo "do stuff for windows";
    elif hostIsLinux; then
        echo "do stuff for linux";
    elif hostIsMacos; then
        echo "do stuff for macos";
    else
        echo "what should it to?";
    fi
}

#####################
# man console_codes #
#####################

function msgRed()
{
    [ -n "$*" ] && echo -e "\033[31m$*\033[0m"; return 0;
}

function msgGreen()
{
    [ -n "$*" ] && echo -e "\033[32m$*\033[0m"; return 0;
}

function msgBrown()
{
    [ -n "$*" ] && echo -e "\033[33m$*\033[0m"; return 0;
}

function msgBlue()
{
    [ -n "$*" ] && echo -e "\033[34m$*\033[0m"; return 0;
}

function msgMagenta()
{
    [ -n "$*" ] && echo -e "\033[35m$*\033[0m"; return 0;
}

function msgCyan()
{
    [ -n "$*" ] && echo -e "\033[36m$*\033[0m"; return 0;
}

function msgWhite()
{
    [ -n "$*" ] && echo -e "\033[37m$*\033[0m"; return 0;
}

# Example Usage
function usage_example_colorMsgAPIs()
{
    msgCyan    "msg-cyan"
    msgBrown   "msg-brown"
    msgRed     "msg-red"
    msgGreen   "msg-green"
    msgBlue    "msg-blue"
    msgMagenta "msg-magenta"
    msgWhite   "msg-white"

    local msg="\n"
    msg="${msg}msg: $(msgRed     red)\n"
    msg="${msg}msg: $(msgGreen   green)\n"
    msg="${msg}msg: $(msgBrown   brown)\n"
    msg="${msg}msg: $(msgBlue    blue)\n"
    msg="${msg}msg: $(msgMagenta magenta)\n"
    msg="${msg}msg: $(msgCyan    cyan)\n"
    msg="${msg}msg: $(msgWhite   white)\n"
    printf "${msg}"
}

################
# IS Functions #
################

function isYes
{
    case "$*" in
    "Y" | "y" | "YES" | "Yes" | "yes")
        return 0;; # true
    *)
        return 1;; # false
    esac
}

function isNo
{
    case "$*" in
    "" | "N" | "n" | "NO" | "No" | "no")
        return 0;; # true
    *)
        return 1;; # false
    esac
}

function isTrue
{
    case "$*" in
    "1" | "T" | "t" | "TRUE" | "True" | "true")
        return 0;; # true
    *)
        return 1;; # false
    esac
}

function isFalse
{
    case "$*" in
    "" | "0" | "F" | "f" | "FALSE" | "False" | "false")
        return 0;; # true
    *)
        return 1;; # false
    esac
}

function isOk
{
    case "$*" in
    "OK" | "Ok" | "ok")
        return 0;; # true
    *)
        return 1;; # false
    esac
}

function isError
{
    case "$*" in
    "ERROR" | "Error" | "error" | "ERR" | "Err" | "err" | "")
        return 0;; # true
    *)
        return 1;; # false
    esac
}

function isSuccess
{
    case "$*" in
    "SUCCESS" | "Success" | "success" | "SUCC" | "Succ" | "succ")
        return 0;; # true
    *)
        isOk   "${1}" && return 0; # true
        isYes  "${1}" && return 0; # true
        isTrue "${1}" && return 0; # true
        return 1;; # false
    esac
}

function isFailure
{
    case "$*" in
    "FAILURE" | "Failure" | "failure" | "FAIL" | "Fail" | "fail" | "")
        return 0;; # true
    *)
        isNo    "${1}" && return 0; # true
        isError "${1}" && return 0; # true
        isFalse "${1}" && return 0; # true
        return 1;; # false
    esac
}

# Example Usage
function usage_example_isAPIs()
{
    printf "=============================\n";
    isNo "n"    && printf "This is  no: n\n";
    isNo "N"    && printf "This is  no: N\n";
    isNo "no"   && printf "This is  no: no\n";
    isNo "No"   && printf "This is  no: No\n";
    isNo "NO"   && printf "This is  no: NO\n";
    isNo ""     && printf "This is  no: EMPTY\n";

    isYes "y"   && printf "This is yes: y\n";
    isYes "Y"   && printf "This is yes: Y\n";
    isYes "yes" && printf "This is yes: yes\n";
    isYes "Yes" && printf "This is yes: Yes\n";
    isYes "YES" && printf "This is yes: YES\n";

    printf "=============================\n";
    isTrue "1"      && printf "This is  true: 1\n";
    isTrue "t"      && printf "This is  true: t\n";
    isTrue "T"      && printf "This is  true: T\n";
    isTrue "true"   && printf "This is  true: true\n";
    isTrue "True"   && printf "This is  true: True\n";
    isTrue "TRUE"   && printf "This is  true: TRUE\n";

    isFalse "0"     && printf "This is false: 0\n";
    isFalse "f"     && printf "This is false: f\n";
    isFalse "F"     && printf "This is false: F\n";
    isFalse "false" && printf "This is false: false\n";
    isFalse "False" && printf "This is false: False\n";
    isFalse "FALSE" && printf "This is false: FALSE\n";
    isFalse ""      && printf "This is false: EMPTY\n";

    printf "=============================\n";
    isOk "ok"       && printf "This is    ok: ok\n";
    isOk "Ok"       && printf "This is    ok: Ok\n";
    isOk "OK"       && printf "This is    ok: OK\n";

    isError "err"   && printf "This is error: err\n";
    isError "Err"   && printf "This is error: Err\n";
    isError "ERR"   && printf "This is error: ERR\n";
    isError "error" && printf "This is error: error\n";
    isError "Error" && printf "This is error: Error\n";
    isError "ERROR" && printf "This is error: ERROR\n";
    isError ""      && printf "This is error: EMPTY\n";

    printf "=============================\n";
    isSuccess "succ"    && printf "This is success: succ\n";
    isSuccess "Succ"    && printf "This is success: Succ\n";
    isSuccess "SUCC"    && printf "This is success: SUCC\n";
    isSuccess "success" && printf "This is success: success\n";
    isSuccess "Success" && printf "This is success: Success\n";
    isSuccess "SUCCESS" && printf "This is success: SUCCESS\n";

    isFailure "fail"    && printf "This is failure: fail\n";
    isFailure "Fail"    && printf "This is failure: Fail\n";
    isFailure "FAIL"    && printf "This is failure: FAIL\n";
    isFailure "failure" && printf "This is failure: failure\n";
    isFailure "Failure" && printf "This is failure: Failure\n";
    isFailure "FAILURE" && printf "This is failure: FAILURE\n";
    isFailure ""        && printf "This is failure: EMPTY\n";
}

#####################
# normal prompt msg #
#####################
function errMsg
{
    [ -n "$*" ] && printf "$(msgRed ERROR): $*\n";
    return 1; # make sure return false
}

function errMsgL
{
    [ -n "$*" ] && printf "$(msgRed ERROR): $*";
    return 1; # make sure return false
}

function warnMsg
{
    [ -n "$*" ] && printf "$(msgBrown WARN): $*\n";
    return 0; # make sure return true
}

function warnMsgL
{
    [ -n "$*" ] && printf "$(msgBrown WARN): $*";
    return 0; # make sure return true
}


function infoMsg
{
    [ -n "$*" ] && printf "$(msgBlue INFO): $*\n";
    return 0; # make sure return true
}

function infoMsgL
{
    [ -n "$*" ] && printf "$(msgBlue INFO): $*";
    return 0; # make sure return true
}

IS_DEBUG_MODE=true;
function debugMsg
{
    [ -n "$*" ] && ${IS_DEBUG_MODE} && printf "$(msgMagenta DEBUG): $*\n";
    return 0; # make sure return true
}

function debugMsgL
{
    [ -n "$*" ] && ${IS_DEBUG_MODE} && printf "$(msgMagenta DEBUG): $*";
    return 0; # make sure return true
}

IS_VERBOSE_MODE=true;
function verboseMsg
{
    [ -n "$*" ] && ${IS_VERBOSE_MODE} && infoMsg "$*";
    return 0; # make sure return true
}

function verboseMsgL
{
    [ -n "$*" ] && ${IS_VERBOSE_MODE} && infoMsgL "$*";
    return 0; # make sure return true
}

function invalidArgs
{
    [ -n "$*" ] && errMsg "Invalid arguments for $*";
    return 1; # make sure return false
}

function keyMsg
{
    [ -n "$*" ] && printf "$(msgBrown $*)";
    return 0; # make sure return true
}

function valMsg
{
    [ -n "$*" ] && printf "$(msgGreen $*)";
    return 0; # make sure return true
}

# Example Usage
function usage_example_msgAPIs()
{
    IS_DEBUG_MODE=false;
    IS_VERBOSE_MODE=false;
    verboseMsg  "This should not show - verboseMsg";
    debugMsg    "This should not show - debugMsg";
    IS_DEBUG_MODE=true;
    IS_VERBOSE_MODE=true;
    debugMsg    "This is message: $(keyMsg debug)";
    verboseMsg  "This is message: $(keyMsg verbose)";
    infoMsg     "This is message: $(keyMsg info)";
    warnMsg     "This is message: $(keyMsg warn)";
    errMsg      "This is message: $(keyMsg error)" || true;
    invalidArgs "$(keyMsg NAME): has unknown values $(valMsg xxx)" || true;
}

###############
# MIN/MAX/SUM #
###############
function minNum
{
    _min_=${1};
    for i in $@; do
        if [ ${_min_} -gt ${i} ];then
            _min_=${i}
        fi
    done
    echo ${_min_};
}

function maxNum
{
    _max_=${1};
    for i in $@; do
        if [ $_max_ -lt ${i} ];then
            _max_=${i};
        fi
    done
    echo ${_max_};
}

function sumNum
{
    _sum_=0;
    for i in $@; do
        let _sum_+=i;
    done
    echo ${_sum_};
}

# Example Usage
function usage_example_numAPIs()
{
    Nums="05 156 -125 82 32 11 0 15 23 56 182 -1 34 -54 40 -115";
    echo "Min: $(minNum ${Nums})";
    echo "Max: $(maxNum ${Nums})";
    echo "Sum: $(sumNum ${Nums})";
}
