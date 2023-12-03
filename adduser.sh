#!/usr/bin/env bash

read -p ""$(echo -e "\e[1m\e[32m$(whoami)\e[0m")" "$(echo -e "\e[1m\e[34m$(pwd)\e[0m")" [USERNAME] > " USERNAME
read -p ""$(echo -e "\e[1m\e[32m$(whoami)\e[0m")" "$(echo -e "\e[1m\e[34m$(pwd)\e[0m")" [MOUNTED PATH] > " MOUNTED
echo -e "PWD : \e[1m\e[31m$MOUNTED/$USERNAME\e[0m"
read -p ""$(echo -e "\e[1m\e[32m$(whoami)\e[0m")" "$(echo -e "\e[1m\e[34m$(pwd)\e[0m")" IS THAT CORRECT ? [Y/n] > " CORRECT

    if [[ $CORRECT == "y" || $CORRECT == "Y" ]]; then
        sudo useradd -m -d ${MOUNTED}/${USERNAME} -s /bin/zsh ${USERNAME}
        sudo passwd ${USERNAME}
        sudo usermod -aG sudo ${USERNAME}
        else
        exit 1
    fi

read -p ""$(echo -e "\e[1m\e[32m$(whoami)\e[0m")" "$(echo -e "\e[1m\e[34m$(pwd)\e[0m")" [THEMES PATH] > " THEMES

sudo cp -r ${THEMES}/.oh-my-zsh ${MOUNTED}/${USERNAME}/
sudo cp ${THEMES}/.zshrc ${MOUNTED}/${USERNAME}/
sudo cp ${THEMES}/.p10k.zsh ${MOUNTED}/${USERNAME}/
sudo chown -R ${USERNAME}:${USERNAME} ${MOUNTED}/${USERNAME}/.oh-my-zsh
sudo chown ${USERNAME}:${USERNAME} ${MOUNTED}/${USERNAME}/.zshrc
sudo chown ${USERNAME}:${USERNAME} ${MOUNTED}/${USERNAME}/.p10k.zsh

source ${MOUNTED}/${USERNAME}/.zshrc

echo -e "SWICH USER : \e[1m\e[31msu - $USERNAME\e[0m"
