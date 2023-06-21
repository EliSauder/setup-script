#!/usr/bin/env bash
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

THEME_CHECK_SUDO=${THEME_CHECK_SUDO:=true}

# Nicely formatted terminal prompt
function prompt_command(){
    if ! sudo -n uptime 2>&1 | grep -q "load"; then
        export PS1="\n${bold_black}[${blue}\T${bold_black}]-${bold_black}[${green}\u${yellow}@${green}\h${bold_black}]-${bold_black}[${purple}\w${bold_black}]-$(scm_prompt_info)\n${reset_color}\$ "
    else
        export PS1="\n${bold_black}[${blue}\T${bold_black}]-${bold_black}[${orange}\u${yellow}@${orange}\h${bold_black}]-${bold_black}[${purple}\w${bold_black}]-$(scm_prompt_info)\n${reset_color}\$ "
    fi
}

safe_append_prompt_command prompt_command
