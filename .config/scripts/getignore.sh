#!/bin/bash
#---------------------------------------
# Gets .gitignore from github
# Arguments : none
#
# Author : Prashantha TP
# Date : February 13 2022 Sunday
# License : MIT
#---------------------------------------
supportedLanuguages=('
AL
Actionscript
Ada
Agda
Android
AppEngine
AppceleratorTitanium
ArchLinuxPackages
Autotools
C
CFWheels
CMake
CUDA
CakePHP
ChefCookbook
Clojure
CodeIgniter
CommonLisp
Composer
Concrete5
Coq
Update Coq
CraftCMS
D
DM
Dart
Delphi
Drupal
EPiServer
Eagle
Elisp
Elixir
Elm
Erlang
ExpressionEngine
ExtJs
Fancy
Finale
FlaxEngine
ForceDotCom
Fortran
FuelPHP
update FuelPHP
GWT
Gcov
GitBook
Go
Godot
Gradle
Update Gradle
Grails
Haskell
IGORPro
Create IGORPro
Idris
JBoss
JENKINS_HOME
Java
Jekyll
Joomla
Julia
KiCad
Kohana
Kotlin
LabVIEW
Laravel
Leiningen
LemonStand
Lilypond
Lithium
Lua
Magento
Maven
Mercury
MetaProgrammingSystem
Nanoc
Nim
Node
OCaml
Objective-C
Opa
Added Opa
OpenCart
OracleForms
Packer
Perl
Fix typo of Perl
Phalcon
PlayFramework
Plone
Prestashop
Processing
PureScript
Python
Qooxdoo
Qt
R
ROS
Rails
Raku
RhodesRhomobile
Ruby
Rust
SCons
Sass
Scala
Scheme
Scrivener
Sdcc
SeamGen
SketchUp
Smalltalk
Stella
SugarCRM
Swift
Symfony
SymphonyCMS
TeX
Terraform
Textpattern
TurboGears2
TwinCAT3
Typo3
Unity
UnrealEngine
VVVV
VisualStudio
Waf
WordPress
Xojo
Yeoman
Yii
ZendFramework
Zephir
'
)

function getGitIgnore(){
    curl "https://raw.githubusercontent.com/github/gitignore/main/${1}.gitignore"
}

selectedLanguage="$(echo "${supportedLanuguages}" | fzy)"

printf -- "-%.0s" {1..21}
echo ""

if [[ -f ".gitignore" ]];then
    tput setaf 9;
    echo "Do you want to overwrite .gitignore ? "
    tput setaf 15;
    echo "Y/y : Yes, Overwrite existing .gitignore"
    echo "N/n : No, Append existing .gitignore"
    echo "Q/q : Quit the program"
    tput setaf 9;
    read -p  "[Y/y/N/n/Q/q] : "
    case $REPLY in
        y|Y|yes)
            echo "Overwriting .gitignore";
            tput setaf 3;
            getGitIgnore "${selectedLanguage}" > .gitignore;
            tput sgr0;
            echo "Done."
            ;;
        n|N|no)
            echo "Appending existing .gitignore";
            getGitIgnore "${selectedLanguage}" >> .gitignore
            ;;
        q|Q|quit)
             tput setaf 4;
             echo "exiting...";
             tput sgr0;
             exit 0;
             ;;
            *)
            echo "Invalid choice..."
            exit 1;
        esac
else
 getGitIgnore "${selectedLanguage}" > .gitignore
 tput sgr0;
 echo "Done"
fi

printf -- "-%.0s" {1..21}
echo ""

tput setaf 4;
echo -e "\nDisplaying top portion of .gitignore"
tput setaf 6;
head -n5 .gitignore
tput sgr0;

