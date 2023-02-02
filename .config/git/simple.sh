#!/bin/env bash

PS1='\n\e[33m[\e[36m \w \033[33m]\e[31m$(__git_ps1)'$'\n'"$ \e[32m"
trap "echo -en '\033[0m'" DEBUG
