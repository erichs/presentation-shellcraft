#!/bin/bash
for f in about author example group param version
do
    eval "$f() { :; }"
done
unset f
cite ()
{
    about 'creates one or more meta keywords for use in your functions';
    param 'one or more keywords';
    example '$ cite url username';
    example '$ url http://somewhere.com';
    example '$ username alice';
    group 'composure';
    if [ -z "$1" ]; then
        printf '%s\n' 'missing parameter(s)';
        reference cite;
        return;
    fi;
    typeset keyword;
    for keyword in $*;
    do
        eval "$keyword() { :; }";
    done
}
lastcol ()
{
    about 'shows last column of text';
    group 'demo';
    awk '{print $NF}'
}
macaddr ()
{
    about 'shows mac address for net interface';
    param '1: net intface';
    example '$ macaddr eth0';
    group 'demo';
    ifconfig $1 | grep ether | lastcol | uppercase
}
uppercase ()
{
    about 'makes text UPPERCASE';
    group 'demo';
    tr '[:lower:]' '[:upper:]'
}

macaddr $*
