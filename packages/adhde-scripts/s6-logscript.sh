#!/bin/execlineb -S1

multisubstitute {
  define svc $1
  importas -S HOME
}

importas -SD ${HOME}/.config XDG_CONFIG_HOME
envfile -I ${XDG_CONFIG_HOME}/s6/config/${svc}.conf

multisubstitute {
  importas -S XDG_RUNTIME_DIR
  importas -SsCuD "n3 s2000000 T" DIRECTIVES
}

define log_dir ${XDG_RUNTIME_DIR}/s6/log/${svc}

foreground { install -d $log_dir }
s6-log -b -d3 -- ${DIRECTIVES} $log_dir

